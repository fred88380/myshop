<?php
include('db.php');

// Traitement des paramètres GET avec validation et assainissement
$search = '';
$orderby = 'id';
$direction = 'ASC';
$productsPerPage = 10;  

// Sécurisation de la recherche
if (isset($_GET['search'])) {
    $search = htmlspecialchars(trim($_GET['search']));
}

// Sécurisation de l'ORDERBY (colonne autorisée)
$validOrderColumns = ['id', 'name', 'price', 'quantity', 'category_name']; // Utilisation du nom de la catégorie
if (isset($_GET['orderby']) && in_array($_GET['orderby'], $validOrderColumns)) {
    $orderby = $_GET['orderby'];
}

// Sécurisation de la direction (ASC ou DESC)
if (isset($_GET['direction']) && in_array($_GET['direction'], ['ASC', 'DESC'])) {
    $direction = $_GET['direction'];
}

// Sécurisation de la page (doit être un entier positif)
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) {
    header("Location: ./?page=1&search=" . urlencode($search) . "&orderby=" . $orderby . "&direction=" . $direction);
    exit;
}

// Vérification du nombre total de produits
$query = "SELECT COUNT(*) FROM products WHERE name LIKE :search";
$stmt = $pdo->prepare($query);
$stmt->execute(['search' => "%$search%"]);
$totalProducts = $stmt->fetchColumn();

// Calcul du nombre total de pages
$totalPages = ceil($totalProducts / $productsPerPage);
if ($page > $totalPages) {
    header("Location: ./?page=1&search=" . urlencode($search) . "&orderby=" . $orderby . "&direction=" . $direction);
    exit;
}

// Calcul de l'offset pour la pagination
$offset = ($page - 1) * $productsPerPage;

// Requête SQL avec une **jointure** pour récupérer le **nom** de la catégorie
$query = "
    SELECT products.*, categories.name AS category_name 
    FROM products 
    LEFT JOIN categories ON products.category = categories.id 
    WHERE products.name LIKE :search 
    ORDER BY $orderby $direction 
    LIMIT :limit OFFSET :offset
";
$stmt = $pdo->prepare($query);
$stmt->bindValue(':search', "%$search%");
$stmt->bindValue(':limit', $productsPerPage, PDO::PARAM_INT);
$stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
$stmt->execute();
$products = $stmt->fetchAll();

// Fonction pour inverser la direction du tri
function getNewDirection($currentOrderby, $selectedColumn, $currentDirection) {
    return ($currentOrderby === $selectedColumn) ? ($currentDirection === 'ASC' ? 'DESC' : 'ASC') : 'ASC';
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des produits</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <main class="container">
        <div class="row">
            <section class="col-12">
                <h1><a class="link-unstyled" href="./">Liste des produits</a></h1>
                <section class="row mb-3">
                    <form class="col-md-4 d-flex gap-2" method="GET">
                        <input type="search" class="form-control" name="search" value="<?= htmlspecialchars($search) ?>" placeholder="Rechercher un produit">
                        <button type="submit" class="btn btn-primary">Rechercher</button>
                        <input type="hidden" name="csrf_token" value="<?= $_SESSION['csrf_token'] ?>">
                    </form>
                    <div class="col-md-8"></div>
                </section>

                <!-- Tableau des produits -->
                <table class="table">
                    <thead>
                        <tr>
                            <?php 
                            $columns = [
                                'id' => 'ID',
                                'name' => 'Libellé',
                                'price' => 'Prix',
                                'quantity' => 'Quantité',
                                'category_name' => 'Catégorie' // Utilisation du **nom** et non l'ID
                            ];
                            
                            foreach ($columns as $col => $label): 
                                $newDirection = getNewDirection($orderby, $col, $direction);
                            ?>
                                <th class="text-center">
                                    <?= $label ?>
                                    <a class="btn btn-sm <?= ($orderby === $col && $direction === 'ASC') ? 'btn-primary' : 'btn-secondary' ?>" 
                                       href="./?orderby=<?= $col ?>&direction=ASC&search=<?= urlencode($search) ?>">
                                       <i class="bi-arrow-up"></i>
                                    </a>
                                    <a class="btn btn-sm <?= ($orderby === $col && $direction === 'DESC') ? 'btn-primary' : 'btn-secondary' ?>" 
                                       href="./?orderby=<?= $col ?>&direction=DESC&search=<?= urlencode($search) ?>">
                                       <i class="bi-arrow-down"></i>
                                    </a>
                                </th>
                            <?php endforeach; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($products as $product): ?>
                            <tr>
                                <td class="text-end"><?= htmlspecialchars($product['id']) ?></td>
                                <td class="text-start"><?= htmlspecialchars($product['name']) ?></td>
                                <td class="text-end"><?= htmlspecialchars($product['price']) ?>&nbsp;€</td>
                                <td class="text-center"><?= htmlspecialchars($product['quantity']) ?></td>
                                <td class="text-center"><?= htmlspecialchars($product['category_name']) ?></td> <!-- NOM au lieu de l'ID -->
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>

                <!-- Pagination -->
                <nav>
                    <ul class="pagination">
                        <li class="page-item <?= ($page == 1) ? 'disabled' : '' ?>">
                            <a class="page-link" href="./?page=<?= $page - 1 ?>&search=<?= urlencode($search) ?>&orderby=<?= $orderby ?>&direction=<?= $direction ?>">&lt;</a>
                        </li>

                        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
                            <li class="page-item <?= ($page == $i) ? 'active' : '' ?>">
                                <a class="page-link" href="./?page=<?= $i ?>&search=<?= urlencode($search) ?>&orderby=<?= $orderby ?>&direction=<?= $direction ?>"><?= $i ?></a>
                            </li>
                        <?php endfor; ?>

                        <li class="page-item <?= ($page == $totalPages) ? 'disabled' : '' ?>">
                            <a class="page-link" href="./?page=<?= $page + 1 ?>&search=<?= urlencode($search) ?>&orderby=<?= $orderby ?>&direction=<?= $direction ?>">&gt;</a>
                        </li>
                    </ul>
                </nav>
            </section>
        </div>
    </main>
</body>
</html>
