ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "074134012d36e72310f85d4f61efaeed"
  config.secret = "0b7658c1a862e74c0659b7f559976622"
  config.scope = "read_orders, read_products, write_orders, write_products, read_content, write_content,
                  read_customers, write_customers, read_analytics, read_price_rules, write_price_rules,
                  read_reports, write_reports, read_checkouts, write_checkouts, read_script_tags, write_script_tags,
                  read_fulfillments, write_fulfillments, read_shipping, write_shipping"
  config.embedded_app = true
end
