<?php
// Get the JSON data
$data = json_decode(file_get_contents('php://input'), true);

// Process the data (e.g., save to session or database)
if ($data) {
    session_start();
    $_SESSION['cart'][] = $data; // Store the product details in the session

    // Respond with success
    echo json_encode(['status' => 'success', 'message' => 'Product added to cart']);
} else {
    // Respond with error
    echo json_encode(['status' => 'error', 'message' => 'Failed to add product to cart']);
}
?>
