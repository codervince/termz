# == Schema Information
#
# Table name: translations
#
#  id             :integer          not null, primary key
#  source_lang_id :integer
#  source_content :string(255)
#  target_lang_id :integer
#  target_content :string(255)
#  domain_id      :integer
#  owner_id       :integer
#  approval_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  project_id     :integer
#  is_public      :boolean          default(TRUE)
#  is_term        :boolean          default(TRUE)
#  source_id      :integer
#

require 'spec_helper'

describe Translation do
  pending "add some examples to (or delete) #{__FILE__}"
end
