
<div class="container" style="float: left">
  <header><img src="https://cdn.britannica.com/17/83817-050-67C814CD/Mount-Everest.jpg" width="300" height=200 class="img-responsive main-image">
  <div style="float: right"> <p>Description</p>
  </header>
  <div class="col-md-8 col-md-offset-2">

#old peaks view

<title>Peaks</title>
  <div class="container" style="float: left">
  <header><img src="https://cdn.britannica.com/17/83817-050-67C814CD/Mount-Everest.jpg" width="300" height=200 class="img-responsive main-image">
  <div style="float: right"> <p>Description</p>
  </header>
  <div class="col-md-8 col-md-offset-2">
  <h2>Peak Post</h2>

  <div class="main__container">
    <p><% @peaks.each.with_index(1) do |peak, i| %>
    <%= "#{i}" %>. 
    <%= peak.name %>, 
    <%= peak.location %>, 
    <%= peak.elevation %>. <a href="/ascents/new">Add Ascent</a></p>
  <% end %>
  <p><a href="/newpeak">Add Peak</a></p>
  <p><a href="/user_profile">Return to your Profile</a></p>
  <p><a href="/">Home</a></p>

  #index for users

  <p><% @users.each.with_index(1) do |user, i| %>
        <%= "#{i}" %>
        <%= user.username %>
      <% end %></p>

      <p>Edit an Existing Ascent</p>
    <a href="/ascents/<%=@ascent.id%>/edit">Edit Ascent</a>

    input[type=submit] {
    background-color: grey;
    color: #333;
    font-family: Sans-Serif;
    line-height: 25px;
  }

  <p><form method="post" action="/ascents/<%=ascent.id%>/edit"> 
        <input id="hidden" type="hidden" name="_method" value="EDIT"><input type="submit" value="Edit"></form>