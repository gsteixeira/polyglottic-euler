// Demonstrative Btree implementation in Nodejs.

// The Binary Tree Node
class BtNode {
    value;
    quantity = 0;
    left;
    right;

    // Get BtNode ready to use
    initialize(number){
        this.value = number;
        this.quantity = 1;
        this.left = new BtNode();
        this.right = new BtNode();
    }

    // Insert a new item on the tree
    insert(new_number) {   
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
    search(target, depth){
        if (depth == undefined) { depth = 0; }
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
function transversal(node) {
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
    var items_qty = 20;
    var value_upto = 20;
    // insert items
    btree = new BtNode();
    for (var i=0; i<items_qty; i++) {
        var number = Math.floor(Math.random() * value_upto);
        btree.insert(number)
    }
    // do a transversal walk by
    transversal(btree)
    // search
    var target = Math.floor(Math.random() * value_upto);
    var found = btree.search(target);
    if (found > 0) {
        console.log("We found " + target + "! It took " +
                    found + " steps to find it.")
    } else {
        console.log("The target " + target + " was not found.")
    }
}

main();
