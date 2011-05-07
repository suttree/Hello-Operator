class Message < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :recipient_id, :class_name => "User"
  belongs_to :recipient, :foreign_key => :user_id, :class_name => "User"
  belongs_to :parent, :foreign_key => :parent_id, :class_name => "Message"

  def reply
    Message.first(:conditions => {:parent_id => self.id})
  end

  def replies
    Message.all(:conditions => {:parent_id => self.id})
  end
end
