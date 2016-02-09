#CasparCG Utilities

Function New-CGConnection{
    <# .Synopsis
#>
param(
        [Parameter(ParameterSetName='Default', Position=1, HelpMessage="Connect to a new CasparCG Server")]
        [String]$host = "localhost"
        )
    $casparcg = new-object "CasparCGNETConnector.CasparCGConnection"
    $casparcg.connect($host,5250)
    ,$casparcg
 }

function Show-CGCommands{
    <# .Synopsis
        Show all commands
#>

    [CasparCGNETConnector.CasparCGCommandFactory]::getCommandInfoList()
 }

function New-CGGenerateThumbnailAll{
    <# .Synopsis
#>
[CmdletBinding(DefaultParameterSetName="Default")]
    $ThumbnailGenerateAllCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailGenerateAllCommand")
    ,$ThumbnailGenerateAllCommand
 }

function New-PlayCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer,

        [Parameter(ParameterSetName='Default', Position=3, Mandatory=$true, HelpMessage="The media to play")]
        [String]$media,

        [Parameter(ParameterSetName='Default', Position=4, HelpMessage="Loops the media (True,False)")]
        [Bool]$looping = $False,

        [Parameter(ParameterSetName='Default', Position=5, HelpMessage="The Number of frames to seek before playing")]
        [Long]$seek=0,

        [Parameter(ParameterSetName='Default', Position=6, HelpMessage="The number of frames to play")]
        [Long]$length=0,

        [Parameter(ParameterSetName='Default', Position=7, HelpMessage=" The transition to perform at start")]
        $transition,

        [Parameter(ParameterSetName='Default', Position=8, HelpMessage="The ffmpeg filter to apply")]
        [String]$filter = ""
)
PROCESS {
    $PlayCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("PlayCommand")
    $PlayCommand.setChannel($channel)
    $PlayCommand.setLayer($layer)
    $PlayCommand.setMedia($media)
    $PlayCommand.setLooping($looping)
    if($seek -ne 0){$PlayCommand.setSeek($seek)}
    if($length -ne 0){$PlayCommand.setLength($length)}
    if($transition){ $PlayCommand.setTransition([ref]$transition)}
    if($filter){$PlayCommand.setFilter($filter)}
    ,$PlayCommand
    }
 }
function New-StopCommand{
    <# .Synopsis
	Stops the given channel or layer
	*channel: The channel
	*layer: The layer
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (
        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $StopCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("StopCommand")
     $StopCommand.setChannel($channel)
     $StopCommand.setLayer($layer)
     ,$StopCommand
}

function New-LoadCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer,
        
        [Parameter(ParameterSetName='Default', Position=3, Mandatory=$true, HelpMessage="The media to play")]
        [String]$media,

        [Parameter(ParameterSetName='Default', Position=4, HelpMessage="Loops the media (True,False)")]
        [Bool]$looping = $False,

        [Parameter(ParameterSetName='Default', Position=5, HelpMessage="The Number of frames to seek before playing")]
        [Long]$seek=0,

        [Parameter(ParameterSetName='Default', Position=6, HelpMessage="The number of frames to play")]
        [Long]$length=0,

        [Parameter(ParameterSetName='Default', Position=7, HelpMessage=" The transition to perform at start")]
        $transition,

        [Parameter(ParameterSetName='Default', Position=8, HelpMessage="The ffmpeg filter to apply")]
        [String]$filter = ""
        )
     $LoadCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("LoadCommand")
    $LoadCommand.setChannel($channel)
    $LoadCommand.setLayer($layer)
    $LoadCommand.setMedia($media)
    $LoadCommand.setLooping($looping)
    if($seek -ne 0){$LoadCommand.setSeek($seek)}
    if($length -ne 0){$LoadCommand.setLength($length)}
    if($transition){ $PlayCommand.setTransition([ref]$transition)}
    if($filter){$PlayCommand.setFilter($filter)}
     ,$LoadCommand
}
function New-LoadbgCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer,
                
        [Parameter(ParameterSetName='Default', Position=3, Mandatory=$true, HelpMessage="The media to play")]
        [String]$media,
                        
        [Parameter(ParameterSetName='Default', Position=4, Mandatory=$true, HelpMessage="Autostart play? (Default=True)")]
        [Bool]$autostarting,

        [Parameter(ParameterSetName='Default', Position=5, HelpMessage="Loops the media (True,False)")]
        [Bool]$looping = $False,

        [Parameter(ParameterSetName='Default', Position=6, HelpMessage="The Number of frames to seek before playing")]
        [Long]$seek=0,

        [Parameter(ParameterSetName='Default', Position=7, HelpMessage="The number of frames to play")]
        [Long]$length=0,

        [Parameter(ParameterSetName='Default', Position=8, HelpMessage=" The transition to perform at start")]
        $transition,

        [Parameter(ParameterSetName='Default', Position=9, HelpMessage="The ffmpeg filter to apply")]
        [String]$filter = ""
        )
     $LoadbgCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("LoadbgCommand")
    $LoadbgCommand.setChannel($channel)
    $LoadbgCommand.setLayer($layer)
    $LoadbgCommand.setMedia($media)
    $LoadbgCommand.setAutostarting($autostarting)
    $LoadbgCommand.setLooping($looping)
    if($seek -ne 0){$LoadbgCommand.setSeek($seek)}
    if($length -ne 0){$LoadbgCommand.setLength($length)}
    if($transition){ $PlayCommand.setTransition([ref]$transition)}
    if($filter){$PlayCommand.setFilter($filter)}
     ,$LoadbgCommand
}
function New-RouteCommand{
    <# .Synopsis
	Routes a channel or layer to an other channel or layer
	*channel: The channel
	*layer: The layer
	*source channel: The source channel (content)
	*source layer: The source layer (content)
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, HelpMessage="Please specify the layer #")]
        [Int]$layer,
        
        [Parameter(ParameterSetName='Default', Position=3, HelpMessage="Please specify the source channel #")]
        [Int]$schannel,

        [Parameter(ParameterSetName='Default', Position=4, HelpMessage="Please specify the source layer #")]
        [Int]$slayer
        )
     $RouteCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("RouteCommand")
    if($channel){$RouteCommand.setChannel($channel)}
    if($channel){$RouteCommand.setLayer($layer)}
    if($channel){$RouteCommand.setSourceChannel($schannel)}
    if($channel){$RouteCommand.setSourceLayer($slayer)}
    ,$RouteCommand

}
function New-PauseCommand{
    <# .Synopsis
	Pauses the given channel or layer
	*channel: The channel
	*layer: The layer
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1,  HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2,  HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $PauseCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("PauseCommand")
    if($channel){$RouteCommand.setChannel($channel)}
    if($layer){$RouteCommand.setLayer($layer)}
     ,$PauseCommand
}
function New-ResumeCommand{
    <# .Synopsis
	Resumes a paused clip on the given channel or layer
	*channel: The channel
	*layer: The layer
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $ResumeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ResumeCommand")
}
function New-CallCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer,
                        
        [Parameter(ParameterSetName='Default', Position=3, HelpMessage="Loops the media (True,False)")]
        [Bool]$looping = $False,

        [Parameter(ParameterSetName='Default', Position=4, HelpMessage="The Number of frames to seek before playing")]
        [Long]$seek=0,

        [Parameter(ParameterSetName='Default', Position=5, HelpMessage="The number of frames to play")]
        [Long]$length=0,

        [Parameter(ParameterSetName='Default', Position=6, HelpMessage=" The transition to perform at start")]
        $transition,

        [Parameter(ParameterSetName='Default', Position=7, HelpMessage="The ffmpeg filter to apply")]
        [String]$filter = ""
        )
    $CallCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CallCommand")
    $CallCommand.setChannel($channel)
    $CallCommand.setLayer($layer)
    $CallCommand.setLooping($looping)
    if($seek -ne 0){$CallCommand.setSeek($seek)}
    if($length -ne 0){$CallCommand.setLength($length)}
    if($transition){ $CallCommand.setTransition([ref]$transition)}
    if($filter){$CallCommand.setFilter($filter)}
    ,$CallCommand

}
function New-SwapCommand{
    <# .Synopsis
	Swaps the given channels or layers
	*channelA: The first channel
	*channelB: The second channel
	*layerA: The first layer
	*layerB: The second layer
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $SwapCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("SwapCommand")
}
function New-ClearCommand{
    <# .Synopsis
	Clears the server channels, a given channel or layer
	*channel: The channel
	*layer: The layer
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $ClearCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ClearCommand")
     if($channel){$ClearCommand.setChannel($channel)}
     if($layer){$ClearCommand.setLayer($layer)}
     ,$ClearCommand
}

function New-AddCommand{
    <# .Synopsis
	Adds a consumer to a given channel
	*channel: The channel
	*consumer: The consumer to add to the channel i.e. SCREEN or FILE.
	*parameter: The paramter list
    .Example1
    Add-Command 1 STREAM "udp://localhost:5004 -vcodec libx264 -tune zerolatency -preset ultrafast -crf 25 -format mpegts -vf scale=240:180"
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the consumer type (DECKLINK, BLUEFISH SCREEN, AUDIO, FILE or STREAM")]
        [String]$consumer,

        [Parameter(ParameterSetName='Default', Position=2, HelpMessage="Please specify the consumer parameters (Card #, Filename or ffmpeg parameters")]
        [string]$parameters
        )
    $AddCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("AddCommand")
    $AddCommand.setChannel($channel)
    $AddCommand.setConsumer($consumer)
    if($parameters){$AddCommand.setParameters($parameters)}
     ,$AddCommand 
}


function New-RemoveCommand{
    <# .Synopsis
	Removes a consumer from a given channel
	*channel: The channel
	*consumer: The consumer to add to the channel i.e. SCREEN or FILE.
	*parameter: The paramter list
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the consumer type (DECKLINK, BLUEFISH SCREEN, AUDIO, FILE or STREAM")]
        [Int]$consumer,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the consumer parameters")]
        [string]$parameters
)
    $RemoveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("RemoveCommand")
    $RemoveCommand.setChannel($channel)
    $RemoveCommand.setConsumer($consumer)
    if($parameters){$RemoveCommand.setParameters($parameters)}
     ,$RemoveCommand 
}

function New-PrintCommand{
    <# .Synopsis
	Saves a screenshot of a given channel
	*channel: The channel
	*file: The destination filename
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,
        
        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the filename to save")]
        [string]$file
        )
     $PrintCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("PrintCommand")
    $PrintCommand.setChannel($channel)
    $PrintCommand.setConsumer($file)
     ,$PrintCommand
}
function New-SetCommand{
    <# .Synopsis
	Sets the video mode of the given channel
	*channel: The channel
	*video mode: The video mode
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the video mode")]
        [ValidateSet("PAL","NTSC","576p2500","720p2398","720p2400","720p2500","720p5000","720p2997","720p5994","720p3000","720p6000","1080p2398","1080p2400","1080i5000","1080i5994","1080i6000","1080p2500","1080p2997","1080p3000","1080p5000","1080p5994","1080p6000","1556p2398","1556p2400","1556p2500","2160p2398","2160p2400","2160p2500","2160p2997","2160p3000","dci1080p2398","dci1080p2400","dci1080p2500","dci2160p2398","dci2160p2400","dci2160p2500")]
        [String]$mode
        )
     $SetCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("SetCommand")
    $PrintCommand.setChannel($channel)
    $PrintCommand.setConsumer($mode)
     ,$SetCommand
}

function New-ByeCommand{
    <# .Synopsis
	Disconnects from the server
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $ByeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ByeCommand")
}
function New-KillCommand{
    <# .Synopsis
	Stops the server with exitcode 0
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $KillCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("KillCommand")
}
function New-RestartCommand{
    <# .Synopsis
	Stops the server with exitcode 5
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
     $RestartCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("RestartCommand")
}
function Get-DataListCommand{
    <# .Synopsis
	Lists all stored data on the server
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $DataListCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("DataListCommand")
}

function Set-DataStoreCommand{
    <# .Synopsis
	Stores the given data string by the given key
	*key: The key
	*data: The data string to store
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$key,
        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$data
        )
     $DataStoreCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("DataStoreCommand")
}
function Get-DataRetrieveCommand{
    <# .Synopsis
	Retrieves the data string stored by the given key
	*key: The key
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$key
        )
     $DataRetrieveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("DataRetrieveCommand")
}
function New-DataRemoveCommand{
    <# .Synopsis
	Removes the data string stored by the given key
	*key: The key
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$key
        )
     $DataRemoveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("DataRemoveCommand")
}
function New-ClsCommand{
    <# .Synopsis
	Requests a list of all media files on the server
#>
 
[CmdletBinding()]
     $ClsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ClsCommand")
     ,$ClsCommand
}
function New-TlsCommand{
    <# .Synopsis
	Requests a list of all templates on the server
#> 
[CmdletBinding()]
     $TlsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("TlsCommand")
     ,$TlsCommand
}
function New-CinfCommand{
    <# .Synopsis
	Requests details of a media file on the server
	*media: The media file
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the media file")]
        [String]$media
        )
     $CinfCommand.SetMedia($media)
     ,$CinfCommand
}
function New-InfoCommand{
    <# .Synopsis
	Requests informations about a channel or layer
	*channel: The channel
	*layer: The layer
	*only background: Only show info of background
	*only foreground: Only show info of foreground
	*delay: shows the delay of a channel
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $InfoCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoCommand")

     $InfoCommand
}
function New-InfoTemplateCommand{
    <# .Synopsis
	Requests informations about a template
	*template: The template
#> 
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [String]$template
        )
     $InfoTemplateCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoTemplateCommand")
     $InfoTemplateCommand.setTemplate($template)
     ,$InfoTemplateCommand
}
function New-InfoConfigCommand{
    <# .Synopsis
	Requests the configuration of the server
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $InfoConfigCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoConfigCommand")
     ,$InfoConfigCommand
}
function New-InfoPathsCommand{
    <# .Synopsis
	Requests the path configuration of the server
    .Example1
        $paths = New-InfoPathsCommand
        $cgPaths = $paths.execute([ref]$casparcg)
        $cgPaths.getServerMessage()

#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $InfoPathsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoPathsCommand")
     ,$InfoPathsCommand
}
function New-InfoServerCommand{
    <# .Synopsis
	Requests informations about the connected server
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $InfoServerCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoServerCommand")
     ,$InfoServerCommand
}
function New-InfoSystemCommand{
    <# .Synopsis
	Requests system information of the server
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
     $InfoSystemCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoSystemCommand")
     ,$InfoSystemCommand
}
function New-InfoThreadsCommand{
    <# .Synopsis
	Requests informations about the threads and their names of the connected server
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
     $InfoThreadsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoThreadsCommand")
     ,$InfoThreadsCommand
}
function New-InfoQueuesCommand{
    <# .Synopsis
	Requests informations about the AMCP command queues of the connected server
#> 
     $InfoQueuesCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("InfoQueuesCommand")
     ,$InfoQueuesCommand
}
function New-VersionServerCommand{
    <# .Synopsis
	Requests current server version
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
     $VersionServerCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("VersionServerCommand")
     ,$VersionServerCommand
}
function New-VersionFlashCommand{
    <# .Synopsis
	Requests current flash version on the server
#> 
     $VersionFlashCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("VersionFlashCommand")
     ,$VersionFlashCommand
}
function New-VersionTemplatehostCommand{
    <# .Synopsis
	Requests current templatehost version of the server
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $VersionTemplatehostCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("VersionTemplatehostCommand")
     ,$VersionTemplatehostCommand
}
function New-ThumbnailListCommand{
    <# .Synopsis
	Requests a list of all thumbnails on the server
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $ThumbnailListCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailListCommand")
     ,$ThumbnailListCommand
}
function New-ThumbnailGenerateCommand{
    <# .Synopsis
	Requests the server to (re-)generate the thumbnails for a specific media file
	*media: The media file
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $ThumbnailGenerateCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailGenerateCommand")
}
function New-ThumbnailGenerateAllCommand{
    <# .Synopsis
	Requests the server to (re-)generate thumbnails for all media files
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $ThumbnailGenerateAllCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailGenerateAllCommand")
     ,$ThumbnailGenerateAllCommand
}
function New-ThumbnailRetrieveCommand{
    <# .Synopsis
	Requests the base64 encoded thumbnail for a specific media file
	*media: The media file
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $ThumbnailRetrieveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ThumbnailRetrieveCommand")
     ,$ThumbnailRetrieveCommand
}
function New-CgAddCommand{
    <# .Synopsis
	Adds a flashtemplate to a given channel / layer on a given flashlayer
	*channel: The channel
	*layer: The layer
	*template: The template
	*flashlayer: The flashlayer
	*play on load: Starts playing the template when loaded
	*data: The xml data string
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $CgAddCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgAddCommand")
}

function New-CgRemoveCommand{
    <# .Synopsis
	Removes a flashtemplate on a given flashlayer from a given channel / layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $CgRemoveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgRemoveCommand")
}
function New-CgPlayCommand{
    <# .Synopsis
	Plays a flashtemplate on a given flashlayer from a given channel / layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $CgPlayCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgPlayCommand")
}
function New-CgStopCommand{
    <# .Synopsis
	Stops a flashtemplate on a given flashlayer from a given channel / layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $CgStopCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgStopCommand")
}
function New-CgNextCommand{
    <# .Synopsis
	Triggers a 'continue' in the template on the specified layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $CgNextCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgNextCommand")
}
function New-CgClearCommand{
    <# .Synopsis
	Clears all layers and any state that might be stored
	*channel: The channel
	*layer: The layer
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $CgClearCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgClearCommand")
}
function New-CgUpdateCommand{
    <# .Synopsis
	Sends new data to the template on specified layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
	*data: The xml data string
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $CgUpdateCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgUpdateCommand")
}
function New-CgInvokeCommand{
    <# .Synopsis
	Calls a custom method in the document class of the template on the specified layer
	*channel: The channel
	*layer: The layer
	*flashlayer: The flashlayer
	*method: The methode to invoke
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $CgInvokeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("CgInvokeCommand")
}
function New-ChannelGridCommand{
    <# .Synopsis
	Opens a new channel and displays a grid with the contents of all the existing channels.
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
     $ChannelGridCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("ChannelGridCommand")
}
function New-MixerAnchorCommand{
    <# .Synopsis
	Changes the anchor point around which fill_translation, fill_scale and ROTATION will be done from. x The left anchor point, 0 $ = left edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = right edge of monitor. Higher and lower values allowed. y The top anchor point, 0 $ = top edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = bottom edge of monitor. Higher and lower values allowed.
	*channel: The channel
	*layer: The layer
	*x: x The left anchor point, 0 $ = left edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = right edge of monitor. Higher and lower values allowed.
	*y: y The top anchor point, 0 $ = top edge of monitor, 0.5 $ = middle of monitor, 1.0 $ = bottom edge of monitor. Higher and lower values allowed.
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerAnchorCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerAnchorCommand")
}
function New-MixerBlendCommand{
    <# .Synopsis
	Every layer in the Mixer module can be set to a blend mode over than the default Normal mode, similar to applications like Photoshop. Some common uses are to use screen to make a all the black image data become transparent, or to use add to selectively lighten highlights.
	*channel: The channel
	*layer: The layer
	*blendmode: The blend mode to use with the mixer like, OVERLAY, ADD, SCREEN etc.
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerBlendCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerBlendCommand")
}
function New-MixerBrightnessCommand{
    <# .Synopsis
	Changes the brightness of the specified layer. The value is a float between 0 and 1
	*channel: The channel
	*layer: The layer
	*brightness: The brightness value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerBrightnessCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerBrightnessCommand")
}
function New-MixerChromaCommand{
    <# .Synopsis
	Enables chroma keying on the specified video layer
	*channel: The channel
	*layer: The layer
	*color: The color to key with. Only blue, green or none allowed
	*threshold: The threshold
	*softness: The softness
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerChromaCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerChromaCommand")
}
function New-MixerClearCommand{
    <# .Synopsis
	Reset all transformations
	*channel: The channel
	*layer: The layer
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerClearCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerClearCommand")
}
function New-MixerClipCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerClipCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerClipCommand")
}
function New-MixerContrastCommand{
    <# .Synopsis
	Changes the contrast of the specified layer. The value is a float between 0 and 1
	*channel: The channel
	*layer: The layer
	*contrast: The contrast value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 

[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerContrastCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerContrastCommand")
}
function New-MixerCropCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerCropCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerCropCommand")
}
function New-MixerFillCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerFillCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerFillCommand")
}
function New-MixerGridCommand{
    <# .Synopsis
	Creates a grid of video streams in ascending order of the layer index, i.e. if resolution equals 2 then a 2x2 grid of layers will be created.
	*channel: The channel
	*resolution: The resolution of the grid. i.e. if resolution equals 2 then a 2x2 grid of layers will be created.
	*duration: The the duration of the tween
	*tween: The the tween to use
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel
        )
     $MixerGridCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerGridCommand")
}
function New-MixerKeyerCommand{
    <# .Synopsis
	Replaces layer n+1's alpha channel with the alpha channel of layer n, and hides the RGB channels of layer n. If keyer equals 1 then the specified layer will not be rendered, instead it will be used as the key for the layer above. 
	*channel: The channel
	*layer: The layer
	*keyer: Sets whether or not the keyer should be active
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerKeyerCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerKeyerCommand")
}
function New-MixerLevelsCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerLevelsCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerLevelsCommand")
}
function New-MixerMastervolumeCommand{
    <# .Synopsis
	Changes the volume of an entire channel. 
	*channel: The channel
	*volume: The volume to set the channel to between
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel
        )
     $MixerMastervolumeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerMastervolumeCommand")
}
function New-MixerOpacityCommand{
    <# .Synopsis
	Changes the opacity of the specified layer. The value is a float between 0 and 1
	*channel: The channel
	*layer: The layer
	*opacity: The opacity of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )

     $MixerOpacityCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerOpacityCommand")
}
function New-MixerPerspectiveCommand{
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
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer,
                
        [Parameter(ParameterSetName='Default', Position=3, Mandatory=$true, HelpMessage="Please specify the topLeftX")]
        [Int]$topLeftX,
        
        [Parameter(ParameterSetName='Default', Position=4, Mandatory=$true, HelpMessage="Please specify the topLeftY")]
        [Int]$topLeftY,
        
        [Parameter(ParameterSetName='Default', Position=5, Mandatory=$true, HelpMessage="Please specify the topRightX")]
        [Int]$topRightX,
        
        [Parameter(ParameterSetName='Default', Position=6, Mandatory=$true, HelpMessage="Please specify the topRightY")]
        [Int]$topRightY,
        
        [Parameter(ParameterSetName='Default', Position=7, Mandatory=$true, HelpMessage="Please specify the bottomRightX")]
        [Int]$bottomRightX,
                
        [Parameter(ParameterSetName='Default', Position=8, Mandatory=$true, HelpMessage="Please specify the bottomRightY")]
        [Int]$bottomRightY,
                
        [Parameter(ParameterSetName='Default', Position=9, Mandatory=$true, HelpMessage="Please specify the bottomLeftX")]
        [Int]$bottomLeftX,
                
        [Parameter(ParameterSetName='Default', Position=10, Mandatory=$true, HelpMessage="Please specify the bottomLeftY")]
        [Int]$bottomLeftY,
                
        [Parameter(ParameterSetName='Default', Position=11, Mandatory=$true, HelpMessage="Please specify the duration")]
        [Int]$duration,
                
        [Parameter(ParameterSetName='Default', Position=12, Mandatory=$true, HelpMessage="Please specify the tween")]
        [String]$tween

        )
     $MixerPerspectiveCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerPerspectiveCommand")
}
function New-MixerRotationCommand{
    <# .Synopsis
	Returns or modifies the angle of which a layer is rotated by (clockwise degrees) around the point specified by ANCHOR.
	*channel: The channel
	*layer: The layer
	*angle: The angle of which a layer is rotated by (clockwise degrees) around the point specified by ANCHOR.
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerRotationCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerRotationCommand")
}
function New-MixerSaturationCommand{
    <# .Synopsis
	Changes the saturation of the specified layer. The value is a float between 0 and 1
	*channel: The channel
	*layer: The layer
	*saturation: The saturation value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#> 
[CmdletBinding(DefaultParameterSetName="Default")]
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerSaturationCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerSaturationCommand")
}
function New-MixerStraightAlphaOutputCommand{
    <# .Synopsis
	If enabled, causes RGB values to be divided with the alpha for the given video channel before the image is sent to consumers. 
	*channel: The channel
	*layer: The layer
	*active: Sets whether or not straight alpha output should be active
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerStraightAlphaOutputCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerStraightAlphaOutputCommand")
}
function New-MixerVolumeCommand{
    <# .Synopsis
	Changes the volume of the specified layer
	*channel: The channel
	*layer: The layer
	*volume: The volume value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer
        )
     $MixerVolumeCommand = [CasparCGNETConnector.CasparCGCommandFactory]::getCommand("MixerVolumeCommand")

     ,$MixerVolumeCommand
}

function New-Transition{
    <# .Synopsis
	Creates a transition object for use by [ref] in other commands
	*type: The channel
	*direction: The layer
	*time: The volume value of the layer
	*duration: The the duration of the tween
	*tween: The the tween to use
#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the transition type (CUT, MIX, PUSH, SLIDE or WIPE)")]
        [ValidateSet("CUT", "MIX", "PUSH", "SLIDE", "WIPE")]
        [String]$type,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the transition duration")]
        [Int]$duration,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the transition direction (FROMLEFT or FROMRIGHT)")]
        [ValidateSet("FROMLEFT", "FROMRIGHT")]
        [String]$direction,
        
        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the transition tween")]
        [ValidateSet('Linear','EaseNone','EaseInQuad','EaseOutQuad','EaseInOutQuad','EaseOutInQuad','EaseInCubic','EaseOutCubic','EaseInOutCubic','EaseOutInCubic','EaseInQuart','EaseOutQuart','EaseInOutQuart','EaseOutInQuart','EaseInQuint','EaseOutQuint','EaseInOutQuint','EaseOutInQuint','EaseInSine','EaseOutSine','EaseInOutSine','EaseOutInSine','EaseInExpo','EaseOutExpo','EaseInOutExpo','EaseOutInExpo','EaseInCirc','EaseOutCirc','EaseInOutCirc','EaseOutInCirc','EaseInElastic','EaseOutElastic','EaseInOutElastic','EaseOutInElastic','EaseInBack','EaseOutBack','EaseInOutBack','EaseOutInBack','EaseOutBounce','EaseInBounce','EaseInOutBounce','EaseOutInBounce')]
        [String]$tween
        )
        $transition = [CasparCGNETConnector.CasparCGTransition]::New($type, 200)
        #TBA
        ,$transition
}
function New-DecklinkProducer{
    <# .Synopsis
	Creates a new Decklink Producer string for use with ,$connection.sendCommand()
	*channel: The channel
	*layer: The layer
	*device: The decklink device ID
	*mode: The video standard

#>
[CmdletBinding(DefaultParameterSetName="Default")] 
param (

        [Parameter(ParameterSetName='Default', Position=1, Mandatory=$true, HelpMessage="Please specify the channel #")]
        [Int]$channel,

        [Parameter(ParameterSetName='Default', Position=2, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$layer,

        [Parameter(ParameterSetName='Default', Position=3, Mandatory=$true, HelpMessage="Please specify the layer #")]
        [Int]$device,

        [Parameter(ParameterSetName='Default', Position=4, Mandatory=$true, HelpMessage="Please specify the video mode")]
        [ValidateSet("PAL","NTSC","576p2500","720p2398","720p2400","720p2500","720p5000","720p2997","720p5994","720p3000","720p6000","1080p2398","1080p2400","1080i5000","1080i5994","1080i6000","1080p2500","1080p2997","1080p3000","1080p5000","1080p5994","1080p6000","1556p2398","1556p2400","1556p2500","2160p2398","2160p2400","2160p2500","2160p2997","2160p3000","dci1080p2398","dci1080p2400","dci1080p2500","dci2160p2398","dci2160p2400","dci2160p2500")]
        [String]$mode
        )
        $DecklinkProducer = "PLAY " + $channel + "-" +$layer+ " DECKLINK DEVICE " + $device + " FORMAT " + $mode
        ,$DecklinkProducer
}