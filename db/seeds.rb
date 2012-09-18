# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1.upto(10) do |n|
  episode = Episode.create({
    title: Forgery(:name).company_name,
    summary: Forgery(:lorem_ipsum).sentences(1),
    notes: Forgery(:lorem_ipsum).sentences(20),
    published_at: n.weeks.ago,
    seconds: Random.new.rand(1000...100000),
    position: n
  })
  
  [["video-720", "video/mpeg"], ["video-480", "video/mpeg"], ["audio-m4a", "audio/mpeg"]].each do |type|
    EpisodeFile.create({
      episode_id: episode.id,
      file_type: type.first,
      content_type: type.last,
      size: Random.new.rand(10000...100000),
      url: Forgery(:internet).domain_name
    })
  end
  
end