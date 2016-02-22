# display the thumbnail for a video
add-type -path 'C:\Users\Imorrish\Documents\WindowsPowerShell\CasparCGNETConnector.dll' 
$casparcg = new-object "CasparCGNETConnector.CasparCGConnection"
$casparcg.connect("videopc",5250)
if($casparcg.isConnected()){
    $file = "ARISE_HeyO"
    $newThimbnail =  New-ThumbnailRetrieveCommand -media $file
    $rawThumbnail = $newThimbnail.Execute([ref]$casparcg)
    if($rawThumbnail.isOK()){

        $thumbnailBytes = [Convert]::FromBase64String($rawThumbnail.getData())
        $memStream = New-Object IO.MemoryStream($thumbnailBytes, 0, $thumbnailBytes.Length)
        $memStream.Write($thumbnailBytes, 0, $thumbnailBytes.Length);
        $thumbNail = [System.Drawing.Image]::FromStream($memStream, $true)
        #Display form
        [System.Windows.Forms.Application]::EnableVisualStyles();
        $form = new-object Windows.Forms.Form
        $form.Text = "Thumbnail View"
        $form.Width = $thumbNail.Size.Width +10;
        $form.Height =  $thumbNail.Size.Height +30;
        $pictureBox = new-object Windows.Forms.PictureBox
        $pictureBox.Width =  $thumbNail.Size.Width+10;
        $pictureBox.Height =  $thumbNail.Size.Height+10;

        $pictureBox.Image = $thumbNail;
        $form.controls.add($pictureBox)
        $form.Add_Shown( { $form.Activate() } )
        $form.ShowDialog()
    }
    else { Write-Host "Media file not found"}
}
else { Write-Host "Not connected to server"}
