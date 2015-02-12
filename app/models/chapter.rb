class Chapter < ActiveRecord::Base
  belongs_to :saga
  has_many :comments

    def add_tag_to_chapter(chapter_id, tag_string)
    # adds tags to a chapter either one at a time
    # or multiple tags as a string divided by commas
    # all tags are downcased to avoid search difficulties
    tag_string.downcase!
    self.tag_list.add(tag_string, parse: true)
    self.save
  end

end
