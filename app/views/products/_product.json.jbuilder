json.extract! product, :id, :product_name, :product_image, :price, :product_description, :quantity, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
