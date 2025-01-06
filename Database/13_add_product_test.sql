-- Category names: clothing, footwear, tactical equipment

-- 1. valid values
BEGIN
  pkg_product.add_product(p_name             => 'bulletproof vest'
                       ,p_category           => 'tactical equipment'
                       ,p_size               => 'XXL'
                       ,p_quantity           => '30'
                       ,p_measurement_unit   => 'ea'
                       ,p_price              => '33200'
                       ,p_min_stock_level    => '15'
                       ,p_max_stock_level    => '120');
  
END;

-- 2. Price is 0 (also handles error if min_stock_level or quantity is 0)
BEGIN
  pkg_product.add_product(p_name             => 'bulletproof vest'
                       ,p_category           => 'tactical equipment'
                       ,p_size               => 'S'
                       ,p_quantity           => '40'
                       ,p_measurement_unit   => 'ea'
                       ,p_price              => '0'
                       ,p_min_stock_level    => '15'
                       ,p_max_stock_level    => '100');
  
END;

-- 3. max_stock_level is lesser then min_stock_level
BEGIN
  pkg_product.add_product(p_name             => 'bulletproof vest'
                       ,p_category           => 'tactical equipment'
                       ,p_size               => 'S'
                       ,p_quantity           => '30'
                       ,p_measurement_unit   => 'ea'
                       ,p_price              => '30000'
                       ,p_min_stock_level    => '25'
                       ,p_max_stock_level    => '20');
  
END;

-- 4. Wrong product category
BEGIN
  pkg_product.add_product(p_name             => 'camouflage tent'
                       ,p_category           => 'jewellery'
                       ,p_size               => 'S'
                       ,p_quantity           => '30'
                       ,p_measurement_unit   => 'ea'
                       ,p_price              => '30000'
                       ,p_min_stock_level    => '25'
                       ,p_max_stock_level    => '50');
  
END;
