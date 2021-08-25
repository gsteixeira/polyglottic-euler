#!/usr/bin/Rscript
# Implementation of a Binary Tree in R
#
# This is done for educational and entertainment purposes only. 
# R doesn't need this and probably there is a better way to do it.
#

# use a dataframe to hold tree nodes and their data.
# The trick here is that we'll use the "pk" to hold a reference to a node.
# When we need to search for a node, query the index that holds the node.
ROOT_NODE = 0
btree = data.frame(
            pk=c(ROOT_NODE),
            value=c(0),
            quantity=c(0),
            left=c(-1),
            right=c(-1)
            )

get_node<-function(current_node) {
    # Returns a node given it's key
    return(btree[btree$pk == current_node,])
}

get_node_idx<-function(current_node) {
    # Returns the index of a node
    return(which(btree$pk == current_node))
}

insert<-function(current_node, number) {
    # Insert a number into the Tree
    # as R has no pointers, we will use a data.frame to keep Node's information.
    node <- get_node(current_node)
    idx <- get_node_idx(current_node)
    if (node$quantity < 1) {
        btree$value[idx] <- number
        btree$quantity[idx] <- 1
        # add two nodes to btree storage
        next_pk = length(btree$pk) + 1
        btree$left[idx] <- next_pk
        btree$right[idx] <- next_pk + 1
        new_nodes = data.frame(
                pk=c(next_pk, next_pk+1),
                value=0,
                quantity=0,
                left=-1, 
                right=-1)
        .GlobalEnv$btree <- rbind(btree, new_nodes)
    } else if (number == node$value) {
        .GlobalEnv$btree$quantity[idx] = node$quantity + 1
    } else if (number < node$value) {
        insert(node$left, number)
    } else {
        insert(node$right, number)
    }
}

transversal<-function(current_node){
    # Show values from tree in order
    node <- get_node(current_node)
    if (node$quantity > 0){
        transversal(node$left)
        for (i in 0:node$quantity){
            print(node$value)
        }
        transversal(node$right)
    }
}

search<-function(current_node, target, depth=0) {
    # Search from a value inside the tree, If it finds, returns how many steps
    # it took to find it. If cant find the value, returns -1
    node <- get_node(current_node)
    left_node <- get_node(node$left)
    if (target == node$value) {
        return(depth)
    } else if (target < node$value && left_node$quantity > 0) {
        depth = depth + 1
        return(search(node$left, target, depth))
    } else if (node$quantity > 0) {
        depth = depth + 1
        return(search(node$right, target, depth))
    } else {
        return(-1)
    }
}

# we like to keep things formal, R has no main, so we do it anyway.
main<-function(){
    # Insert random numbers into tree
    for (i in 1:items_qty) {
        insert(ROOT_NODE, sample(1:values_upto, 1))
    }
    # display tree in order
    transversal(ROOT_NODE)
    # search for random value
    target <- sample(1:values_upto, 1)
    found <- search(ROOT_NODE, target)
    if (found > -1) {
        cat("We found", target,"! It took", found ,"steps to find it.", "\n")
    } else {
        cat("The target", target, "was not found.\n")
    }
    # show results
    # print(btree[btree$left > -1,])
    # summary(btree[btree$left > -1,])
}

# input parameters
items_qty = 10;
values_upto = 90;

main()
