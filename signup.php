<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') { // Un-commented this line
    $data = json_decode(file_get_contents("php://input"), true);

    if (!$data || !isset($data['email']) || !isset($data['password'])) {
        echo json_encode(['error' => 'Invalid input']);
        http_response_code(400);
        exit();
    }

    session_start();
    include('db.php');

    $pdo = new PDO('mysql:host=localhost;dbname=biz_store', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $email = $data['email'];
    $password = $data['password'];

    // Check if the email is already registered
    $stmt = $pdo->prepare('SELECT COUNT(*) FROM users WHERE email = :email');
    $stmt->execute(['email' => $email]);
    $emailExists = $stmt->fetchColumn();

    if ($emailExists) {
        echo json_encode(['error' => 'Email is already taken.']);
        http_response_code(409);
    } else {
        // Insert new user into the database
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
        $stmt = $pdo->prepare('INSERT INTO users (email, password) VALUES (:email, :password)');
        $signupSuccess = $stmt->execute(['email' => $email, 'password' => $hashedPassword]);

        if ($signupSuccess) {
            $_SESSION['user_id'] = $pdo->lastInsertId();
            echo json_encode(['message' => 'Signup successful!', 'token' => 'example-jwt-token']); // Replace with actual JWT token
            http_response_code(201);
        } else {
            echo json_encode(['error' => 'Signup failed. Please try again.']);
            http_response_code(500);
        }
    }
} else {
    echo json_encode(['error' => 'Invalid request method']);
    http_response_code(405);
}
?>
