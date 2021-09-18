// simple Btree implementation in typescript.

// The Binary Tree Node
class BtNode {
    value:number;
    quantity:number = 0;
    left:BtNode;
    right:BtNode;

    // Get BtNode ready to use
    initialize(value:number){
        this.value = value;
        this.quantity = 1;
        this.left = new BtNode();
        this.right = new BtNode();
    }

    // Insert a new item on the tree
    insert(new_number:number) {   
        if (this.quantity <= 0) {
            this.initialize(new_number)
        } else if (new_number == this.value) {
            this.quantity++
        } else if (new_number < this.value) {
            this.left.insert(new_number)
        } else {
            this.right.insert(new_number)
        }
    }
    
    // Search for first occurrence of target in tree, 
    // returns how many steps it took to find it, return -1 if cant find none
    search(target:number, depth:number=0): number {
        if (target == this.value) {
            return depth;
        } else if (target < this.value && this.left.quantity > 0) {
            depth++;
            return this.left.search(target, depth);
        } else if (this.right.quantity > 0) {
            depth++;
            return this.right.search(target, depth);
        } else {
            return -1;
        }
    }
}

// Prints all the values on the tree in order
function transversal(node:BtNode) {
    if (node.quantity > 0) {
        transversal(node.left)
        for (var i=0; i<node.quantity; i++){
            console.log(node.value);
        }
        transversal(node.right)
    }
}

// Main function
function main(){
    // input parameters
    var items_qty:number = 20;
    var value_upto:number = 20;
    var btree:BtNode;
    var i:number;
    var value:number;
    // insert items
    btree = new BtNode();
    for (i=0; i<items_qty; i++) {
        value = Math.floor(Math.random() * value_upto);
        btree.insert(value)
    }
    // do a transversal walk by
    transversal(btree)
    // search
    var target:number = Math.floor(Math.random() * value_upto);
    var found:number = btree.search(target);
    if (found > 0) {
        console.log("We found " + target + "! It took " +
                    found + " steps to find it.")
    } else {
        console.log("The target " + target + " was not found.")
    }
}

main();
