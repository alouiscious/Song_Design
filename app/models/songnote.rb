class Songnote < ApplicationRecord
	belongs_to :song, foreign_key: :song_id
	belongs_to :rehearsal, foreign_key: :rehearsal_id
	belongs_to :user, foreign_key: :user_id
	
	
	# many to many in use here. songnote is the join.
	# for use when there is no simple association method to call
	# TODO - add filter current user by rehearsal
	# TODO -  ADD select options for songnote: :category   
	# <!-- # <%= content.select_tag(:category, options_for_select([['Solo/Feature', 1],['Organizer Note', 2],['Design Note', 3]]) %> -->
	
	
	def song_title=(title)
		self.song = Song.find_or_create_by(title: title)
		self.song.update(song)
	end
	
	def song_title
		self.song ? self.song.title : nil
		# self.try(:song).try(:title)
	end
	
	# def self.by_song(song_id)
	# 	where(song_title: song_title)
	# end
	
	
	private
	def is_title_case
		if title.split.any?{|w|w[0].upcase != w[0]}
			errors.add(:title, "Title must be in title case")
		end
	end
	
	def make_title_case
		self.title = self.title.titlecase
	end
	
		# def self.by_user
		# 	# takes in a user and return notes associted with the user
		# end
	
		# def self.by_rehearsal(rehearsal)
		# 	# notes associted with a song from many rehearsal
		# 	# rehearsal show page iterates over Songs allows access to songnotes (song.songnotes.by_rehearsal(@rehearsal))
		# 	# the console command below would look like this - Songnote.by_rehearsal(arg)
		# end
end
