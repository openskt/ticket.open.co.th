

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">New Ticket</h1>

          
<form method="post" action="<?=base_url('ticket/dashboard')?>">
  <div class="form-group">
    <label for="enduser">End User</label>
    <input type="email" class="form-control" id="enduser" placeholder="customer@1577.co.th">
  </div>
  <div class="form-group">
    <label for="subject">Subject</label>
    <input type="text" class="form-control" id="subject" placeholder="Subject">
  </div>
  <div class="form-group">
    <label for="editor1">Content</label>
    <textarea name="editor1" id="editor1" rows="10" cols="80">
                
            </textarea>

            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1' );
            </script>
    
  </div>
  <div class="form-group">
    <label for="attach_file">Attach file(s)</label>
    <input type="file" id="attach_file">
<!--    <p class="help-block">Example block-level help text here.</p>-->
  </div>
<!--  <div class="checkbox">
    <label>
      <input type="checkbox"> Check me out
    </label>
  </div>-->
  <button type="submit" class="btn btn-default">Submit</button>
</form>
          
        </div>
        
        
      </div>
    </div>

