class Conversation < ApplicationRecord

  has_many :participants
  has_many :users, through: :participants
  has_many :personal_messages, dependent: :destroy

  def self.findconvo(firstuser, seconduser)
    parsedconvos = []
    @conversations = Conversation.all
    @conversations.each do |c|
      if c.users.include? firstuser
        parsedconvos << c
      end
    end
    parsedconvos.each do |pc|
      if pc.users.include? seconduser
        @conversation = pc
        return @conversation
      end
    end
    return false
  end

  def opposite_convo_user(user)
    self.users.each do |u|
      if u == user
        next
      else
        return u
      end
    end
  end
end
