class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.json
  def index
    Basecamp.establish_connection!('company.basecamphq.com', 'username', 'password', true)
    me = Basecamp::Person.me
    @user = me
    @stories = Story.includes(:role)
    @steps = Step.includes(:stories)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end
  def yumlimg
    @story = Story.find(params[:id])
  end


  # GET /stories/admin
  def showRole
    # @stories = Story.pluck(:role)
    @stories = Story.includes(:role)
  end
  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.all(:include => :role, :conditions => {:stories => { :id => params[:id] } })

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end
  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new
    @roles = Role.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  def savetofile
    @fileName = params[:path]
    @steps = Step.all(:include => :story, :conditions => {:steps => { :story_id => params[:story_id] } })
    @steps.each do |step|
      @doc = "#{step.kind} #{step.doer} #{step.verb} #{step.body}\n#{@doc}"
    end
    File.open(@fileName, 'w') {|f| f.write(@doc) }
    @result   = "success"
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
    @roles = Role.all
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  def steps
    @steps = Step.all(:include => :story, :conditions => {:steps => { :story_id => params[:id] } })
  end
end
