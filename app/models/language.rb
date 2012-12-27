class Language < ActiveRecord::Base
		

	has_many :translations, :foreign_key => "source_lang_id"
	has_many :translations, :foreign_key => "target_lang_id"

	 has_many :projects, :foreign_key => "source_lang_id"		
end