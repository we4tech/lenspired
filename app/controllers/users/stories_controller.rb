class Users::StoriesController < AuthenticatedController
  def new
    @story = current_user.stories.new
  end

  def create
    @story        = Story.new story_params
    @story.status = Story::STATUS_PENDING
    @story.user   = current_user

    if @story.save
      flash[:success] = 'Successfully submitted your story, now it is waiting for moderator approval.'
      redirect_to users_stories_path
    else
      render :new
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :image, :tag_list)
  end
end
