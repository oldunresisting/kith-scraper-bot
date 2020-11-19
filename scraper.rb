require 'httparty'
require 'json'
require 'discordrb'

token = "Nzc4OTk5Mjc4MTUyNTgxMTMw.X7aJnQ.xOy19yke7SyBc0XkQorLQJivZvs"

bot = Discordrb::Commands::CommandBot.new token: "#{token}", prefix: "."

bot.command: scrape do |msg, * args |
    url = 'https://kith.com/products.json?limit=99999'
  headers = {
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
    "accept-language": "en-US,en;q=0.9",
    "cache-control": "max-age=0",
    "sec-fetch-dest": "document",
    "sec-fetch-mode": "navigate",
    "sec-fetch-site": "none",
    "sec-fetch-user": "?1",
    "upgrade-insecure-requests": "1"
  }

response = HTTParty.get(url, headers: headers)
products = JSON.parse(response.body)['products']

for product in products
if product['title'].include ? "#{args.split(' ')[0]}"
msg.respond "Scraped #{product['title'].to_s}"
end
end
end
bot.run