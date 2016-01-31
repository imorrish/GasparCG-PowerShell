#CasparCG Utilities

Function New-CGConnection{
    <# .Synopsis
#>
$casparcg = new-object "CasparCGNETConnector.CasparCGConnection"
$casparcg.connect("localhost",5250)
 }

function Show-CGCommands{
    <# .Synopsis
#>
    [CasparCGNETConnector.CasparCGCommandFactory]::getCommandInfoList()
 }

function Set-CGGenerateThumbnailAll{
    <# .Synopsis
#>
    $ThumbnailGenerateAllCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailGenerateAllCommand")
    $ThumbnailGenerateAllCommand.execute([ref]$casparcg)
 }

function set-PlayCommand{
    <# .Synopsis
	    Starts playing a media
	.Parameter channel
         [Required]The channel
	.Parameter layer
        The layer
	.Parameter media
        The media to play
	.Parameter looping
        Loops the media
	.Parameter seek
        The Number of frames to seek before playing
	.Parameter length
        The number of frames to play
	.Parameter transition
        The transition to perform at start which can be either CUT, MIX, PUSH or WIPE
	.Parameter filter
        The ffmpeg filter to apply
#>
param (

        [Parameter(ParameterSetName='server', Position=1, Mandatory=$true, HelpMessage="Please specify the server #")]
        [Int]$server,

        [Parameter(ParameterSetName='channel', Position=2, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='layer', Position=3, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer,

        [Parameter(ParameterSetName='media', Position=4, Mandatory=$true, HelpMessage="The media to play")]
        [String]$media,

        [Parameter(ParameterSetName='looping', Position=5, HelpMessage="Loops the media (True,False)")]
        [Bool]$looping = $False,

        [Parameter(ParameterSetName='seek', Position=6, HelpMessage="The Number of frames to seek before playing")]
        [String]$seek,

        [Parameter(ParameterSetName='length', Position=7, HelpMessage="The number of frames to play")]
        [String]$length,

        [Parameter(ParameterSetName='transition', Position=8, HelpMessage=" The transition to perform at start")]
        [ValidateSet("CUT", "MIX", "PUSH", "WIPE")]
        [String]$transition = "CUT",

        [Parameter(ParameterSetName='filter', Position=9, HelpMessage="The ffmpeg filter to apply")]
        [String]$filter
)
     $PlayCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("PlayCommand")
 }
function set-StopCommand{
    <# .Synopsis
	Stops the given channel or layer
	*channel: The channel
	*layer: The layer
#> 
     $StopCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("StopCommand")
}

function set-LoadCommand{
    <# .Synopsis
	Loads a media
	*channel: The channel
	*layer: The layer
	*media: The media to play
	*looping: Loops the media
	*seek: The Number of frames to seek before playing
	*length: The number of frames to play
	*transition: The transition to perform at start
	*filter: The ffmpeg filter to apply
#> 
     $LoadCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("LoadCommand")
}
function set-LoadbgCommand{
    <# .Synopsis
	Loads a media to the background
	*channel: The channel
	*layer: The layer
	*media: The media to play
	*autostarting: Starts playing the media automatically when coming to foreground
	*looping: Loops the media
	*seek: The Number of frames to seek before playing
	*length: The number of frames to play
	*transition: The transition to perform at start
	*filter: The ffmpeg filter to apply
#> 
     $LoadbgCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("LoadbgCommand")
}
function set-RouteCommand{
    <# .Synopsis
	Routes a channel or layer to an other channel or layer
	*channel: The channel
	*layer: The layer
	*source channel: The source channel (content)
	*source layer: The source layer (content)
#> 
     $RouteCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("RouteCommand")
}
function set-PauseCommand{
    <# .Synopsis
	Pauses the given channel or layer
	*channel: The channel
	*layer: The layer
#> 
     $PauseCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("PauseCommand")
}
function set-ResumeCommand{
    <# .Synopsis
	Resumes a paused clip on the given channel or layer
	*channel: The channel
	*layer: The layer
#> 
     $ResumeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ResumeCommand")
}
function set-CallCommand{
    <# .Synopsis
	Manipulates a loaded media
	*channel: The channel
	*layer: The layer
	*looping: Loops the media
	*seek: The Number of frames to seek before playing
	*length: The number of frames to play
	*transition: The transition to perform at start
	*filter: The ffmpeg filter to apply
#> 
     $CallCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CallCommand")
}
function set-SwapCommand{
    <# .Synopsis
	Swaps the given channels or layers
	*channelA: The first channel
	*channelB: The second channel
	*layerA: The first layer
	*layerB: The second layer
#> 
     $SwapCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("SwapCommand")
}
function set-ClearCommand{
    <# .Synopsis
	Clears the server channels, a given channel or layer
	*channel: The channel
	*layer: The layer
#> 
     $ClearCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ClearCommand")
}

function set-AddCommand{
    <# .Synopsis
	Adds a consumer to a given channel
	*channel: The channel
	*consumer: The consumer to add to the channel i.e. SCREEN or FILE.
	*parameter: The paramter list
#> 
     $AddCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("AddCommand")
}


function set-RemoveCommand{
    <# .Synopsis
	Removes a consumer from a given channel
	*channel: The channel
	*consumer: The consumer to add to the channel i.e. SCREEN or FILE.
	*parameter: The paramter list
#> 
     $RemoveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("RemoveCommand")
}

function set-PrintCommand{
    <# .Synopsis
	Saves a screenshot of a given channel
	*channel: The channel
	*file: The destination filename
#> 
     $PrintCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("PrintCommand")
}
function set-SetCommand{
    <# .Synopsis
	Sets the video mode of the given channel
	*channel: The channel
	*video mode: The video mode
#> 
     $SetCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("SetCommand")
}

function set-ByeCommand{
    <# .Synopsis
	Disconnects from the server
#> 
     $ByeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ByeCommand")
}
function set-KillCommand{
    <# .Synopsis
	Stops the server with exitcode 0
#> 
     $KillCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("KillCommand")
}
function set-RestartCommand{
    <# .Synopsis
	Stops the server with exitcode 5
#> 
     $RestartCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("RestartCommand")
}
function set-DataListCommand{
    <# .Synopsis
	Lists all stored data on the server
#> 
     $DataListCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("DataListCommand")
}

function set-DataStoreCommand{
    <# .Synopsis
	Stores the given data string by the given key
	*key: The key
	*data: The data string to store
#> 
     $DataStoreCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("DataStoreCommand")
}
function set-DataRetrieveCommand{
    <# .Synopsis
	Retrieves the data string stored by the given key
	*key: The key
#> 
     $DataRetrieveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("DataRetrieveCommand")
}
function set-DataRemoveCommand{
    <# .Synopsis
	Removes the data string stored by the given key
	*key: The key
#> 
     $DataRemoveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("DataRemoveCommand")
}
function set-ClsCommand{
    <# .Synopsis
	Requests a list of all media files on the server
#> 
     $ClsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ClsCommand")
}
function set-TlsCommand{
    <# .Synopsis
	Requests a list of all templates on the server
#> 
     $TlsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("TlsCommand")
}
function set-CinfCommand{
    <# .Synopsis
	Requests details of a media file on the server
	*media: The media file
#> 
     $CinfCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CinfCommand")
}
function set-InfoCommand{
    <# .Synopsis
	Requests informations about a channel or layer
	*channel: The channel
	*layer: The layer
	*only background: Only show info of background
	*only foreground: Only show info of foreground
	*delay: shows the delay of a channel
#> 
     $InfoCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoCommand")
}
function set-InfoTemplateCommand{
    <# .Synopsis
	Requests informations about a template
	*template: The template
#> 
     $InfoTemplateCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoTemplateCommand")
}
function set-InfoConfigCommand{
    <# .Synopsis
	Requests the configuration of the server
#> 
     $InfoConfigCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoConfigCommand")
}
function set-InfoPathsCommand{
    <# .Synopsis
	Requests the path configuration of the server
#> 
     $InfoPathsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoPathsCommand")
}
function set-InfoServerCommand{
    <# .Synopsis
	Requests informations about the connected server
#> 
     $InfoServerCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoServerCommand")
}
function set-InfoSystemCommand{
    <# .Synopsis
	Requests system information of the server
#> 
     $InfoSystemCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoSystemCommand")
}
function set-InfoThreadsCommand{
    <# .Synopsis
	Requests informations about the threads and their names of the connected server
#> 
     $InfoThreadsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoThreadsCommand")
}
function set-InfoQueuesCommand{
    <# .Synopsis
	Requests informations about the AMCP command queues of the connected server
#> 
     $InfoQueuesCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoQueuesCommand")
}
function set-VersionServerCommand{
    <# .Synopsis
	Requests current server version
#> 
     $VersionServerCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("VersionServerCommand")
}
function set-VersionFlashCommand{
    <# .Synopsis
	Requests current flash version on the server
#> 
     $VersionFlashCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("VersionFlashCommand")
}
function set-VersionTemplatehostCommand{
    <# .Synopsis
	Requests current templatehost version of the server
#> 
     $VersionTemplatehostCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("VersionTemplatehostCommand")
}
function set-ThumbnailListCommand{
    <# .Synopsis
	Requests a list of all thumbnails on the server
#> 
     $ThumbnailListCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailListCommand")
}
function set-ThumbnailGenerateCommand{
    <# .Synopsis
	Requests the server to (re-)generate the thumbnails for a specific media file
	*media: The media file
#> 
     $ThumbnailGenerateCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailGenerateCommand")
}
function set-ThumbnailGenerateAllCommand{
    <# .Synopsis
	Requests the server to (re-)generate thumbnails for all media files
#> 
     $ThumbnailGenerateAllCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailGenerateAllCommand")
}
function set-ThumbnailRetrieveCommand{
    <# .Synopsis
	Requests the base64 encoded thumbnail for a specific media file
	*media: The media file
#> 
     $ThumbnailRetrieveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailRetrieveCommand")
}
function set-CgAddCommand{
    <# .Synopsis
	Adds a flashtemplate to a given channel / layer on a given flashlayer
	*channel: The channel
	*layer: The layer
	*template: The template
	*flashlayer: The flashlayer
	*play on load: Starts playing the template when loaded
	*data: The xml data string
#> 
     $CgAddCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgAddCommand")
}
function set-CgRemoveCommand{
    <# .Synopsis
	Removes a flashtemplate on a given flashlayer from a given channel / layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
#> 
     $CgRemoveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgRemoveCommand")
}
function set-CgPlayCommand{
    <# .Synopsis
	Plays a flashtemplate on a given flashlayer from a given channel / layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
#> 
     $CgPlayCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgPlayCommand")
}
function set-CgStopCommand{
    <# .Synopsis
	Stops a flashtemplate on a given flashlayer from a given channel / layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
#> 
     $CgStopCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgStopCommand")
}
function set-CgNextCommand{
    <# .Synopsis
	Triggers a 'continue' in the template on the specified layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
#> 
     $CgNextCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgNextCommand")
}
function set-CgClearCommand{
    <# .Synopsis
	Clears all layers and any state that might be stored
	*channel: The channel
	*layer: The layer
#> 
     $CgClearCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgClearCommand")
}
function set-CgUpdateCommand{
    <# .Synopsis
	Sends new data to the template on specified layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
	*data: The xml data string
#> 
     $CgUpdateCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgUpdateCommand")
}
function set-CgInvokeCommand{
    <# .Synopsis
	Calls a custom method in the document class of the template on the specified layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
	*method: The methode to invoke
#> 
     $CgInvokeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgInvokeCommand")
}
function set-ChannelGridCommand{
    <# .Synopsis
	Opens a new channel and displays a grid with the contents of all the existing channels.
#> 
     $ChannelGridCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ChannelGridCommand")
}
function set-MixerAnchorCommand{
    <# .Synopsis
	Changes the anchor point around which fill_translation, fill_scale and ROTATION will be done from. x The left anchor point, 0 $ = left edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = right edge of monitor. Higher and lower values allowed. y The top anchor point, 0 $ = top edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = bottom edge of monitor. Higher and lower values allowed.
	*channel: The channel
	*layer: The layer
	*x: x The left anchor point, 0 $ = left edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = right edge of monitor. Higher and lower values allowed.
	*y: y The top anchor point, 0 $ = top edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = bottom edge of monitor. Higher and lower values allowed.
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerAnchorCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerAnchorCommand")
}
function set-MixerBlendCommand{
    <# .Synopsis
	Every layer in the Mixer module can be set to a blend mode over than the default Normal mode, similar to applications like Photoshop. Some common uses are to use screen to make a all the black image data become transparent, or to use add to selectively lighten highlights.
	*channel: The channel
	*layer: The layer
	*blendmode: The blend mode to use with the mixer like, OVERLAY, ADD, SCREEN etc.
#> 
     $MixerBlendCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerBlendCommand")
}
function set-MixerBrightnessCommand{
    <# .Synopsis
	Changes the brightness of the specified layer. The value is a float between 0 and 1
	*channel: The channel
	*layer: The layer
	*brightness: The brightness value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerBrightnessCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerBrightnessCommand")
}
function set-MixerChromaCommand{
    <# .Synopsis
	Enables chroma keying on the specified video layer
	*channel: The channel
	*layer: The layer
	*color: The color to key with. Only blue, green or none allowed
	*threshold: The threshold
	*softness: The softness
#> 
     $MixerChromaCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerChromaCommand")
}
function set-MixerClearCommand{
    <# .Synopsis
	Reset all transformations
	*channel: The channel
	*layer: The layer
#> 
     $MixerClearCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerClearCommand")
}
function set-MixerClipCommand{
    <# .Synopsis
	Masks the video stream on the specified layer. The concept is quite simple; it comes from the ancient DVE machines like ADO. Imagine that the screen has a size of 1x1 (not in pixel, but in an abstract measure). Then the coordinates of a full size picture is 0 0 1 1, which means left edge is at coordinate 0, top edge at coordinate 0, width full size $ => 1, heigh full size $ => 1. If you want to crop the picture on the left side (for wipe left to right) You set the left edge to full right $ => 1 and the width to 0. So this give you the start-coordinates of 1 0 0 1. End coordinates of any wipe are allways the full picture 0 0 1 1.
	*channel: The channel
	*layer: The layer
	*x:  The left edge of the new clipSize, 0 $ = left edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = right edge of monitor. Higher and lower values allowed. 
	*y: The top edge of the new clipSize, 0 $ = top edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = bottom edge of monitor. Higher and lower values allowed.
	*xscale: The size of the new clipSize, 1 $ = 1x the screen size, 0.5 $ = half the screen size. Higher and lower values allowed. 
	*yscale: The size of the new clipSize, 1 $ = 1x the screen size, 0.5 $ = half the screen size. Higher and lower values allowed. 
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerClipCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerClipCommand")
}
function set-MixerContrastCommand{
    <# .Synopsis
	Changes the contrast of the specified layer. The value is a float between 0 and 1
	*channel: The channel
	*layer: The layer
	*contrast: The contrast value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerContrastCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerContrastCommand")
}
function set-MixerCropCommand{
    <# .Synopsis
	Returns or modifies the edges for the cropping for a layer.
	*channel: The channel
	*layer: The layer
	*left: The left edges pos.
	*top: The top edges pos.
	*right: The right edges pos.
	*bottom: The bottom edges pos.
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerCropCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerCropCommand")
}
function set-MixerFillCommand{
    <# .Synopsis
	Scales the video stream on the specified layer. The concept is quite simple; it comes from the ancient DVE machines like ADO. Imagine that the screen has a size of 1x1 (not in pixel, but in an abstract measure). Then the coordinates of a full size picture is 0 0 1 1, which means left edge is at coordinate 0, top edge at coordinate 0, width full size $ => 1, heigh full size $ => 1. If you want to crop the picture on the left side (for wipe left to right) You set the left edge to full right $ => 1 and the width to 0. So this give you the start-coordinates of 1 0 0 1. End coordinates of any wipe are allways the full picture 0 0 1 1. With the FILL command it can make sense to have values between 1 and 0, if you want to do a smaller window. If, for instance you want to have a window of half the size of your screen, you set with and height to 0.5. If you want to center it you set left and top edge to 0.25 so you will get the arguments 0.25 0.25 0.5 0.5 
	*channel: The channel
	*layer: The layer
	*x:  The left edge of the new fillSize, 0 $ = left edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = right edge of monitor. Higher and lower values allowed. 
	*y: The top edge of the new fillSize, 0 $ = top edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = bottom edge of monitor. Higher and lower values allowed.
	*xscale: The size of the new fillSize, 1 $ = 1x the screen size, 0.5 $ = half the screen size. Higher and lower values allowed. 
	*yscale: The size of the new fillSize, 1 $ = 1x the screen size, 0.5 $ = half the screen size. Higher and lower values allowed. 
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerFillCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerFillCommand")
}
function set-MixerGridCommand{
    <# .Synopsis
	Creates a grid of video streams in ascending order of the layer index, i.e. if resolution equals 2 then a 2x2 grid of layers will be created.
	*channel: The channel
	*resolution: The resolution of the grid. i.e. if resolution equals 2 then a 2x2 grid of layers will be created.
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerGridCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerGridCommand")
}
function set-MixerKeyerCommand{
    <# .Synopsis
	Replaces layer n+1's alpha channel with the alpha channel of layer n, and hides the RGB channels of layer n. If keyer equals 1 then the specified layer will not be rendered, instead it will be used as the key for the layer above. 
	*channel: The channel
	*layer: The layer
	*keyer: Sets whether or not the keyer should be active
#> 
     $MixerKeyerCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerKeyerCommand")
}
function set-MixerLevelsCommand{
    <# .Synopsis
	Documentation missing. Sorry :-(
	*channel: The channel
	*layer: The layer
	*minInput: Documentation missing. Sorry :-(
	*maxInput: Documentation missing. Sorry :-(
	*gamma: Documentation missing. Sorry :-(
	*minOutput: Documentation missing. Sorry :-(
	*maxOutput: Documentation missing. Sorry :-(
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerLevelsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerLevelsCommand")
}
function set-MixerMastervolumeCommand{
    <# .Synopsis
	Changes the volume of an entire channel. 
	*channel: The channel
	*volume: The volume to set the channel to between
#> 
     $MixerMastervolumeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerMastervolumeCommand")
}
function set-MixerOpacityCommand{
    <# .Synopsis
	Changes the opacity of the specified layer. The value is a float between 0 and 1
	*channel: The channel
	*layer: The layer
	*opacity: The opacity of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 

     $MixerOpacityCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerOpacityCommand")
}
function set-MixerPerspectiveCommand{
    <# .Synopsis
	Returns or modifies the corners of the perspective transformation for a layer.
	*channel: The channel
	*layer: The layer
	*topLeftX: The x pos. of the top left corner.
	*topLeftY: The y pos. of the top left corner.
	*topRightX: The x pos. of the top right corner.
	*topRightY: The y pos. of the top right corner.
	*bottomRightX: The x pos. of the bottom right corner.
	*bottomRightY: The y pos. of the bottom right corner.
	*bottomLeftX: The x pos. of the bottom left corner.
	*bottomLeftY: The y pos. of the bottom left corner.
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerPerspectiveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerPerspectiveCommand")
}
function set-MixerRotationCommand{
    <# .Synopsis
	Returns or modifies the angle of which a layer is rotated by (clockwise degrees) around the point specified by ANCHOR.
	*channel: The channel
	*layer: The layer
	*angle: The angle of which a layer is rotated by (clockwise degrees) around the point specified by ANCHOR.
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerRotationCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerRotationCommand")
}
function set-MixerSaturationCommand{
    <# .Synopsis
	Changes the saturation of the specified layer. The value is a float between 0 and 1
	*channel: The channel
	*layer: The layer
	*saturation: The saturation value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerSaturationCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerSaturationCommand")
}
function set-MixerStraightAlphaOutputCommand{
    <# .Synopsis
	If enabled, causes RGB values to be divided with the alpha for the given video channel before the image is sent to consumers. 
	*channel: The channel
	*layer: The layer
	*active: Sets whether or not straight alpha output should be active
#> 
     $MixerStraightAlphaOutputCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerStraightAlphaOutputCommand")
}
function set-MixerVolumeCommand{
    <# .Synopsis
	Changes the volume of the specified layer
	*channel: The channel
	*layer: The layer
	*volume: The volume value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
     $MixerVolumeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerVolumeCommand")
}