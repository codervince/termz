# == Schema Information
#
# Table name: languages
#
#  id       :integer          not null, primary key
#  name     :string(255)
#  iso_code :string(255)
#

class Language < ActiveRecord::Base
		

	has_many :translations, :foreign_key => "source_lang_id"
	has_many :translations, :foreign_key => "target_lang_id"

	 has_many :projects, :foreign_key => "source_lang_id"		
end
