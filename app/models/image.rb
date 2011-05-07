class Image < ActiveRecord::Base
  named_scope :for_background, :conditions => {:category => 'background'}
  named_scope :for_feature, :conditions => {:category => 'feature'}
end
