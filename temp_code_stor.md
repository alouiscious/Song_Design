FUCKING SHIT WORKED YESTERDAY
      <p>
          Select an <%= f.label :organizer %>
        <% if organizer_id.nil? %>
          <%= f.text_field :organizer_id, list: "organizer_id" %>
          <datalist id="organizer_id">
            <% User.pluck(:name).uniq.each do |organizer| %>
              <option value="<%= organizer %>"></option>
            <% end %>
          </datalist>
        <% else %>  
          <strong><%= @rehearsal.organizer.name %></strong> 
        <% end %>
        </p>


          Organized by: <%= @rehearsal.organizer_id %> <%= @rehearsal.organizer.name %>



THIS CODE WAS REMOVED FROM SONGNOTE NEW VIEW

  <%= fields_for @songnotes do |songnotes_attribute| %>
    <%= songnotes_attribute.label :song_title %>
    <%= songnotes_attribute.text_field :song_title %> <br>
    <%= songnotes_attribute.label "Note Title" %> 
    <%= songnotes_attribute.text_field :title %> <br>
    <%= songnotes_attribute.label :content %> 
    <%= songnotes_attribute.text_area :content, rows:7, cols: 28 %> <br>
  <% end %>


THIS IS THE CHECK BOXES CODE REMOVED FROM REHEARSALS VIEW

<%= fields_for @song do |song_item| %>
  <%= song_item.collection_check_boxes(:song_id, Song.all, :id, :title) %>
  <br>
  <% end %>



THIS CODE CREATES A MODEL FILTER AND THEN USES IT IN THE CONTROLLER
_ _ _ .RB(the model)
def self.by_(rehearsal_id)
  where(rehearsal: rehearsal_id)
end

_ _ _ .CONTROLLER.RB (the controller)
# app/controllers/songnotes_controller.rb
 
if !params[:rehearsal].blank?
  @songnotes = Songnotes.by_rehearsal(params[:rehearsal])
elsif !params[:date].blank?



REMOVING SONG.STATUS TO LET THE REHEARSAL DETERMINE AND RENDER SONGS INCLUDED IN A REHEARSAL
  <table>
    <td>
      Song Design Status:
    </td>
    <td>
      <%= f.radio_button(:status, "in use") %>
      <%= f.label(:status_yes, "In Use") %>
    </td>
    <td>
      <%= f.radio_button(:status, "not in use") %> 
      <%= f.label(:status_no, "Not In Use") %>
    </td>    
  </table>
  <br>
  <br>
   

THIS IS A PREVIOUS ATTEMPT TO EVAL CHECKBOXES

<section class="todoapp">
  <header class="header">
    <h1><%= @song.name %></h1>
    <%= form_for([@song, @song_note]) do |f| %>
      <%= f.text_field :description, :class => "new-todo", :placeholder => (@item.errors.full_messages_for(:description).first || "Enter a new item...") %>
      <%= f.submit :style => "display: none" %>
    <% end %>
  </header>
  <section class="main">
    <input class="toggle-all" type="checkbox">
    <label for="toggle-all">Mark all as complete</label>
    <ul class="todo-list">
      <% @song.song_notes.each do |item| %>
      <li class="<%= "completed" if item.complete? %>">
        <div class="view">
          <%= form_for([@song, item]) do |f| %>
            <%= f.check_box :status, :class => "toggle", :checked => (true if item.complete?) %>
          <% end %>

          <label><%= item.description %></label>
        </div>
      </li>
      <% end %>
    </ul>
  </section>
  <footer class="footer">
  </footer>
</section>



THIS CODE IS FOR ITEM DELETION <% @people.each do |person| %>
<div class="Songnote">
  <span><%= songnote.title %></span>
  <%= link_to "Delete", songnote, method: :delete, data: { confirm: "Really? Sure?" } %>
</div>
<% end %>
OR 
<%= button_to "Delete Note", songnote_path(@songnote), method: :delete, data: { confirm: "Really? Sure?" } %>



THIS IS SONGNOTE SAMPLE CONTENT
If the yeti takes a solo, band takes a break. Stagger each instrument out (-BACK VOCALS, -KEY -GUITARS, -ANY OTHERS -BASS).

THIS IS A PARTIAL FOR
render partial: 'form', locals: {rehearsal: @rehearsal}???




TODO - ADD POST TIME TO SOONGNOTES
time_ago_in_words(Time.now)
# "less than a minute"

time_ago_in_words(Time.now + 60)
# "1 minute"

time_ago_in_words(Time.now + 600)
# "10 minutes"




THIS TABLE IS FOR THE _FORM SONGNOTES PARTIIAL VIEW
  <table>
    <td>
      Note Category:
    </td>
    <td>
      <%= f.radio_button(:type, "feature_solo") %>
      <%= f.label(:type_feature, "Feature/Solo") %>
    </td>
    <td>
      <%= f.radio_button(:type, "design") %> 
      <%= f.label(:type_design, "Design/Structure") %>
    </td> 
    <td>
      <%= f.radio_button(:type, "organizer") %> 
      <%= f.label(:type_design, "Organizer") %>
    </td>        
  </table>
  <br>

  THIS IS TO CREATE A BASIC INDEX VIEW 
  # <% User.select(:name).distinct.each do |person| %>

  # <%= form_for @user do |f| %>
#   <%= f.label :name, "First Name" %>:
#   <%= f.text_field :name, list: 'user-name' %>
#   <datalist id="user-name">
#     <% User.all.each do |user| %>
#       <option value="<%= user.name %>"></option>
#     <% end %>
#   </datalist>
#   <%= f.submit %>
# <% end %>