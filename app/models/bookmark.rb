class Bookmark < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
  		self.tags.collect do |tag|
    		tag.name
  		end.join(", ")
	end

# split method to split the tag on the basis of comma seperated.
# strip method removes the white spaces around the tag.
# uniq method will remove the duplicate tag from the array.
# find_or_create_by method finds the tag from tag table if tag is on the table than it 
# doesn't add tag into the database otherwise add the tag to database.

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end


end
