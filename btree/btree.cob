        *> Implementation of a Binary Tree in Cobol
        IDENTIFICATION DIVISION.
            PROGRAM-ID. btree.
            AUTHOR. Gustavo Selbach Teixeira (gsteixei@gmail.com)
            DATE-WRITTEN. 2021-08-24
            DATA DIVISION.
                WORKING-STORAGE SECTION.
                    01 auxiliary_vars.
                        05 i                PIC 99 VALUE ZEROS.
                        05 input_value      PIC 999 VALUE ZEROS.
                        05 seed             PIC S9(9) BINARY.
                        05 datetime         PIC X(21).
                    
                    01  some_pointers.
                        05 root_node_ptr    USAGE IS POINTER VALUE NULL.
                    01 btree_node BASED.
                        05 node_value       PIC 999 VALUE ZEROS.
                        05 node_quantity    PIC 9 VALUE ZEROS.
                        05 node_left        USAGE IS POINTER VALUE NULL.
                        05 node_right       USAGE IS POINTER VALUE NULL.
            PROCEDURE DIVISION.
            mainline.
                *> instantiate the root node
                ALLOCATE btree_node INITIALIZED RETURNING root_node_ptr.
                *> insert random numbers on the tree
                MOVE FUNCTION CURRENT-DATE TO datetime.
                MOVE datetime(8:9) TO seed.
                COMPUTE input_value = FUNCTION RANDOM(seed).
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > 15
                    COMPUTE input_value = FUNCTION RANDOM * (99 - 1 + 1) + 1
                    CALL 'btree_insert' USING root_node_ptr, input_value
                END-PERFORM.
                *> Transverse the tree in order
                CALL 'btree_transversal' USING root_node_ptr.
            STOP RUN.
        END PROGRAM btree.
        
        *> insert a value into BTree
        IDENTIFICATION DIVISION.
            PROGRAM-ID. btree_insert IS RECURSIVE.
            DATA DIVISION.
                WORKING-STORAGE SECTION.
                    *> we need two similar structs to instantiate node childs
                    01 btree_node BASED.
                        05 node_value           PIC 999 VALUE ZEROS.
                        05 node_quantity        PIC 9 VALUE ZEROS.
                        05 node_left            USAGE IS POINTER VALUE NULL.
                        05 node_right           USAGE IS POINTER VALUE NULL.
                    01 temp_node BASED.
                        05 temp_node_value      PIC 999 VALUE ZEROS.
                        05 temp_quantity        PIC 9 VALUE ZEROS.
                        05 temp_left            USAGE IS POINTER VALUE NULL.
                        05 temp_right           USAGE IS POINTER VALUE NULL.
                LINKAGE SECTION.
                    01 node_pointer             USAGE IS POINTER VALUE NULL.
                    01 the_number               PIC 999 VALUE ZEROS.
            PROCEDURE DIVISION USING node_pointer, the_number.
            mainline.
                SET ADDRESS OF btree_node TO node_pointer.
                    EVALUATE TRUE
                        WHEN node_quantity < 1
                            *> initialize the node
                            MOVE the_number TO node_value
                            MOVE 1 TO node_quantity
                            ALLOCATE temp_node INITIALIZED RETURNING node_left
                            ALLOCATE temp_node INITIALIZED RETURNING node_right
                        WHEN the_number < node_value
                            CALL 'btree_insert' USING node_left, the_number
                        WHEN the_number > node_value
                            CALL 'btree_insert' USING node_right, the_number
                        WHEN the_number = node_value
                            ADD 1 TO node_quantity
                    END-EVALUATE
                GOBACK.
            display_node. *> useful for debugging
                DISPLAY " Value: " node_value " qty; " node_quantity.
                DISPLAY " Node: " node_pointer " left: " node_left
                        " right: " node_right END-DISPLAY.
        END PROGRAM btree_insert.

        *> In Order Transersal of BTree
        IDENTIFICATION DIVISION.
            PROGRAM-ID. btree_transversal IS RECURSIVE.
            DATA DIVISION.
                LOCAL-STORAGE SECTION.
                    01 i                    PIC 99 VALUE ZEROS.
                    01 node_pointer         USAGE IS POINTER VALUE NULL.
                    01 btree_node BASED.
                        05 node_value       PIC 999 VALUE ZEROS.
                        05 node_quantity    PIC 9 VALUE ZEROS.
                        05 node_left        USAGE IS POINTER VALUE NULL.
                        05 node_right       USAGE IS POINTER VALUE NULL.
                LINKAGE SECTION.
                    01 arg_pointer          USAGE IS POINTER VALUE NULL.
            PROCEDURE DIVISION USING arg_pointer.
                SET ADDRESS OF btree_node TO arg_pointer.
                IF node_quantity > 0 THEN
                    CALL 'btree_transversal' USING node_left
                    SET ADDRESS OF btree_node TO arg_pointer
                    PERFORM VARYING i FROM 1 BY 1 UNTIL i > node_quantity
                        DISPLAY "# " node_value
                    END-PERFORM
                    CALL 'btree_transversal' USING node_right
                END-IF.
            EXIT PROGRAM.
        END PROGRAM btree_transversal.
