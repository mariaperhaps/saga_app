json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :title, :desciption, :image_url, :scope, :tags, :category, :saga_id
  json.url chapter_url(chapter, format: :json)
end
