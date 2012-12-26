class Translation < ActiveRecord::Base
  attr_accessible :approval_id, :domain_id, :owner_id, :source_content, :source_lang_id, :target_content, :target_lang_id
end
