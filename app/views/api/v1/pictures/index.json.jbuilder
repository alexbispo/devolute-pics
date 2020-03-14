json.array! @pictures do |picture|
  json.id picture.id
  json.cretedAt picture.created_at
  json.url url_for(picture.file)
end
