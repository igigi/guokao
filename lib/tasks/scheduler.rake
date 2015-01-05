desc "scheduler scrape"
task :xizang_scrape => :environment do
  scraper = Upton::Scraper.new("http://219.151.48.208:890/notice.aspx", "table.policytab a")
  scraper.paginated = true
  scraper.pagination_param = 'page'
  scraper.pagination_max_pages = 8
  scraper.sleep_time_between_requests = 30

  scraper.scrape do |article_html, article_url|
    page = Nokogiri::HTML(article_html).css("div.content")
    article_title = page.css("div.content h2").text
    article_timestamp = page.css("div.content h3 span").text
    article_origin = page.css("div.content h3 strong").text
    Article.find_or_create_by(title: article_title, stamp: article_timestamp, origin: article_origin, url: article_url)
  end
end

task :henan_scrape => :environment do
end
