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
    $dbname = 'biz_store';
    $username = 'root';
    $password = '';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Get the form data
        $full_name = $_POST['firstname'] ?? null;
        $email = $_POST['email'] ?? null;
        $address = $_POST['address'] ?? null;
        $city = $_POST['city'] ?? null;
        $state = $_POST['state'] ?? null;
        $zip = $_POST['zip'] ?? null;
        $transaction_ref = $_POST['transactionRef'] ?? null;
        $total_amount = $_POST['totalAmount'] ?? null;

        // Get the products array
        $products = $_POST['products'] ?? [];

        // Prepare the SQL statement for inserting products
        $stmt = $pdo->prepare("INSERT INTO orders (product_name, product_price, product_color, full_name, email, address, city, state, zip, transaction_ref, total_amount) VALUES (:product_name, :product_price, :product_color, :full_name, :email, :address, :city, :state, :zip, :transaction_ref, :total_amount)");

        // Loop through each product and insert it into the database
        foreach ($products as $product) {
            $product_name = $product['name'] ?? null;
            $product_price = $product['price'] ?? null;
            $product_color = $product['color'] ?? null;

            $execute_success = $stmt->execute([
                ':product_name' => $product_name,
                ':product_price' => $product_price,
                ':product_color' => $product_color,
                ':full_name' => $full_name,
                ':email' => $email,
                ':address' => $address,
                ':city' => $city,
                ':state' => $state,
                ':zip' => $zip,
                ':transaction_ref' => $transaction_ref,
                ':total_amount' => $total_amount
            ]);

            if (!$execute_success) {
                echo json_encode(['success' => false, 'message' => 'Failed to insert order into the database.']);
                http_response_code(500);
                exit;
            }
        }

        // Respond with a success message after all products are inserted
        echo json_encode(['success' => true, 'message' => 'Order submitted successfully!']);

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
