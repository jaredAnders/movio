module ChannelsHelper
  def admin_button
    if current_user && current_user == @channel.user
      link_to 'Admin', contributor_channel_path(@channel), class: 'btn-flat waves-light waves-effect right'
    end
  end
end
