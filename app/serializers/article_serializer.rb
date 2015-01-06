class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :stamp, :url, :created_at
end
