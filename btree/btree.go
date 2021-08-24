// Demonstrative Btree implementation in Go.
//
package main
import "fmt"
import "time"
import "math/rand"

// The Tree Node object
type BtNode struct {
    value int
    quantity int
    left  *BtNode
    right *BtNode
}

// BtNode Costructor
func NewBtNode() BtNode {
    return BtNode{ 0, 0, nil, nil }
}

// Check if BtNode is empty
func (n BtNode) is_empty() bool {
    return n.quantity <= 0
}

// Get BtNode ready to use
func (n *BtNode) initialize(value int) {
    n.value = value
    n.quantity = 1
    n.left = &BtNode{}
    n.right = &BtNode{}
}

// Insert a new item on the tree
func (n *BtNode) insert(new_number int) {
    if n.is_empty() {
        n.initialize(new_number)
    } else if new_number == n.value {
        n.quantity++
    } else if new_number < n.value {
        n.left.insert(new_number)
    } else {
        n.right.insert(new_number)
    }
}

// Search for first occurrence of target in tree, 
// returns how many steps it took to find it, return -1 if cant find none
func (n *BtNode) search(target int, depth int) int{
    if target == n.value {
        return depth
    } else if target < n.value && !n.left.is_empty() {
        depth++
        return n.left.search(target, depth)
    } else if !n.right.is_empty() {
        depth++
        return n.right.search(target, depth)
    } else {
        return -1
    }
}

// Prints all the values on the tree in order
func transversal(node *BtNode) {
    if !node.is_empty() {
        transversal(node.left)
        for i:=0; i<node.quantity; i++ {
            fmt.Println(node.value)
        }
        transversal(node.right)
    }
}

// Prints all the values InPlace Transversal
func traversal_inplace(node *BtNode) {
    if !node.is_empty() {
        for i:=0; i<node.quantity; i++ {
            fmt.Println(node.value)
        }
        traversal_inplace(node.left)
        traversal_inplace(node.right)
    }
}

// Prints all the values PostOrder Transversal
func traversal_postorder(node *BtNode) {
    if !node.is_empty() {
        traversal_inplace(node.left)
        traversal_inplace(node.right)
        for i:=0; i<node.quantity; i++ {
            fmt.Println(node.value)
        }
    }
}

func main() {
    rand.Seed(time.Now().UnixNano())
    // input parameters
    items_qty := 20
    values_upto := 20
    
    tree := BtNode{}
    for i:=0; i<items_qty; i++ {
        number := rand.Intn(values_upto-0) + 0
        tree.insert(number)
    }
    fmt.Println("Transversal InOrder")
    transversal(&tree)

    // fmt.Println("PostOrder")
    // traversal_postorder(&tree)

    // fmt.Println("InPlace")
    // traversal_inplace(&tree)
    
    target := rand.Intn(values_upto-0) + 0
    found := tree.search(target, 0)
    if found > 0 {
        fmt.Println("We found ",target, "! It took ",
                    found, " steps to find it.")
    } else {
        fmt.Println("The target", target, " was not found.")
    }
}
