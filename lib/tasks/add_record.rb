require "#{Rails.root}/app/models/user"
 
class Tasks::DelTmpUsers
  def self.execute
    Rails.logger.debug("DELETE USER EXECUTE")
    User.delete_all("hogehoge")
  end
end
