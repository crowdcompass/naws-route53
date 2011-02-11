module Naws::Route53::Common::Change
 
  def change_id
    xpath("//ChangeInfo/Id").split('/').last
  end

  def change_status
    xpath "//ChangeInfo/Status"
  end

end
