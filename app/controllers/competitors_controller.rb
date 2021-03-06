MyApp.get "/form_to_add_competitor" do
  erb :"/competitors/competitor_add_form"
end

MyApp.post "/competitor_processed" do
  x = Competitor.new
  x.name = params["name"]
  x.competitor_type = params["competitor_type"] 
  x.save
  @y = [x.name, x.competitor_type]
  erb :"competitors/processed"
end 

MyApp.get "/all_competitors" do 
  @competitors = Competitor.all
  competitors = @competitors.limit(1).order("RANDOM()")
  @type = competitors[0].competitor_type
  erb :"competitors/competitors_list"
end 

MyApp.get "/view_competitor/:competitor_id" do 
  @competitor = Competitor.find_by_id(params[:competitor_id])
  erb :"competitors/single_competitor"
end