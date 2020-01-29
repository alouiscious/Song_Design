class SongsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    if params[:songnote_id]
      @songnote = Song.find_by(params[:songnote_id])
      if @songnote.nil?
        redirect_to songs_songnotes_path
      else
        @song = @songnotes.songs
      end
    else
      @songs = Song.all
    end
  end

  def show
    @song = Song.find(song_params)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])

  end

  def update
    @song = Song.find(params[:id])
    @song = Song.update(song_params)
    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def delete
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song Deleted"
  end

  def song_params
    params.require(:song).permit(:title, :genre, :key, :in_style_of, :user_id, :rehearsal_id,
      songnotes_attributes:[
        :title,
        :content,
        :type
      ]
    )
  end  
end
