<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

// Enable error reporting for debugging purposes
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    include('./db.php');
    
    // Connect to the database
    $host = 'localhost';
    $dbname = 'biz_store'; // Change this if using a different database for delivery orders
    $username = 'root';
    $password = '';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Get the form data
        $delivery_address = $_POST['delivery-address'] ?? null;
        $delivery_city = $_POST['delivery-city'] ?? null;
        $total_amount = $_POST['total-amount'] ?? null;
        $transaction_ref = $_POST['transactionRef'] ?? null;
        

        // Validate the form data
        // if (!$delivery_address || !$delivery_city || !$total_amount) {
        //     echo json_encode(['success' => false, 'message' => 'All fields are required.']);
        //     http_response_code(400);
        //     exit();
        // }

        // Insert the data into the database
        $stmt = $pdo->prepare("INSERT INTO delivery_ordes (delivery_address, delivery_city, total_amount, transaction_ref) VALUES (:delivery_address, :delivery_city, :total_amount, :transaction_ref)");
        
        $execute_success = $stmt->execute([
            ':delivery_address' => $delivery_address,
            ':delivery_city' => $delivery_city,
            ':total_amount' => $total_amount,
            ':transaction_ref' => $transaction_ref
        ]);

        if ($execute_success) {
            // Respond with a success message
            echo json_encode(['success' => true, 'message' => 'Delivery order submitted successfully!']);
        } else {
            // Respond with an error message if the execution failed
            echo json_encode(['success' => false, 'message' => 'Failed to insert delivery order into the database.']);
            http_response_code(500);
        }

    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
        http_response_code(500);
    }
} else {
    // Handle other request types (e.g., GET)
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    http_response_code(405);
}
?>
