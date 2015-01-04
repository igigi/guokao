class XizangScraper
  scraper = Upton::Scraper.new("http://219.151.48.208:890/notice.aspx", "table.policytab a")
  scraper.paginated = false
  scraper.pagination_param = 'page'
  scraper.pagination_max_pages = 1
  scraper.sleep_time_between_requests = 3
  scraper.scrape_to_csv "output.csv" do |html|
    Nokogiri::HTML(html).search("div.content h2").map &:text
  end
  scraper.scrape do |article_html, article_url|
    page = Nokogiri::HTML(article_html).css("div.content")
    article_title = page.css("div.content h2")
    article_timestamp = page.css("div.content h3 span")
    article_origin = page.css("div.content h3 strong")
    puts article_url
    puts article_title
    puts article_timestamp
    puts article_origin
  end
end
