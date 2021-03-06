# Yodamiitti Intune Management GUI - Community Edition
# This Community Edition GUI has some advanced features which are not available in official Intune Web GUI
# 
# This is not full replacement for official Intune Web GUI
#
# https://github.com/petripaavola/Yodamiitti_IntuneManagementGUI_CommunityEdition
#
# Petri.Paavola@yodamiitti.fi
# Microsoft MVP

$ScriptVersion = "ver 1.0"

# Note to myself: Save this .ps1 file to Unicode so scandic letters work!

#region XAML

#PUT XAML BELOW between the @" "@
$inputXML = @"
<Window x:Name="Intune_Management_GUI" x:Class="IntuneManagementGUI.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:IntuneManagementGUI"
        mc:Ignorable="d"
        Title="Yodamiitti Intune Management GUI - Community Edition ver. 1.0" Width="1280" Height="720" MinWidth="950" MinHeight="530"  WindowStyle="ThreeDBorderWindow">
    <Window.TaskbarItemInfo>
        <TaskbarItemInfo/>
    </Window.TaskbarItemInfo>
    <Grid Background="#FFE5EEFF">
        <Grid.RowDefinitions>
            <RowDefinition Height="*" MinHeight="300"/>
            <RowDefinition Height="100" MinHeight="100"/>
        </Grid.RowDefinitions>
        <TabControl x:Name="tabControlMainWindow" Grid.Row="0" Grid.Column="0" Margin="5,5,0,0" Background="#FFE5EEFF" Foreground="White">
            <TabItem x:Name="TABOverview" Header="Overview" Background="#FFE5EEFF">
                <Grid x:Name="GridOverviewTAB">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*" MinWidth="400"/>
                    </Grid.ColumnDefinitions>
                    <Border x:Name="BorderTABOverview" Grid.Row="0" Grid.RowSpan="3" Grid.Column="0" BorderBrush="Black" BorderThickness="1" Margin="0,0,2,2" Background="#FFF7F7F7" CornerRadius="8">
                        <Grid x:Name="GridOverviewTABMainWindow" Grid.Row="0">
                            <Button x:Name="OverviewTAB_button_ConnectMSGraph" Content="Connect-MSGraph" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" Width="113"/>
                            <Label x:Name="OverViewTAB_label_enrolledDeviceCount" Content="enrolled Device Count" HorizontalAlignment="Left" Margin="10,53,0,0" VerticalAlignment="Top" Width="155" Foreground="Black"/>
                            <TextBox x:Name="OverViewTAB_textBox_enrolledDeviceCount" HorizontalAlignment="Left" Height="23" Margin="170,56,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" IsReadOnly="True"/>
                            <Label x:Name="OverviewTAB_label_mdmEnrolledCount" Content="mdm Enrolled Count" HorizontalAlignment="Left" Margin="10,79,0,0" VerticalAlignment="Top" Width="155" Foreground="Black"/>
                            <TextBox x:Name="OverviewTAB_textBox_mdmEnrolledCount" HorizontalAlignment="Left" Height="23" Margin="170,82,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" IsReadOnly="True"/>
                            <Label x:Name="OverviewTAB_label_dualEnrolledDeviceCount" Content="dual Enrolled Device Count" HorizontalAlignment="Left" Margin="10,105,0,0" VerticalAlignment="Top" Width="155" Foreground="Black"/>
                            <TextBox x:Name="OverviewTAB_textBox_dualEnrolledDeviceCount" HorizontalAlignment="Left" Height="23" Margin="170,108,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" IsReadOnly="True"/>
                            <Rectangle x:Name="OverviewTAB_rectangle_IntuneEnrolledDevices" Fill="White" HorizontalAlignment="Left" Height="198" Margin="10,136,0,0" Stroke="Black" VerticalAlignment="Top" Width="219"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_IntuneEnrolledDevices" HorizontalAlignment="Left" Margin="24,147,0,0" TextWrapping="Wrap" Text="Intune Enrolled Devices" VerticalAlignment="Top" Height="18" Width="160"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_PLATFORM" HorizontalAlignment="Left" Margin="23,170,0,0" TextWrapping="Wrap" Text="PLATFORM" VerticalAlignment="Top"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_DEVICES" HorizontalAlignment="Left" Margin="139,170,0,0" TextWrapping="Wrap" Text="DEVICES" VerticalAlignment="Top"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_Windows" HorizontalAlignment="Left" Margin="24,195,0,0" TextWrapping="Wrap" Text="Windows" VerticalAlignment="Top"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_Android" HorizontalAlignment="Left" Margin="23,215,0,0" TextWrapping="Wrap" Text="Android" VerticalAlignment="Top"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_iOS" HorizontalAlignment="Left" Margin="23,237,0,0" TextWrapping="Wrap" Text="iOS" VerticalAlignment="Top"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_macOS" HorizontalAlignment="Left" Margin="24,259,0,0" TextWrapping="Wrap" Text="macOS" VerticalAlignment="Top"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_WindowsMobile" HorizontalAlignment="Left" Margin="23,279,0,0" TextWrapping="Wrap" Text="Windows Mobile" VerticalAlignment="Top"/>
                            <TextBox x:Name="OverviewTAB_textBox_Windows" HorizontalAlignment="Left" Height="23" Margin="139,191,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="75" IsReadOnly="True"/>
                            <TextBox x:Name="OverviewTAB_textBox_Android" HorizontalAlignment="Left" Height="23" Margin="139,212,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="75" IsReadOnly="True"/>
                            <TextBox x:Name="OverviewTAB_textBox_iOS" HorizontalAlignment="Left" Height="23" Margin="139,233,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="75" IsReadOnly="True"/>
                            <TextBox x:Name="OverviewTAB_textBox_WindowsMobile" HorizontalAlignment="Left" Height="23" Margin="139,275,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="75" IsReadOnly="True"/>
                            <TextBox x:Name="OverviewTAB_textBox_macOS" HorizontalAlignment="Left" Height="23" Margin="139,254,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="75" IsReadOnly="True"/>
                            <Button x:Name="OverviewTAB_button_Refresh" Content="Refresh" HorizontalAlignment="Left" Margin="154,10,0,0" VerticalAlignment="Top" Width="75"/>
                            <Label x:Name="OverviewTAB_label_ConnectedAs" Content="Connected As" HorizontalAlignment="Left" Margin="292,10,0,0" VerticalAlignment="Top" Foreground="Black"/>
                            <Label x:Name="OverviewTAB_label_TenantId" Content="TenantId" HorizontalAlignment="Left" Margin="292,35,0,0" VerticalAlignment="Top" Width="83" Foreground="Black"/>
                            <TextBox x:Name="OverviewTAB_textBox_ConnectedAs" HorizontalAlignment="Left" Height="23" Margin="390,11,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="240" IsReadOnly="True"/>
                            <TextBox x:Name="OverviewTAB_textBox_TenantId" HorizontalAlignment="Left" Height="23" Margin="390,37,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="240" IsReadOnly="True"/>
                            <TextBlock x:Name="OverviewTAB_textBlock_Unknown" HorizontalAlignment="Left" Margin="23,300,0,0" TextWrapping="Wrap" Text="Unknown" VerticalAlignment="Top"/>
                            <TextBox x:Name="OverviewTAB_textBox_Unknown" HorizontalAlignment="Left" Height="23" Margin="139,296,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="75" IsReadOnly="True"/>
                        </Grid>
                    </Border>
                </Grid>
            </TabItem>
            <TabItem x:Name="TABDevices" Header="Devices" Background="#FFE5EEFF">
                <Grid x:Name="TABGridGroups" Background="#FFE5EEFF">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*" MinWidth="400"/>
                        <ColumnDefinition MinWidth="300" MaxWidth="300"/>
                    </Grid.ColumnDefinitions>
                    <Border x:Name="DevicesTABBorderLeft" Grid.Row="0" Grid.RowSpan="3" Grid.Column="0" BorderBrush="Black" BorderThickness="1" Margin="0,0,2,2" CornerRadius="8" Background="#FFF7F7F7">
                        <Grid x:Name="DevicesTABGridLeft" Grid.Row="0" ShowGridLines="False" >
                            <Grid.RowDefinitions>
                                <RowDefinition Height="*" MinHeight="130" MaxHeight="130"/>
                                <RowDefinition MinHeight="150"/>
                                <RowDefinition Height="*" MinHeight="50" MaxHeight="50"/>
                            </Grid.RowDefinitions>
                            <Button x:Name="DevicesTAB_button_GetAllDevices" Content="Get Devices" Grid.Row="0" HorizontalAlignment="Left" Margin="18,38,0,0" VerticalAlignment="Top" Width="139"/>
                            <ListView x:Name="DevicesTAB_listView_ManagedDevices" Grid.Row="1" Margin="5,5,5,5" IsManipulationEnabled="True">
                                <ListView.ContextMenu>
                                    <ContextMenu IsTextSearchEnabled="True">
                                        <MenuItem x:Name = 'DevicesTAB_ListView_CopyToClipBoardJSON_Menu' Header = 'Copy to clipboard JSON'/>
                                        <!-- <MenuItem x:Name = 'DevicesTAB_ListView_CopyToClipBoardCSV_Menu' Header = 'Copy to clipboard CSV'/> -->
                                        <Separator />
                                        <MenuItem Header = 'Device Actions'>
                                            <MenuItem x:Name = 'DevicesTAB_ListView_RunActionSync_Menu' Header = 'Sync'></MenuItem>
                                            <MenuItem x:Name = 'DevicesTAB_ListView_RunActionRebootNow_Menu' Header = 'Reboot'></MenuItem>
                                        </MenuItem>
                                    </ContextMenu>
                                </ListView.ContextMenu>
                                <ListView.View>
                                    <GridView>
                                        <GridViewColumn Width="130" Header="ComplianceState">
                                            <GridViewColumn.CellTemplate>
                                                <DataTemplate>
                                                    <StackPanel Orientation="Horizontal">
                                                        <!-- <Image Width="15" Source="$PSScriptRoot\cache\Compliant.png"/> -->
                                                        <Image Width="15" Height="15" Margin="0,0,5,0" Source="{Binding ComplianceStateImage}"/>
                                                        <TextBlock Text="{Binding complianceState}"/>
                                                    </StackPanel>
                                                </DataTemplate>
                                            </GridViewColumn.CellTemplate>
                                        </GridViewColumn>
                                        <GridViewColumn Width="120" Header="DeviceName" DisplayMemberBinding="{Binding deviceName}"/>
                                        <!-- <GridViewColumn Width="130" Header="complianceState" DisplayMemberBinding="{Binding complianceState2}"/> -->
                                        <GridViewColumn Width="130" Header="userDisplayName" DisplayMemberBinding="{Binding userDisplayName}"/>
                                        <GridViewColumn Width="160" Header="userPrincipalName" DisplayMemberBinding="{Binding userPrincipalName}"/>
                                        <GridViewColumn Width="160" Header="emailAddress" DisplayMemberBinding="{Binding emailAddress}"/>
                                        <GridViewColumn Width="150" Header="deviceCategoryDisplayName" DisplayMemberBinding="{Binding deviceCategoryDisplayName}"/>
                                        <GridViewColumn Width="150" Header="lastSyncDateTime" DisplayMemberBinding="{Binding lastSyncDateTime}"/>
                                        <GridViewColumn Width="150" Header="enrolledDateTime" DisplayMemberBinding="{Binding enrolledDateTime}"/>
                                        <GridViewColumn Width="150" Header="managedDeviceOwnerType" DisplayMemberBinding="{Binding managedDeviceOwnerType}"/>
                                        <GridViewColumn Width="100" Header="operatingSystem" DisplayMemberBinding="{Binding operatingSystem}"/>
                                        <GridViewColumn Width="100" Header="osVersion" DisplayMemberBinding="{Binding osVersion}"/>
                                        <GridViewColumn Width="150" Header="manufacturer" DisplayMemberBinding="{Binding manufacturer}"/>
                                        <GridViewColumn Width="150" Header="model" DisplayMemberBinding="{Binding model}"/>
                                        <GridViewColumn Width="100" Header="serialNumber" DisplayMemberBinding="{Binding serialNumber}"/>
                                        <GridViewColumn Width="100" Header="wiFiMacAddress" DisplayMemberBinding="{Binding wiFiMacAddress}"/>
                                        <GridViewColumn Width="80" Header="isEncrypted" DisplayMemberBinding="{Binding isEncrypted}"/>
                                        <GridViewColumn Width="100" Header="totalStorageSpaceInBytes" DisplayMemberBinding="{Binding totalStorageSpaceInBytes}"/>
                                        <GridViewColumn Width="100" Header="freeStorageSpaceInBytes" DisplayMemberBinding="{Binding freeStorageSpaceInBytes}"/>
                                        <GridViewColumn Width="150" Header="managedDeviceName" DisplayMemberBinding="{Binding managedDeviceName}"/>
                                        <GridViewColumn Width="100" Header="jailBroken" DisplayMemberBinding="{Binding jailBroken}"/>
                                        <GridViewColumn Width="100" Header="managementAgent" DisplayMemberBinding="{Binding managementAgent}"/>
                                        <GridViewColumn Width="100" Header="azureADRegistered" DisplayMemberBinding="{Binding azureADRegistered}"/>
                                        <GridViewColumn Width="155" Header="deviceEnrollmentType" DisplayMemberBinding="{Binding deviceEnrollmentType}"/>
                                        <GridViewColumn Width="150" Header="deviceRegistrationState" DisplayMemberBinding="{Binding deviceRegistrationState}"/>
                                        <GridViewColumn Width="150" Header="id" DisplayMemberBinding="{Binding id}"/>
                                        <GridViewColumn Width="150" Header="azureADDeviceId" DisplayMemberBinding="{Binding azureADDeviceId}"/>
                                    </GridView>
                                </ListView.View>
                            </ListView>
                            <Label x:Name="DevicesTAB_label_SearchGrid" Content="Search from Grid" Grid.Row="0" HorizontalAlignment="Left" Margin="52,99,0,0" VerticalAlignment="Top" Width="115" FontWeight="Bold"/>
                            <TextBox x:Name="DevicesTAB_textBox_SearchGrid" Grid.Row="0" HorizontalAlignment="Left" Height="23" Margin="172,99,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="339"/>
                            <Label x:Name="DevicesTAB_label_SearchDevicesWithFilter" Content="Add GraphAPI Filter for Device Search        Reset filters" Grid.Row="0" HorizontalAlignment="Left" Margin="172,10,0,0" VerticalAlignment="Top" Width="337" FontWeight="Bold"/>
                            <ComboBox x:Name="DevicesTAB_comboBox_DeviceSearchFilter" Grid.Row="0" HorizontalAlignment="Left" Margin="532,65,0,0" VerticalAlignment="Top" Width="416" IsEditable="True" IsReadOnly="True"/>
                            <ComboBox x:Name="DevicesTAB_comboBox_DeviceFilterAttribute" Grid.Row="0" HorizontalAlignment="Left" Margin="172,35,0,0" VerticalAlignment="Top" Width="190"/>
                            <ComboBox x:Name="DevicesTAB_comboBox_DeviceFilterOperator" Grid.Row="0" HorizontalAlignment="Left" Margin="381,35,0,0" VerticalAlignment="Top" Width="130"/>
                            <ComboBox x:Name="DevicesTAB_comboBox_DeviceFilterSearchText" Grid.Row="0" HorizontalAlignment="Left" Margin="532,35,0,0" VerticalAlignment="Top" Width="416" MinWidth="50" MaxWidth="416" IsEditable="True"/>
                            <Button x:Name="DevicesTAB_button_LoadMore" Content="Load more" Grid.Row="2" HorizontalAlignment="Left" Margin="412,2,0,0" VerticalAlignment="Top" Width="149" IsEnabled="False"/>
                            <CheckBox x:Name="DevicesTAB_checkBox_Windows10" Grid.Row="0" Content="Windows 10" HorizontalAlignment="Left" Margin="199,69,0,0" VerticalAlignment="Top" Width="94" IsChecked="True"/>
                            <CheckBox x:Name="DevicesTAB_checkBox_Android" Grid.Row="0" Content="Android" HorizontalAlignment="Left" Margin="298,69,0,0" VerticalAlignment="Top" Width="72" IsChecked="True"/>
                            <CheckBox x:Name="DevicesTAB_checkBox_iOS" Grid.Row="0" Content="iOS" HorizontalAlignment="Left" Margin="375,69,0,0" VerticalAlignment="Top" Width="66" IsChecked="True"/>
                            <CheckBox x:Name="DevicesTAB_checkBox_macOS" Grid.Row="0" Content="macOS" HorizontalAlignment="Left" Margin="446,69,0,0" VerticalAlignment="Top" Width="65" IsChecked="True"/>
                            <Label x:Name="DevicesTAB_label_UsingFilter" Grid.Row="0" Content="Graph API filter used in search" HorizontalAlignment="Left" Margin="776,87,0,0" VerticalAlignment="Top" Width="172"/>
                            <ComboBox x:Name="DevicesTAB_comboBox_PagingNumber" Grid.Row="0" HorizontalAlignment="Left" Margin="18,10,0,0" VerticalAlignment="Top" Width="57" IsReadOnly="True" FontSize="10"/>
                            <Label x:Name="DevicesTAB_label_PagingNumber" Grid.Row="0" Content="Number of devices&#xD;&#xA;to get (Paging)" HorizontalAlignment="Left" Margin="78,2,0,0" VerticalAlignment="Top" Height="34" Width="138" FontSize="9"/>
                            <CheckBox x:Name="DevicesTAB_checkBox_SearchEveryAttribute" Grid.Row="0" Content="Search all attributes (slow)" HorizontalAlignment="Left" Margin="516,105,0,0" VerticalAlignment="Top"/>
                            <TextBox x:Name="DevicesTAB_textBox_NumberOfDevicesShown" Grid.Row="2" HorizontalAlignment="Left" Height="23" Margin="334,2,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" FontWeight="Bold" HorizontalContentAlignment="Right"/>
                            <Label x:Name="DevicesTAB_label_DevicesInGrid" Content="Devices shown in Grid" Grid.Row="2" HorizontalAlignment="Left" Margin="193,0,0,0" VerticalAlignment="Top" Height="26" FontWeight="Bold" Width="136"/>
                            <TextBox x:Name="DevicesTAB_textBox_NumberOfDevicesSelected" Grid.Row="2" HorizontalAlignment="Left" Height="23" Margin="334,25,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" HorizontalContentAlignment="Right" FontWeight="Bold"/>
                            <Label x:Name="DevicesTAB_label_DevicesSelected" Content="Devices selected" Grid.Row="2" HorizontalAlignment="Left" Margin="193,20,0,-0.4" VerticalAlignment="Top" Height="30" FontWeight="Bold" Width="116"/>
                            <TextBox x:Name="DevicesTAB_textBox_DevicesTotalCountSearched" Grid.Row="2" HorizontalAlignment="Left" Height="23" Margin="130,2,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" FontWeight="Bold" HorizontalContentAlignment="Right"/>
                            <Label x:Name="DevicesTAB_label_DevicesTotalCountSearched" Content="Total Devices loaded" Grid.Row="2" HorizontalAlignment="Left" VerticalAlignment="Top" Height="26" FontWeight="Bold"/>
                            <Image x:Name="DevicesTAB_image_SearchFromGrid_X" HorizontalAlignment="Left" Height="17" Margin="492,102,0,0" VerticalAlignment="Top" Width="17"/>
                            <Image x:Name="DevicesTAB_image_ResetFilters_X" HorizontalAlignment="Left" Height="17" Margin="489,13,0,0" VerticalAlignment="Top" Width="17"/>
                        </Grid>
                    </Border>
                    <Border x:Name="DevicesTABRightBorder" Grid.Row="0" Grid.RowSpan="3" Grid.Column="1" BorderBrush="Black" BorderThickness="1" Margin="0,0,2,2" CornerRadius="8" Background="#FFF7F7F7">
                        <Grid x:Name="DevicesTABRightGrid">
                            <TextBlock x:Name="DevicesTAB_textBlock_SetDeviceOwnerType" HorizontalAlignment="Left" Margin="161,108,0,0" TextWrapping="Wrap" Text="Set DeviceOwnerType" VerticalAlignment="Top" FontWeight="Bold"/>
                            <ComboBox x:Name="DevicesTAB_comboBox_DeviceOwnerTypes" HorizontalAlignment="Left" Margin="80,129,0,0" VerticalAlignment="Top" Width="204" SelectedIndex="0"/>
                            <Button x:Name="DevicesTAB_button_SetDeviceOwnerType" Content="Set" HorizontalAlignment="Left" Margin="209,157,0,0" VerticalAlignment="Top" Width="75"/>
                            <TextBlock x:Name="DevicesTAB_textBlock_DeviceAction" HorizontalAlignment="Left" Margin="198,12,0,0" TextWrapping="Wrap" Text="Device Actions" VerticalAlignment="Top" Width="86" FontWeight="Bold"/>
                            <ComboBox x:Name="DevicesTAB_comboBox_DeviceActions" HorizontalAlignment="Left" Margin="80,33,0,0" VerticalAlignment="Top" Width="204" SelectedIndex="0"/>
                            <Button x:Name="DevicesTAB_button_RunDeviceAction" Content="Run Action" HorizontalAlignment="Left" Margin="209,60,0,0" VerticalAlignment="Top" Width="75"/>
                            <TextBlock x:Name="DevicesTAB_textBlock_SetDeviceCategory" HorizontalAlignment="Left" Margin="174,203,0,0" TextWrapping="Wrap" Text="Set DeviceCategory" VerticalAlignment="Top" FontWeight="Bold"/>
                            <ComboBox x:Name="DevicesTAB_comboBox_DeviceCategories" HorizontalAlignment="Left" Margin="80,224,0,0" VerticalAlignment="Top" Width="204" SelectedIndex="0"/>
                            <Button x:Name="DevicesTAB_button_SetDeviceCategory" Content="Set" HorizontalAlignment="Left" Margin="209,252,0,0" VerticalAlignment="Top" Width="75"/>
                        </Grid>
                    </Border>
                </Grid>
            </TabItem>
            <TabItem x:Name="TABApps" Header="Apps" Background="#FFE5EEFF">
                <Grid x:Name="GridAppsTAB" Background="#FFE5EEFF">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*" MinWidth="400"/>
                        <ColumnDefinition MinWidth="300" MaxWidth="300"/>
                    </Grid.ColumnDefinitions>
                    <Border x:Name="AppsTABBorderLeft" Grid.Row="0" Grid.RowSpan="3" Grid.Column="0" BorderBrush="Black" BorderThickness="1" Margin="0,0,2,2" CornerRadius="8" Background="#FFF7F7F7">
                        <Grid x:Name="AppsTABGridLeft" Grid.Row="0" ShowGridLines="False" >
                            <Grid.RowDefinitions>
                                <RowDefinition Height="*" MinHeight="130" MaxHeight="130"/>
                                <RowDefinition MinHeight="150"/>
                                <RowDefinition Height="*" MinHeight="50" MaxHeight="50"/>
                            </Grid.RowDefinitions>
                            <ListView x:Name="AppsTAB_listView_ManagedApps" Grid.Row="1" Margin="5,5,5,5"  IsManipulationEnabled="True">
                                <ListView.ContextMenu>
                                    <ContextMenu IsTextSearchEnabled="True">
                                        <MenuItem x:Name = 'AppsTAB_ListView_CopyToClipBoardJSON_Menu' Header = 'Copy to clipboard JSON'/>
                                        <MenuItem x:Name = 'AppsTAB_ListView_CopyToClipBoardCSV_Menu' Header = 'Copy to clipboard CSV'/>
                                        <Separator />
                                        <MenuItem Header = 'App Actions'>
                                            <MenuItem x:Name = 'AppsTAB_ListView_RunActionSync_Menu' Header = ''></MenuItem>
                                        </MenuItem>
                                    </ContextMenu>
                                </ListView.ContextMenu>
                                <ListView.View>
                                    <GridView>
                                        <!-- <GridViewColumn Width="120" Header="largeIcon" DisplayMemberBinding="{Binding largeIcon}"/> -->
                                        <GridViewColumn Width="30" Header="largeIcon">
                                            <GridViewColumn.CellTemplate>
                                                <DataTemplate>
                                                    <StackPanel Orientation="Horizontal">
                                                        <!-- <Image Width="15" Height="15" Source="$PSScriptRoot\cache\c1b73dc9-3bc3-4ffe-90a7-736c5c2f60d5.png"/> -->
                                                        <Image Width="15" Height="15" Source="{Binding AppLargeIconPath}"/>
                                                    </StackPanel>
                                                </DataTemplate>
                                            </GridViewColumn.CellTemplate>
                                        </GridViewColumn>
                                        <GridViewColumn Width="120" Header="OS" DisplayMemberBinding="{Binding appOSCustomVariable}"/>
                                        <GridViewColumn Width="130" Header="displayName" DisplayMemberBinding="{Binding displayName}"/>
                                        <GridViewColumn Width="160" Header="fileName" DisplayMemberBinding="{Binding fileName}"/>
                                        <GridViewColumn Width="160" Header="productVersion" DisplayMemberBinding="{Binding productVersion}"/>
                                        <GridViewColumn Width="150" Header="version" DisplayMemberBinding="{Binding version}"/>
                                        <GridViewColumn Width="150" Header="publishingState" DisplayMemberBinding="{Binding publishingState}"/>
                                        <!-- <GridViewColumn Width="150" Header="description" DisplayMemberBinding="{Binding description}"/> -->
                                        <GridViewColumn Width="150" Header="isFeatured" DisplayMemberBinding="{Binding isFeatured}"/>
                                        <GridViewColumn Width="100" Header="size" DisplayMemberBinding="{Binding size}"/>
                                        <GridViewColumn Width="100" Header="notes" DisplayMemberBinding="{Binding notes}"/>
                                        <GridViewColumn Width="150" Header="publisher" DisplayMemberBinding="{Binding publisher}"/>
                                        <GridViewColumn Width="150" Header="developer" DisplayMemberBinding="{Binding developer}"/>
                                        <GridViewColumn Width="100" Header="owner" DisplayMemberBinding="{Binding owner}"/>
                                        <GridViewColumn Width="100" Header="informationUrl" DisplayMemberBinding="{Binding informationUrl}"/>
                                        <GridViewColumn Width="80" Header="privacyInformationUrl" DisplayMemberBinding="{Binding privacyInformationUrl}"/>
                                        <GridViewColumn Width="100" Header="createdDateTime" DisplayMemberBinding="{Binding createdDateTime}"/>
                                        <GridViewColumn Width="100" Header="lastModifiedDateTime" DisplayMemberBinding="{Binding lastModifiedDateTime}"/>
                                        <GridViewColumn Width="150" Header="licenseType" DisplayMemberBinding="{Binding licenseType}"/>
                                        <GridViewColumn Width="130" Header="id" DisplayMemberBinding="{Binding id}"/>
                                        <GridViewColumn Width="100" Header="@odata.type" DisplayMemberBinding="{Binding @odata.type}"/>
                                        <GridViewColumn Width="100" Header="mobileAppODataType" DisplayMemberBinding="{Binding mobileAppODataType}"/>
                                        <GridViewColumn Width="100" Header="productCode" DisplayMemberBinding="{Binding productCode}"/>
                                        <GridViewColumn Width="155" Header="packageIdentityName" DisplayMemberBinding="{Binding packageIdentityName}"/>
                                        <GridViewColumn Width="150" Header="packageId" DisplayMemberBinding="{Binding packageId}"/>
                                        <GridViewColumn Width="150" Header="bundleId" DisplayMemberBinding="{Binding bundleId}"/>
                                        <GridViewColumn Width="150" Header="identityName" DisplayMemberBinding="{Binding identityName}"/>
                                        <GridViewColumn Width="150" Header="commandLine" DisplayMemberBinding="{Binding commandLine}"/>
                                        <GridViewColumn Width="150" Header="installCommandLine" DisplayMemberBinding="{Binding installCommandLine}"/>
                                        <GridViewColumn Width="150" Header="uninstallCommandLine" DisplayMemberBinding="{Binding uninstallCommandLine}"/>
                                        <GridViewColumn Width="150" Header="committedContentVersion" DisplayMemberBinding="{Binding committedContentVersion}"/>
                                        <GridViewColumn Width="150" Header="ignoreVersionDetection" DisplayMemberBinding="{Binding ignoreVersionDetection}"/>
                                    </GridView>
                                </ListView.View>
                            </ListView>
                            <Button x:Name="AppsTAB_button_GetAllApps" Grid.Row="0" Content="Get Apps" HorizontalAlignment="Left" Margin="18,38,0,0" VerticalAlignment="Top" Width="139" RenderTransformOrigin="0.501,-0.957"/>
                            <Label x:Name="AppsTAB_label_SearchGrid" Grid.Row="0" Content="Search from Grid" HorizontalAlignment="Left" Margin="66,97,0,0" VerticalAlignment="Top" Width="115" FontWeight="Bold"/>
                            <TextBox x:Name="AppsTAB_textBox_SearchGrid" Grid.Row="0" HorizontalAlignment="Left" Height="23" Margin="172,99,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="339"/>
                            <Label x:Name="AppsTAB_label_SearchAppsWithFilter" Grid.Row="0" Content="Add GraphAPI Filter for Apps Search           Reset filters" HorizontalAlignment="Left" Margin="172,8,0,0" VerticalAlignment="Top" Width="334" FontWeight="Bold"/>
                            <ComboBox x:Name="AppsTAB_comboBox_AppSearchFilter" Grid.Row="0" HorizontalAlignment="Left" Margin="532,65,0,0" VerticalAlignment="Top" Width="416" IsEditable="True" IsReadOnly="True"/>
                            <ComboBox x:Name="AppsTAB_comboBox_AppFilterAttribute" Grid.Row="0"  HorizontalAlignment="Left" Margin="172,35,0,0" VerticalAlignment="Top" Width="190"/>
                            <ComboBox x:Name="AppsTAB_comboBox_AppFilterOperator" Grid.Row="0" HorizontalAlignment="Left" Margin="381,35,0,0" VerticalAlignment="Top" Width="130"/>
                            <ComboBox x:Name="AppsTAB_comboBox_AppFilterSearchText" Grid.Row="0"  HorizontalAlignment="Left" Margin="532,35,0,0" VerticalAlignment="Top" Width="416" IsEditable="True"/>
                            <Button x:Name="AppsTAB_button_LoadMore" Grid.Row="2" Content="Load more" HorizontalAlignment="Left" Margin="412,2,0,0" VerticalAlignment="Top" Width="149" IsEnabled="False"/>
                            <CheckBox x:Name="AppsTAB_checkBox_Win32" Grid.Row="0" Content="Win32" HorizontalAlignment="Left" Margin="172,60,0,0" VerticalAlignment="Top" Width="63" IsChecked="True"/>
                            <CheckBox x:Name="AppsTAB_checkBox_Android" Grid.Row="0" Content="Android" HorizontalAlignment="Left" Margin="172,79,0,0" VerticalAlignment="Top" Width="72" IsChecked="True"/>
                            <CheckBox x:Name="AppsTAB_checkBox_iOSStore" Grid.Row="0" Content="iOS" HorizontalAlignment="Left" Margin="249,79,0,0" VerticalAlignment="Top" Width="51" IsChecked="True"/>
                            <CheckBox x:Name="AppsTAB_checkBox_WebApp" Grid.Row="0" Content="WebApp" HorizontalAlignment="Left" Margin="426,79,0,0" VerticalAlignment="Top" Width="71" IsChecked="True"/>
                            <Label x:Name="AppsTAB_label_UsingFilter" Grid.Row="0" Content="Graph API filter used in search" HorizontalAlignment="Left" Margin="776,87,0,0" VerticalAlignment="Top" Width="172"/>
                            <ComboBox x:Name="AppsTAB_comboBox_PagingNumber" Grid.Row="0" HorizontalAlignment="Left" Margin="18,10,0,0" VerticalAlignment="Top" Width="57" IsReadOnly="True" FontSize="10"/>
                            <Label x:Name="AppsTAB_label_PagingNumber" Grid.Row="0" Content="Number of Apps&#xA;to get (Paging)" HorizontalAlignment="Left" Margin="78,2,0,0" VerticalAlignment="Top" Height="34" Width="138" FontSize="9"/>
                            <CheckBox x:Name="AppsTAB_checkBox_SearchEveryAttribute" Grid.Row="0" Content="Search all attributes (slower)" HorizontalAlignment="Left" Margin="516,105,0,0" VerticalAlignment="Top"/>
                            <TextBox x:Name="AppsTAB_textBox_NumberOfAppsShown" Grid.Row="2" HorizontalAlignment="Left" Height="23" Margin="334,2,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" FontWeight="Bold" HorizontalContentAlignment="Right"/>
                            <Label x:Name="AppsTAB_label_AppsInGrid" Grid.Row="2" Content="Apps shown in Grid" HorizontalAlignment="Left" Margin="193,1,0,0" VerticalAlignment="Top" Height="27" FontWeight="Bold" Width="136"/>
                            <TextBox x:Name="AppsTAB_textBox_NumberOfAppsSelected" Grid.Row="2" HorizontalAlignment="Left" Height="23" Margin="334,25,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" HorizontalContentAlignment="Right" FontWeight="Bold"/>
                            <Label x:Name="AppsTAB_label_AppsSelected" Grid.Row="2" Content="Apps selected" HorizontalAlignment="Left" Margin="193,20,0,-0.4" VerticalAlignment="Top" Height="30" FontWeight="Bold" Width="116"/>
                            <TextBox x:Name="AppsTAB_textBox_AppsTotalCountSearched" Grid.Row="2" HorizontalAlignment="Left" Height="23" Margin="130,2,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="59" FontWeight="Bold" HorizontalContentAlignment="Right"/>
                            <Label x:Name="AppsTAB_label_AppsTotalCountSearched" Grid.Row="2" Content="Total Apps loaded" HorizontalAlignment="Left" Margin="5,1,0,0" VerticalAlignment="Top" Height="26" FontWeight="Bold"/>
                            <CheckBox x:Name="AppsTAB_checkBox_iOSManagedStore" Grid.Row="0" Content="iOS Managed" HorizontalAlignment="Left" Margin="329,79,0,0" VerticalAlignment="Top" Width="92" IsChecked="True"/>
                            <CheckBox x:Name="AppsTAB_checkBox_MSIMobile" Grid.Row="0" Content="MSI Mobile" HorizontalAlignment="Left" Margin="329,60,0,0" VerticalAlignment="Top" Width="84" IsChecked="True"/>
                            <CheckBox x:Name="AppsTAB_checkBox_AppXMSIX" Grid.Row="0" Content="AppX / MSIX" HorizontalAlignment="Left" Margin="426,60,0,0" VerticalAlignment="Top" Width="93" IsChecked="True"/>
                            <CheckBox x:Name="AppsTAB_checkBox_MSStore" Grid.Row="0" Content="MS Store" HorizontalAlignment="Left" Margin="249,60,0,0" VerticalAlignment="Top" Width="75" IsChecked="True"/>
                            <CheckBox x:Name="AppsTAB_checkBox_DownloadIcons" Grid.Row="0" Content="Show icons" HorizontalAlignment="Left" Margin="17,120,0,0" VerticalAlignment="Top" Width="108" ToolTip="This downloads icon files for all apps. First download will take some time as we will save all icon files to cache folder." Grid.RowSpan="2" IsEnabled="False" Visibility="Hidden"/>
                            <Image x:Name="AppsTAB_image_SearchFromGrid_X" HorizontalAlignment="Left" Height="17" Margin="492,102,0,0" VerticalAlignment="Top" Width="17"/>
                            <Image x:Name="AppsTAB_image_ResetFilters_X" HorizontalAlignment="Left" Height="17" Margin="487,13,0,0" VerticalAlignment="Top" Width="17"/>
                            <CheckBox x:Name="AppsTAB_checkBox_OfficeSuiteApp" Grid.Row="0" Content="OfficeSuite" HorizontalAlignment="Left" Margin="48,60,0,0" VerticalAlignment="Top" Width="83" IsChecked="True"/>
                            <CheckBox x:Name="AppsTAB_checkBox_AndroidManagedStore" Grid.Row="0" Content="Android Managed" HorizontalAlignment="Left" Margin="48,79,0,0" VerticalAlignment="Top" Width="119" IsChecked="True"/>
                        </Grid>
                    </Border>
                    <Border x:Name="AppsTABRightBorder" Grid.Row="0" Grid.RowSpan="3" Grid.Column="1" BorderBrush="Black" BorderThickness="1" Margin="0,0,2,2" CornerRadius="8" Background="#FFF7F7F7">
                        <Grid x:Name="AppsTABRightGrid">
                            <TextBlock x:Name="AppsTAB_textBlock_CreateAssignment" HorizontalAlignment="Left" Margin="51,171,0,0" TextWrapping="Wrap" Text="Create App Assignment to selected Apps" VerticalAlignment="Top" Width="239" FontWeight="Bold"/>
                            <ComboBox x:Name="AppsTAB_comboBox_AppAssignment_Intent" HorizontalAlignment="Left" Margin="35,211,0,0" VerticalAlignment="Top" Width="251" SelectedIndex="0"/>
                            <Button x:Name="AppsTAB_button_CreateAppAssignmentToSelectedApps" Content="Create App Assignment" HorizontalAlignment="Left" Margin="150,241,0,0" VerticalAlignment="Top" Width="136"/>
                            <Label x:Name="AppsTAB_label_AppAssignmentIntent" Content="Assignment intent" HorizontalAlignment="Left" Margin="180,186,0,0" VerticalAlignment="Top" Width="114"/>
                            <Label x:Name="AppsTAB_label_AppAssignmentAzureADGroupName" Content="AzureAD Group Name (select this first)" HorizontalAlignment="Left" Margin="59,6,0,0" VerticalAlignment="Top" Width="231" FontWeight="Bold"/>
                            <ComboBox x:Name="AppsTAB_comboBox_AzureADGroupNameForApplicationAssignment" HorizontalAlignment="Left" Margin="35,32,0,0" VerticalAlignment="Top" Width="251" IsEditable="True"/>
                            <Button x:Name="AppsTAB_button_SearchAADGroupForAppAssignment" Content="Search" HorizontalAlignment="Left" Margin="211,60,0,0" VerticalAlignment="Top" Width="75"/>
                            <Button x:Name="AppsTAB_button_ShowAppAssignmentToAADGroup" Content="Show AAD Group App Assignments" HorizontalAlignment="Left" Margin="91,102,0,0" VerticalAlignment="Top" Width="195"/>
                        </Grid>
                    </Border>
                </Grid>
            </TabItem>
            <TabItem x:Name="TABConfiguration" Header="Configurations" Background="#FFE5EEFF" HorizontalAlignment="Left" Height="23" VerticalAlignment="Top" Width="90">
                <Grid>
                    <TabControl x:Name="tabControlConfigurations" Margin="0,0,-0.4,0">
                        <TabItem x:Name="tabConfigurations_tabPowershell" Header="Powershell" Background="#FFE5EEFF">
                            <Grid Background="#FFE5EEFF" Margin="0,0,-6.6,2.6">
                                <Grid.ColumnDefinitions>
                                    <ColumnDefinition Width="*" MinWidth="400"/>
                                    <ColumnDefinition MinWidth="400" MaxWidth="400"/>
                                </Grid.ColumnDefinitions>
                                <Border x:Name="PowershellTABBorderLeft" Grid.Row="0" Grid.RowSpan="3" Grid.Column="0" BorderBrush="Black" BorderThickness="1" Margin="0,0,2,-3" CornerRadius="8" Background="#FFF7F7F7">
                                    <Grid x:Name="PowershellTABGridLeft" Grid.Row="0" ShowGridLines="False" >
                                        <Grid.RowDefinitions>
                                            <RowDefinition Height="*" MinHeight="100" MaxHeight="100"/>
                                            <RowDefinition MinHeight="150"/>
                                        </Grid.RowDefinitions>
                                        <Button x:Name="ConfigurationsTAB_PowershellTAB_button_GetPowershellScripts" Grid.Row="0" Content="Get PS Scripts" HorizontalAlignment="Left" Margin="5,9,0,0" VerticalAlignment="Top" Width="104" FontWeight="Bold"/>
                                        <ComboBox x:Name="ConfigurationsTAB_PowershellTAB_comboBox_PowershellScriptsList" Grid.Row="0" HorizontalAlignment="Left" Margin="156,44,0,0" VerticalAlignment="Top" Width="348" IsReadOnly="True"/>
                                        <Button x:Name="ConfigurationsTAB_PowershellTAB_button_ShowSelectedPowershellScript" Grid.Row="0" Content="View Selected Script" HorizontalAlignment="Left" Margin="5,45,0,0" VerticalAlignment="Top" Width="136" FontWeight="Bold"/>
                                        <Label x:Name="ConfigurationsTAB_PowershellTAB_label_FoundPowershellScripts" Grid.Row="0" Content="Powershell scripts" HorizontalAlignment="Left" Margin="156,19,0,0" VerticalAlignment="Top" RenderTransformOrigin="0.56,-0.617" Width="157" FontWeight="Bold"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_PowershellScript" Grid.Row="1" Margin="5,10,5,10" TextWrapping="Wrap" AcceptsReturn="True" HorizontalScrollBarVisibility="Visible" VerticalScrollBarVisibility="Visible"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_PowershellScriptName" Grid.Row="0" HorizontalAlignment="Left" Height="23" Margin="156,77,0,0" TextWrapping="NoWrap" Text="Powershell script file name" VerticalAlignment="Top" Width="348" MaxWidth="810" MinWidth="200"/>
                                        <Button x:Name="ConfigurationsTAB_PowershellTAB_button_UpdateSelectedPowershellScript" Grid.Row="0" Content="Update Selected Script" HorizontalAlignment="Left" Margin="679,52,0,0" VerticalAlignment="Top" Width="136" FontWeight="Bold" IsEnabled="False" Visibility="Hidden"/>
                                        <StackPanel x:Name="PowershellTAB_stackpanel_upper" HorizontalAlignment="Left" Height="100" Margin="5,0,0,0" VerticalAlignment="Top" Width="846" ScrollViewer.VerticalScrollBarVisibility="Hidden" ScrollViewer.HorizontalScrollBarVisibility="Auto"/>
                                    </Grid>
                                </Border>
                                <Border x:Name="PowershellTABRightBorder" Grid.Row="0" Grid.RowSpan="3" Grid.Column="1" BorderBrush="Black" BorderThickness="1" Margin="0,0,6,-3" CornerRadius="8" Background="#FFF7F7F7">
                                    <Grid x:Name="PowershellTABRightGrid">
                                        <Rectangle Fill="#FFF4F4F5" HorizontalAlignment="Left" Height="178" Margin="5,2,0,0" Stroke="Black" VerticalAlignment="Top" Width="382"/>
                                        <Label x:Name="ConfigurationsTAB_PowershellTAB_label_DisplayName" Content="DisplayName" HorizontalAlignment="Left" Margin="5,5,0,0" VerticalAlignment="Top"/>
                                        <Label x:Name="ConfigurationsTAB_PowershellTAB_label_RunAs" Content="RunAs" HorizontalAlignment="Left" Margin="5,76,0,0" VerticalAlignment="Top"/>
                                        <Label x:Name="ConfigurationsTAB_PowershellTAB_label_PowershellScriptName" Content="Script Name" HorizontalAlignment="Left" Margin="5,52,0,0" VerticalAlignment="Top"/>
                                        <Label x:Name="ConfigurationsTAB_PowershellTAB_label_PowershellScriptDescription" Content="Description" HorizontalAlignment="Left" Margin="5,28,0,0" VerticalAlignment="Top"/>
                                        <Label x:Name="ConfigurationsTAB_PowershellTAB_label_Created" Content="Created" HorizontalAlignment="Left" Margin="5,100,0,0" VerticalAlignment="Top"/>
                                        <Label x:Name="ConfigurationsTAB_PowershellTAB_label_Modified" Content="Modified" HorizontalAlignment="Left" Margin="5,124,0,0" VerticalAlignment="Top"/>
                                        <Label x:Name="ConfigurationsTAB_PowershellTAB_label_EnforceSignatureCheck" Content="Signature" HorizontalAlignment="Left" Margin="5,148,0,0" VerticalAlignment="Top"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_DisplayName" HorizontalAlignment="Left" Height="23" Margin="92,7,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="295" IsReadOnly="True"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_Description" HorizontalAlignment="Left" Height="23" Margin="92,31,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="295" IsReadOnly="True"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_ScriptName" HorizontalAlignment="Left" Height="23" Margin="92,55,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="295" IsReadOnly="True"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_RunAs" HorizontalAlignment="Left" Height="23" Margin="92,79,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="295" IsReadOnly="True"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_CreatedTime" HorizontalAlignment="Left" Height="23" Margin="92,103,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="295" IsReadOnly="True"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_ModifiedTime" HorizontalAlignment="Left" Height="23" Margin="92,127,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="295" IsReadOnly="True"/>
                                        <TextBox x:Name="ConfigurationsTAB_PowershellTAB_textBox_EnforceSigtanure" HorizontalAlignment="Left" Height="23" Margin="92,151,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="295" IsReadOnly="True"/>
                                    </Grid>
                                </Border>
                            </Grid>
                        </TabItem>
                    </TabControl>
                </Grid>
            </TabItem>
            <TabItem x:Name="TABItemAbout" Header="About" Background="#FFE5EEFF">
                <Grid Background="#FFE5EEFF" Margin="0,0,-6.6,2.6">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*" MinWidth="400"/>
                        <ColumnDefinition MinWidth="307" MaxWidth="307"/>
                    </Grid.ColumnDefinitions>
                    <Border x:Name="AboutTABBorderLeft" Grid.Row="0" Grid.RowSpan="3" Grid.Column="0" BorderBrush="Black" BorderThickness="1" Margin="0,0,2,-1" CornerRadius="8" Background="#FFF7F7F7">
                        <Grid x:Name="AboutTABLeftGrid">
                            <Grid.RowDefinitions>
                                <RowDefinition Height="100" MinHeight="100"/>
                                <RowDefinition Height="*"/>
                            </Grid.RowDefinitions>
                            <RichTextBox x:Name="AboutTAB_richTextBox_left_Info" Grid.Row="1" Margin="10,10,10,10" VerticalScrollBarVisibility="Auto" IsReadOnly="True">
                                <FlowDocument>
                                    <Paragraph>
                                        <Run FontWeight="Bold" Text="Prerequisities"/>
                                        <LineBreak/>
                                        <Run Text="- Install Intune Powershell SDK (https://github.com/Microsoft/Intune-PowerShell-SDK)"/>
                                    </Paragraph>
                                    <Paragraph>
                                        <Run FontWeight="Bold" Text="What/Why"/>
                                        <LineBreak/>
                                        <Run Text="- This toolset is built to help Intune admins to do some daily tasks easier and quicker than in Intune Web UI"/>
                                        <LineBreak/>
                                        <Run Text="- This started as Intune Powershell tips&amp;tricks project and then escalated a little bit. Code is in many places still ad-hoc style but it works ;)"/>
                                        <LineBreak/>
                                        <LineBreak/>
                                        <Run FontWeight="Bold" Text="Highlights"/>
                                        <LineBreak/>
                                        <Run Text="- Find Devices and Apps easily with different search filters - eg. show only Windows, iOS or Android related Devices/Apps"/>
                                        <LineBreak/>
                                        <Run Text="- Search by any information found from Intune (Graph API)"/>
                                        <LineBreak/>
                                        <Run Text="- Copy Device/App full information in JSON format to clipboard (with right-click)"/>
                                        <LineBreak/>
                                        <Run Text="- Sort by any column"/>
                                        <LineBreak/>
                                        <Run Text="- Do device actions to multiple Devices at once (sync/reboot/owner/deviceCategory/...)"/>
                                        <LineBreak/>
                                        <Run Text="- Do multiple App assignments to selected AAD Group"/>
                                        <LineBreak/>
                                        <Run Text="- Show Apps which have assignments to selected AAD Group"/>
                                        <LineBreak/>
                                        <Run FontWeight="Bold" Text="- Show Powershell scripts content"/>
                                        <LineBreak/>
                                        <Run/>
                                        <LineBreak/>
                                        <Run FontWeight="Bold" Text="Backlog"/>
                                        <LineBreak/>
                                        <Run Text="- Change script to multi threading model (yes I know, never do UIs on single thread)"/>
                                        <LineBreak/>
                                        <Run Text="- Confirmation popup for actions"/>
                                        <LineBreak/>
                                        <Run Text="- Users and Groups TAB"/>
                                        <LineBreak/>
                                        <Run Text="- Profiles TAB"/>
                                        <LineBreak/>
                                        <Run Text="- Autopilot TAB"/>
                                        <LineBreak/>
                                        <Run Text="- Search devices where user is logged on"/>
                                        <LineBreak/>
                                        <Run Text="- Profile examples for Onedrive for Business and Chrome"/>
                                        <LineBreak/>
                                        <Run Text="- more custom search filters examples"/>
                                        <LineBreak/>
                                        <Run Text="- rewrite everything, document everything - timeframe eternity :)"/>
                                    </Paragraph>
                                    <Paragraph>
                                        <Run FontWeight="Bold" Text="Disclaimer"/>
                                        <LineBreak/>
                                        <Run Text="This tool is provided &quot;AS IS&quot; without any warranties so please evaluate it in test environment before production use. It is provided as Powershell script so there is no closed code and you can evaluate everything it does. Trust is important when using Administrative user rights and tools in your production environment. I use this tool daily in production environments I manage myself."/>
                                    </Paragraph>
                                </FlowDocument>
                            </RichTextBox>
                            <TextBox x:Name="AboutTAB_textBox_github_link" HorizontalAlignment="Left" Height="23" Margin="10,50,0,0" TextWrapping="Wrap" Text="https://github.com/petripaavola/Yodamiitti_IntuneManagementGUI_CommunityEdition" VerticalAlignment="Top" Width="473" IsReadOnly="True"/>
                            <Label x:Name="AboutTAB_label_IntuneManagementGUI" Content="Yodamiitti Intune Management GUI - Community Edition ver 1.0   (20190313)" HorizontalAlignment="Left" Margin="10,16,0,0" VerticalAlignment="Top" Width="565" FontWeight="Bold" FontSize="14"/>
                            <Button x:Name="AboutTAB_button_Goto_github_website" Content="Open website" HorizontalAlignment="Left" Margin="495,52,0,0" VerticalAlignment="Top" Width="80"/>
                        </Grid>
                    </Border>
                    <Border x:Name="AboutTABRightBorder" Grid.Row="0" Grid.RowSpan="3" Grid.Column="1" BorderBrush="Black" BorderThickness="1" Margin="0,0,7,-1" CornerRadius="8" Background="#FFF7F7F7">
                        <Grid x:Name="AboutTABRightGrid">
                            <TextBlock x:Name="AboutTAB_textBlock_Author" TextWrapping="Wrap" Margin="15.2,9.2,10.8,9.6" ScrollViewer.VerticalScrollBarVisibility="Auto"><Run FontWeight="Bold" Text="Who"/><LineBreak/><Run/><LineBreak/><InlineUIContainer>
                                    <Image Width="100" RenderTransformOrigin="0.488,0.507" x:Name="AboutTAB_image_Author" Height="100">
                                    </Image>
                                </InlineUIContainer><LineBreak/><Run/><LineBreak/><Run FontWeight="Bold" FontSize="14" Text="Petri Paavola"/><LineBreak/><Run Text="Microsoft MVP - Windows and Devices for IT"/><LineBreak/><Run Text="Petri.Paavola@yodamiitti.fi"/><LineBreak/><Run Text="@petripaavola"/><LineBreak/><Run/><LineBreak/><Run/><LineBreak/><Run/><LineBreak/><Run FontWeight="Bold" Text="Thanks for helping in development:"/><LineBreak/><Run Text="- Panu Saukko"/><LineBreak/><Run Text="- David Falkus"/><InlineUIContainer>
                                </InlineUIContainer><LineBreak/></TextBlock>
                        </Grid>
                    </Border>
                </Grid>
            </TabItem>
        </TabControl>
        <Border x:Name="Border_MainWindowInfoBottom" Grid.Row="1" Grid.Column="1" BorderBrush="Black" BorderThickness="1" Margin="5,5,5,5" CornerRadius="8" Background="#FFF7F7F7">
            <Grid x:Name="Grid_MainWindowInfoBottom" Margin="0,0,0,0">
                <Image x:Name="MainWindow_image_Logo" Margin="2,0,0,0" HorizontalAlignment="Right"/>
                <RichTextBox x:Name="MainWindow_richTextBox_Infoscreen" HorizontalAlignment="Left" Height="88" Margin="10,0,0,0" VerticalAlignment="Top" Width="890" IsReadOnly="True" VerticalScrollBarVisibility="Auto">
                    <FlowDocument>
                    </FlowDocument>
                </RichTextBox>
            </Grid>
        </Border>
    </Grid>
</Window>
"@

#endregion XAML

#region Load XAML
$inputXML = $inputXML -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace '^<Win.*', '<Window'
#
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
#Read XAML
#
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
try {$Form = [Windows.Markup.XamlReader]::Load( $reader )}
catch {Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}
#
#===========================================================================
# Load XAML Objects In PowerShell
#===========================================================================
#
$xaml.SelectNodes("//*[@Name]") | % {Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}
#
Function Get-FormVariables {
    if ($global:ReadmeDisplay -ne $true) {Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow; $global:ReadmeDisplay = $true}
    write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
    get-variable WPF*
}
# Debug print all form variables to console
# Comment this out when running in production
#Get-FormVariables

#endregion Load XAML

##################################################################################################

#region General functions

# Your own functions

Function Write-InfoScreen {
    Param(
        $InfoText,
        $TextColor,
        $TextFontSize,
        $TextFontStyle,
        $TextFontWeight
    )

    $NewParagraph = New-Object System.Windows.Documents.Paragraph
    $NewParagraph.Margin = 0

    $PowerShellMajorVersion = $PSVersiontable.PSVersion.major
	
    #PowerShell2 needs different syntax. Assuming >2 versions use same syntax
    if ($PowerShellMajorVersion -eq "2") {
        $NewParagraph.Inlines.Add("$InfoText")
    }
    else {
        $NewParagraph.AddText("$InfoText")
    }

    $NewParagraph.TextAlignment = "Left"
    #$NewParagraph.VerticalAlignment = "Top"
    $NewParagraph.Foreground = $TextColor
    $NewParagraph.Fontsize = $TextFontSize
    #$NewParagraph.FontStyle = "Normal" "Italic"
    $NewParagraph.FontStyle = $TextFontStyle
    #$NewParagraph.FontWeight = "Normal" "Bold"
    $NewParagraph.FontWeight = $TextFontWeight
    $WPFMainWindow_richTextBox_Infoscreen.Document.Blocks.Add($NewParagraph)
    $WPFMainWindow_richTextBox_Infoscreen.ScrollToEnd()
}

Function Clear-InfoScreen {
    $WPFMainWindow_richTextBox_Infoscreen.Document.Blocks.Clear()
}

function DecodeBase64Image {
    param (
        [Parameter(Mandatory = $true)]
        [String]$ImageBase64
    )
    # Parameter help description
    $ObjBitmapImage = New-Object System.Windows.Media.Imaging.BitmapImage #Provides a specialized BitmapSource that is optimized for loading images using Extensible Application Markup Language (XAML).
    $ObjBitmapImage.BeginInit() #Signals the start of the BitmapImage initialization.
    $ObjBitmapImage.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($ImageBase64) #Creates a stream whose backing store is memory.
    $ObjBitmapImage.EndInit() #Signals the end of the BitmapImage initialization.
    $ObjBitmapImage.Freeze() #Makes the current object unmodifiable and sets its IsFrozen property to true.
    $ObjBitmapImage
}

function Convert-Base64ToFile {
    Param(
        [String]$base64,
        $filepath
    )

    $bytes = [Convert]::FromBase64String($base64)
    [IO.File]::WriteAllBytes($filepath, $bytes)
    $Success = $?

    return $Success
}



##################################################################################################
#endregion General functions

##################################################################################################

#region Overview TAB Generic functions

function Function_Get-IntuneManagedDeviceOverview {
    #https://developer.microsoft.com/en-us/graph/docs/api-reference/v1.0/resources/intune_devices_manageddeviceoverview

    $Overview = Get-IntuneManagedDeviceOverview
	
    $WPFOverViewTAB_textBox_enrolledDeviceCount.Text = $Overview.enrolledDeviceCount
    $WPFOverviewTAB_textBox_mdmEnrolledCount.Text = $Overview.mdmEnrolledCount
    $WPFOverviewTAB_textBox_dualEnrolledDeviceCount.Text = $Overview.dualEnrolledDeviceCount
	
    # OS Summary Numbers
    $WPFOverviewTAB_textBox_Android.text = $Overview.deviceOperatingSystemSummary.androidCount
    $WPFOverviewTAB_textBox_iOS.text = $Overview.deviceOperatingSystemSummary.iosCount
    $WPFOverviewTAB_textBox_macOS.text = $Overview.deviceOperatingSystemSummary.macOSCount
    $WPFOverviewTAB_textBox_WindowsMobile.text = $Overview.deviceOperatingSystemSummary.windowsMobileCount
    $WPFOverviewTAB_textBox_Windows.text = $Overview.deviceOperatingSystemSummary.windowsCount
    $WPFOverviewTAB_textBox_Unknown.text = $Overview.deviceOperatingSystemSummary.unknownCount	
}

#endregion Overview TAB Generic functions

#region Overview TAB GUI events

$WPFOverviewTAB_button_ConnectMSGraph.Add_Click( {

        $IntunePowershellModulePath = "$PSScriptRoot/Microsoft.Graph.Intune.psd1"

        #	if (-not (module |where { $_.Name -eq 'Microsoft.Graph.Intune' })) {
        if (-not (Get-Module -ListAvailable -Name 'Microsoft.Graph.Intune')) {

            if (-Not (Test-Path $IntunePowershellModulePath)) {
                # Intune Powershell module not found!
                Write-InfoScreen -InfoText "Could NOT find Intune Powershell module (Microsoft.Graph.Intune.psd1)" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
                Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
                Return
            }
            else {
                Import-Module "$IntunePowershellModulePath"
                $Success = $?

                # If import-module import failed
                if (-not ($Success)) {
                    # Intune Powershell module import failed!
                    Write-InfoScreen -InfoText "Could NOT import Intune Powershell module (Microsoft.Graph.Intune.psd1)" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
                    Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
                    Return
                }
            }
        }
	
        $return = Connect-MSGraph
        $Success = $?

        if(-not $Success) {
            Write-InfoScreen -InfoText "FAILED connection to Microsoft Graph!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            return
        }

        Write-InfoScreen -InfoText "Connection to graph success: $Success" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        Write-InfoScreen -InfoText "Connected as: $($return.UPN)" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        Write-InfoScreen -InfoText "TenantId: $($return.tenantId)" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"	

        $WPFOverviewTAB_textBox_ConnectedAs.Text = $return.UPN
        $WPFOverviewTAB_textBox_TenantId.Text = $return.tenantId

        # Enable tabs
        $WPFTABDevices.IsEnabled = $true
        $WPFTABApps.IsEnabled = $true
        $WPFTABConfiguration.IsEnabled = $true

        Function_Get-IntuneManagedDeviceOverview
        $Success = $?
        Write-InfoScreen -InfoText "ManagedDeviceOverview success: $Success" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
	
        $DeviceCategories = Get-IntuneDeviceCategory
        $Success = $?
	
        if ($Success) {
            Write-InfoScreen -InfoText "Found $($DeviceCategories.Length) DeviceCategories" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
		
            foreach ($DeviceCategory in $DeviceCategories) {
                $WPFDevicesTAB_comboBox_DeviceCategories.items.Add($DeviceCategory.displayName) | Out-Null
            }
            $WPFDevicesTAB_comboBox_DeviceCategories.items.Add("Unassigned") | Out-Null
		
        }
        else {
            Write-InfoScreen -InfoText "Error getting DeviceCategories" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    })

$WPFOverviewTAB_button_Refresh.Add_Click( {
        Function_Get-IntuneManagedDeviceOverview
        $Success = $?
        Write-InfoScreen -InfoText "ManagedDeviceOverview success: $Success" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"	
    })

#endregion Overview TAB GUI events

##################################################################################################

#region Devices TAB Generic functions
function AddManagedDevicesToDevicesGrid {
    Param (
        $AllManagedDevices,
        [boolean]$clearDevicesList = $true
    )

    # Clear existing collection if we got all results = non-paged result.
    # If we got paged result then we do NOT clear existing devices so we will see existing devices and new added devices
    if ($clearDevicesList) {
        $script:DevicesObservableCollection = @()
    }
	
    # Works here but is not seen in the rest of the script
    #$observableCollection = New-Object System.Collections.ObjectModel.ObservableCollection[Object]
    

    foreach ($ManagedDevice in $AllManagedDevices) {

        # Create right picture for compliance
        # Workaround is actual file path until I figure out how image object works in ListView
        if($ManagedDevice.complianceState -eq "Compliant") {
            $CompliantPicturePath = "$PSScriptRoot\cache\Compliant.png"
        } elseif($ManagedDevice.complianceState -eq "noncompliant") {
            $CompliantPicturePath = "$PSScriptRoot\cache\NotCompliant.png"            
        } else {
            $CompliantPicturePath = $null
        }

        # Create custom object
        $param = [PSCustomObject]@{

            ComplianceStateImage      = $CompliantPicturePath
            complianceState           = $ManagedDevice.complianceState
            deviceName                = $ManagedDevice.deviceName
            userDisplayName           = $ManagedDevice.userDisplayName
            userPrincipalName         = $ManagedDevice.userPrincipalName
            emailAddress              = $ManagedDevice.emailAddress
            lastSyncDateTime          = $ManagedDevice.lastSyncDateTime
            enrolledDateTime          = $ManagedDevice.enrolledDateTime
            managedDeviceOwnerType    = $ManagedDevice.managedDeviceOwnerType
            operatingSystem           = $ManagedDevice.operatingSystem
            osVersion                 = $ManagedDevice.osVersion
            model                     = $ManagedDevice.model
            manufacturer              = $ManagedDevice.manufacturer
            serialNumber              = $ManagedDevice.serialNumber
            wiFiMacAddress            = $ManagedDevice.wiFiMacAddress
            isEncrypted               = $ManagedDevice.isEncrypted
            totalStorageSpaceInBytes  = $ManagedDevice.totalStorageSpaceInBytes
            freeStorageSpaceInBytes   = $ManagedDevice.freeStorageSpaceInBytes
            managedDeviceName         = $ManagedDevice.managedDeviceName
			
            # Remove this because id is same and id is used with Cmdlets
            #managedDeviceId           = $ManagedDevice.managedDeviceId

            #complianceState           = $ManagedDevice.complianceState
            jailBroken                = $ManagedDevice.jailBroken
            managementAgent           = $ManagedDevice.managementAgent
            azureADRegistered         = $ManagedDevice.azureADRegistered
            deviceEnrollmentType      = $ManagedDevice.deviceEnrollmentType
            deviceRegistrationState   = $ManagedDevice.deviceRegistrationState
            deviceCategoryDisplayName = $ManagedDevice.deviceCategoryDisplayName
			
            # This does not work with paged result @odata.nextlink
            #deviceId = $ManagedDevice.deviceId
			
            # Why are we using this because id is official attribute name for Device
            deviceId                  = $ManagedDevice.id

            # Should use this
            id                        = $ManagedDevice.id

            azureADDeviceId           = $ManagedDevice.azureADDeviceId
        }

        $script:DevicesObservableCollection += $param
		
        # Add Grid Items with customObject data
        #$WPFDevicesTAB_listView_ManagedDevices.Items.Add($param)
    }

    # Works but there was problem with select
    # What this comment means ?-)
	$WPFDevicesTAB_listView_ManagedDevices.ItemsSource = $script:DevicesObservableCollection

	# Update devices number textbox in Grid
	$WPFDevicesTAB_textBox_NumberOfDevicesShown.Text = $WPFDevicesTAB_listView_ManagedDevices.Items.Count
}


#Function Update_Search_Filter_Options_On_SelectionChanged {
Function Update_Device_Search_Filter_Options_On_SelectedValueChanged {

    # This gets old value which is not what we are looking
    #$DeviceFilterAttribute = $WPFDevicesTAB_comboBox_DeviceFilterAttribute.Text
	
    # This works, not used here though
    $SelectedIndex = $WPFDevicesTAB_comboBox_DeviceFilterAttribute.SelectedIndex

    # This works and gets rights value
    $DeviceFilterAttribute = $WPFDevicesTAB_comboBox_DeviceFilterAttribute.SelectedItem

    switch ( $DeviceFilterAttribute ) {

        # https://docs.microsoft.com/en-us/graph/api/resources/intune-devices-manageddevice?view=graph-rest-1.0

        'complianceState' {

            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.Items.Clear()
            $DeviceFilterSearchTexts = "unknown", "compliant", "noncompliant", "conflict", "error", "inGracePeriod", "configManager"
            foreach ($DeviceFilterSearchText in $DeviceFilterSearchTexts) { $WPFDevicesTAB_comboBox_DeviceFilterSearchText.items.Add($DeviceFilterSearchText) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.SelectedIndex = 1

            $WPFDevicesTAB_comboBox_DeviceFilterOperator.Items.Clear()
            $DeviceFilterOperators = "eq"
            foreach ($DeviceFilterOperator in $DeviceFilterOperators) { $WPFDevicesTAB_comboBox_DeviceFilterOperator.items.Add($DeviceFilterOperator) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterOperator.SelectedIndex = 0

        }

        'deviceCategoryDisplayName' {

            $DeviceCategories = Get-IntuneDeviceCategory
            $Success = $?
			
            if ($Success) {
                $WPFDevicesTAB_comboBox_DeviceFilterSearchText.Items.Clear()
								
                foreach ($DeviceCategory in $DeviceCategories) {
                    $WPFDevicesTAB_comboBox_DeviceFilterSearchText.items.Add($DeviceCategory.displayName) | Out-Null
                }		
                $WPFDevicesTAB_comboBox_DeviceFilterSearchText.SelectedIndex = 0
            }

            $WPFDevicesTAB_comboBox_DeviceFilterOperator.Items.Clear()
            $DeviceFilterOperators = "eq"
            foreach ($DeviceFilterOperator in $DeviceFilterOperators) { $WPFDevicesTAB_comboBox_DeviceFilterOperator.items.Add($DeviceFilterOperator) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterOperator.SelectedIndex = 0

        }

        'deviceEnrollmentType' {
            # https://docs.microsoft.com/en-us/graph/api/resources/intune-devices-deviceenrollmenttype?view=graph-rest-1.0

            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.Items.Clear()
            $DeviceFilterSearchTexts = "unknown", "userEnrollment", "deviceEnrollmentManager", "appleBulkWithUser", "appleBulkWithoutUser", "windowsAzureADJoin", "windowsBulkUserless", "windowsAutoEnrollment", "windowsBulkAzureDomainJoin", "windowsCoManagement"
            foreach ($DeviceFilterSearchText in $DeviceFilterSearchTexts) { $WPFDevicesTAB_comboBox_DeviceFilterSearchText.items.Add($DeviceFilterSearchText) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.SelectedIndex = 1

            $WPFDevicesTAB_comboBox_DeviceFilterOperator.Items.Clear()
            $DeviceFilterOperators = "eq"
            foreach ($DeviceFilterOperator in $DeviceFilterOperators) { $WPFDevicesTAB_comboBox_DeviceFilterOperator.items.Add($DeviceFilterOperator) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterOperator.SelectedIndex = 0

        }

        'managementAgent' {
            # https://docs.microsoft.com/en-us/graph/api/resources/intune-devices-managementagenttype?view=graph-rest-1.0
			
            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.Items.Clear()
            $DeviceFilterSearchTexts = "eas", "mdm", "easMdm", "intuneClient", "easIntuneClient", "configurationManagerClient", "configurationManagerClientMdm", "configurationManagerClientMdmEas", "unknown", "jamf", "googleCloudDevicePolicyController"
            foreach ($DeviceFilterSearchText in $DeviceFilterSearchTexts) { $WPFDevicesTAB_comboBox_DeviceFilterSearchText.items.Add($DeviceFilterSearchText) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.SelectedIndex = 1

            $WPFDevicesTAB_comboBox_DeviceFilterOperator.Items.Clear()
            $DeviceFilterOperators = "eq"
            foreach ($DeviceFilterOperator in $DeviceFilterOperators) { $WPFDevicesTAB_comboBox_DeviceFilterOperator.items.Add($DeviceFilterOperator) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterOperator.SelectedIndex = 0
        }
		
        'managedDeviceOwnerType' {
            # https://docs.microsoft.com/en-us/graph/api/resources/intune-devices-manageddeviceownertype?view=graph-rest-1.0

            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.Items.Clear()
            $DeviceFilterSearchTexts = "unknown", "company", "personal"
            foreach ($DeviceFilterSearchText in $DeviceFilterSearchTexts) { $WPFDevicesTAB_comboBox_DeviceFilterSearchText.items.Add($DeviceFilterSearchText) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.SelectedIndex = 1

            $WPFDevicesTAB_comboBox_DeviceFilterOperator.Items.Clear()
            $DeviceFilterOperators = "eq"
            foreach ($DeviceFilterOperator in $DeviceFilterOperators) { $WPFDevicesTAB_comboBox_DeviceFilterOperator.items.Add($DeviceFilterOperator) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterOperator.SelectedIndex = 0
        }
        default {

            $WPFDevicesTAB_comboBox_DeviceFilterOperator.Items.Clear()

            # startswith and eq seems to work in many cases. Most of others won't usually work
            #$DeviceFilterOperators = "startswith", "eq", "ne", "gt", "ge", "lt", "le", "and", "or", "not"
            $DeviceFilterOperators = "startswith", "eq"

            foreach ($DeviceFilterOperator in $DeviceFilterOperators) { $WPFDevicesTAB_comboBox_DeviceFilterOperator.items.Add($DeviceFilterOperator) | Out-Null }
            $WPFDevicesTAB_comboBox_DeviceFilterOperator.SelectedIndex = 0

            $WPFDevicesTAB_comboBox_DeviceFilterSearchText.Items.Clear()
            #$WPFDevicesTAB_comboBox_DeviceFilterSearchText.SelectedIndex = 0

        }
    }
}

Function Create_Devices_Search_Filter {

    [string]$Attribute = $WPFDevicesTAB_comboBox_DeviceFilterAttribute.Text
    [string]$Operator = $WPFDevicesTAB_comboBox_DeviceFilterOperator.Text
    [string]$SearchText = $WPFDevicesTAB_comboBox_DeviceFilterSearchText.Text

    $filter = $null

    if (($operator -eq 'startswith') -and ($SearchText -ne '')) {
        $filter = "startswith($Attribute,`'$SearchText`')"
        $filter += ' and '
    }
    elseif (($operator -ne 'startswith') -and ($SearchText -ne '')) {
        $filter = "($Attribute $Operator `'$SearchText`')"
        $filter += ' and '
    }

    $filter += '('

    $Add_or_BeforeFilter = $false
    if ($WPFDevicesTAB_checkBox_Windows10.IsChecked) {
        $filter += "operatingSystem eq 'Windows'"
        $Add_or_BeforeFilter = $true
    }

    if ($WPFDevicesTAB_checkBox_Android.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "operatingSystem eq 'Android'"
    }
	
    if ($WPFDevicesTAB_checkBox_iOS.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "operatingSystem eq 'iOS'"
    }

    if ($WPFDevicesTAB_checkBox_macOS.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }

        $filter += "operatingSystem eq 'OS X'"
    }

    $filter += ')'

    # If no OS checkbox is selected then remove and() -string or () -string from filtertext
    $filter = $filter.Replace(' and ()', '')
    $filter = $filter.Replace('()', '')

    if ($filter -eq "startswith(deviceName,'')") { $filter = ''}

    # Set filter to Filter textbox
    $WPFDevicesTAB_comboBox_DeviceSearchFilter.Text = $filter
    return $filter
}


Function RunDeviceActionOnSelectedDevices {
    Param (
        $SelectedDeviceAction
    )
	
    Write-InfoScreen -InfoText "Running action $SelectedDeviceAction on selected devices." -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

    # Running action on each selected device
    foreach ($SelectedDevice in $WPFDevicesTAB_listView_ManagedDevices.SelectedItems) {
        #Write-Host "Item: $item"

        switch ($SelectedDeviceAction) {
            'Sync' { Invoke-IntuneManagedDeviceSyncDevice -managedDeviceId $SelectedDevice.id }
            'RebootNow' { Invoke-IntuneManagedDeviceRebootNow -managedDeviceId $SelectedDevice.id }
        }
        $Success = $?

        if ($Success) {
            Write-InfoScreen -InfoText "Success: $SelectedDeviceAction on $($SelectedDevice.deviceName)" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
        else {
            Write-InfoScreen -InfoText "Failed: $SelectedDeviceAction on $($SelectedDevice.deviceName)" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"		
        }
    }

    Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
	
}

#endregion Devices TAB Generic functions

#region Devices TAB GUI events

$WPFDevicesTAB_button_GetAllDevices.Add_Click( {

        #Clear-InfoScreen

        # Gets all devices
        #$FilterText = "deviceName eq ''"

        $FilterText = Create_Devices_Search_Filter
        #$WPFDevicesTAB_comboBox_DeviceSearchFilter.Text = $FilterText

        Write-InfoScreen -InfoText "Using Filter: $FilterText" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
	
        # Cast as array because otherwise search returning only 1 device will not make array by default. It will show object itself
        # If we don't have array then our .Count will not work later on this function.

        # Use this with Get-IntuneManagedDevice
        #[array]$AllManagedDevices = $null

        # Use this with Invoke-MSGraphRequest
        $AllManagedDevices = $null

        # Get all Managed Devices using Intune Powershell Cmdlet
        #$AllManagedDevices = Get-IntuneManagedDevice -Filter $FilterText

        # Emulate paging while testing
        #$AllManagedDevices = Get-IntuneManagedDevice -Filter $FilterText -Top 20

        # Hard coded for testing
        #$DevicePagingCount = '20'

        # Get paging number from dropdown compobox
        $DevicePagingCount = $WPFDevicesTAB_comboBox_PagingNumber.Text
        Write-Verbose "DevicePagingCount: $DevicePagingCount"

        # Invoke-MSGraphRequest allows us to use more options in search
        # Also filters seems to work better than with Get-IntuneManagedDevice
        $url = "https://graph.microsoft.com/beta/deviceManagement/managedDevices?`$top=$($DevicePagingCount)&`$filter=$($FilterText)"

        # Fix url special characters
        $url = $url.Replace(' ', '%20')
        $url = $url.Replace('ä', '%C3%A4')
        $url = $url.Replace('Ä', '%C3%84')
        $url = $url.Replace('ö', '%C3%B6')
        $url = $url.Replace('Ö', '%C3%96')
        $url = $url.Replace('å', '%C3%A5')
        $url = $url.Replace('Å', '%C3%85')

        # Does too much replacing ALL special characters and end result is not working with Graph API
        #$url = [System.Web.HttpUtility]::UrlEncode($url)

        $AllManagedDevices = Invoke-MSGraphRequest -Url $url -HttpMethod 'GET'

        Write-Verbose "Get Devices -button pressed. Get Intune-Devices url: $url"

        # If search returned results
        if ($AllManagedDevices) {
            # Check if we got all results or did we get paged result. In paged result we have @odata.nextLink -property
            if (Get-Member -InputObject $AllManagedDevices -Name '@odata.nextLink' -MemberType Properties) {
                # nextlink exists so we got paged results
                # Computer objects are on Value-property ($AllManagedDevices.Value)
                # We need to activate Load more -button

                $SearchedDeviceCount = $AllManagedDevices.'@odata.count'

                # Nextlink may have v1.0 API used so change that to beta API
                #$script:Devices_odatanextLink = $AllManagedDevices.'@odata.nextLink'
                $script:Devices_odatanextLink = ($AllManagedDevices.'@odata.nextLink').Replace('v1.0', 'beta')

                # Activate Load-more button
                $WPFDevicesTAB_button_LoadMore.isEnabled = $true

                #Write-Output "Paged return, nextlink returned. Found $SearchedDeviceCount devices."

                # Add Devices to Grid. Clear existing devices list = $true
                AddManagedDevicesToDevicesGrid $AllManagedDevices.Value $true

                # Add devices to script wide variable. For example Copy JSON/CSV export information from this variable
                $script:SearchedDeviceObjects = $AllManagedDevices.Value

            }
            else {
                # nextlink does not exits so we got all results
                # we can use $AllManagedDevices variable as is
                # We done have @odata.context or @odata.count -attributes either

                # Disable Load-more button
                $WPFDevicesTAB_button_LoadMore.isEnabled = $false

                # Use this with Get-IntuneManagedDevice
                #$SearchedDeviceCount = $AllManagedDevices.Count

                # Use this with Invoke-MSGraphRequest
                $SearchedDeviceCount = $AllManagedDevices.'@odata.count'

                #Write-Verbose "Non-paged return. Found $SearchedDeviceCount devices."

                # Add Devices to Grid. Clear existing devices list = $true
                # Use this with Get-IntuneManagedDevice
                #AddManagedDevicesToDevicesGrid $AllManagedDevices $true
				
                # Use this with Invoke-MSGraphRequest
                AddManagedDevicesToDevicesGrid $AllManagedDevices.Value $true
				
                # Add devices to script wide variable. For example Copy JSON/CSV export information from this variable
                $script:SearchedDeviceObjects = $AllManagedDevices.Value
            }

			$WPFDevicesTAB_textBox_DevicesTotalCountSearched.Text = $script:SearchedDeviceObjects.Count
            Write-InfoScreen -InfoText "Found $SearchedDeviceCount devices." -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
        else {
            Write-InfoScreen -InfoText "Search did NOT find devices." -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    })


$WPFDevicesTAB_button_LoadMore.Add_Click( {

        #Clear-InfoScreen
        #Write-InfoScreen -InfoText "Getting next set of devices" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        #$AllManagedDevices = Get-IntuneManagedDevice -Filter $FilterText -Top 5

        # Cast as array because otherwise search returning only 1 device will not make array by default. It will show object itself
        # If we don't have array then our .Count will not work later on this function.
        [array]$AllManagedDevices = $null

        # Get next devices set
        $AllManagedDevices = Get-MSGraphNextPage -NextLink $script:Devices_odatanextLink

        if ($AllManagedDevices) {
            # Check if we got all results or did we get paged result
            # Notice! Last search result does not contain nextLink property but returned result is same kind of object than previous paged results
            if ((Get-Member -InputObject $AllManagedDevices -Name '@odata.nextLink' -MemberType Properties) -and (Get-Member -InputObject $AllManagedDevices -Name 'value' -MemberType Properties)) {
                # nextlink exists so we got paged results
                # Computer objects are on Value-property ($AllManagedDevices.Value)
                # We need to activate or keep activated Load more -button

                $SearchedDeviceCount = $AllManagedDevices.'@odata.count'

                # Nextlink may have v1.0 API used so change that to beta API
                #$script:Devices_odatanextLink = $AllManagedDevices.'@odata.nextLink'
                $script:Devices_odatanextLink = ($AllManagedDevices.'@odata.nextLink').Replace('v1.0', 'beta')

                # Activate Load-more button
                $WPFDevicesTAB_button_LoadMore.isEnabled = $true

                #Write-Output "Paged return, nextlink returned. Found $SearchedDeviceCount devices."

                # Add Devices to Grid
                AddManagedDevicesToDevicesGrid $AllManagedDevices.Value $false

                # Add devices to script wide variable. For example Copy JSON/CSV export information from this variable
                $script:SearchedDeviceObjects += $AllManagedDevices.Value

            }
            else {
                # nextlink does not exists so we got all results

                # If this is last set of search we got no nextlink so we clear variable and disable Load more -button
                if ($script:Devices_odatanextLink) {
                    $script:Devices_odatanextLink = $null

                    # Disable Load-more button
                    $WPFDevicesTAB_button_LoadMore.isEnabled = $false
                }

                $SearchedDeviceCount = $AllManagedDevices.'@odata.count'
                #Write-Output "Non-paged return. Found $SearchedDeviceCount devices."

                # Add Devices to Grid
                AddManagedDevicesToDevicesGrid $AllManagedDevices.Value $false

                # Add devices to script wide variable. For example Copy JSON/CSV export information from this variable
                $script:SearchedDeviceObjects += $AllManagedDevices.Value
            }

			$WPFDevicesTAB_textBox_DevicesTotalCountSearched.Text = $script:SearchedDeviceObjects.Count
            Write-InfoScreen -InfoText "Found $SearchedDeviceCount more devices." -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
        else {
            Write-InfoScreen -InfoText "Search did NOT find devices." -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    })


$WPFDevicesTAB_listView_ManagedDevices.Add_PreviewMouseLeftButtonUp( {
	# This does not trigger if selection is changed without mouse
	$WPFDevicesTAB_textBox_NumberOfDevicesSelected.Text = $WPFDevicesTAB_listView_ManagedDevices.SelectedItems.Count
})

$WPFDevicesTAB_listView_ManagedDevices.Add_SelectionChanged( {
	$WPFDevicesTAB_textBox_NumberOfDevicesSelected.Text = $WPFDevicesTAB_listView_ManagedDevices.SelectedItems.Count
})


# When filter text dropdown element is selected
$WPFDevicesTAB_comboBox_DeviceFilterSearchText.Add_DropDownClosed( {	$foo = Create_Devices_Search_Filter })

# We add TextBox TextChanged event handler to this comboBox to catch that event
$WPFDevicesTAB_comboBox_DeviceFilterSearchText.AddHandler(
    [System.Windows.Controls.Primitives.TextBoxBase]::TextChangedEvent, 
    [System.Windows.RoutedEventHandler] { 

        $foo = Create_Devices_Search_Filter

    })

# When filter operator dropdown element is selected
$WPFDevicesTAB_comboBox_DeviceFilterOperator.Add_DropDownClosed( { $foo = Create_Devices_Search_Filter })


#$WPFDevicesTAB_comboBox_DeviceFilterAttribute.Add_SelectionChanged({
$WPFDevicesTAB_comboBox_DeviceFilterAttribute.Add_DropDownClosed( {
        Update_Device_Search_Filter_Options_On_SelectedValueChanged
        $foo = Create_Devices_Search_Filter
    })

$WPFDevicesTAB_checkBox_Windows10.Add_Checked( {
        $foo = Create_Devices_Search_Filter
    })
	
$WPFDevicesTAB_checkBox_Android.Add_Checked( {
	$foo = Create_Devices_Search_Filter
})

$WPFDevicesTAB_checkBox_iOS.Add_Checked( {
	$foo = Create_Devices_Search_Filter
})

$WPFDevicesTAB_checkBox_macOS.Add_Checked( {
	$foo = Create_Devices_Search_Filter
})

$WPFDevicesTAB_checkBox_Windows10.Add_UnChecked( {
	$foo = Create_Devices_Search_Filter
})

$WPFDevicesTAB_checkBox_Android.Add_UnChecked( {
	$foo = Create_Devices_Search_Filter
})

$WPFDevicesTAB_checkBox_iOS.Add_UnChecked( {
	$foo = Create_Devices_Search_Filter
})

$WPFDevicesTAB_checkBox_macOS.Add_UnChecked( {
	$foo = Create_Devices_Search_Filter
})

$WPFDevicesTAB_checkBox_SearchEveryAttribute.Add_Checked( {
	# Dirty hack to trigger event $WPFDevicesTAB_textBox_SearchGrid.Add_TextChanged( {
	$WPFDevicesTAB_textBox_SearchGrid.Text += ' '
	$WPFDevicesTAB_textBox_SearchGrid.Text = ($WPFDevicesTAB_textBox_SearchGrid.Text).TrimEnd(' ')
})

$WPFDevicesTAB_checkBox_SearchEveryAttribute.Add_UnChecked( {
	# Dirty hack to trigger event $WPFDevicesTAB_textBox_SearchGrid.Add_TextChanged( {
	$WPFDevicesTAB_textBox_SearchGrid.Text += ' '
	$WPFDevicesTAB_textBox_SearchGrid.Text = ($WPFDevicesTAB_textBox_SearchGrid.Text).TrimEnd(' ')
})

# Clear Devices Search from Grid -textbox when clicking X picture
$WPFDevicesTAB_image_SearchFromGrid_X.Add_MouseLeftButtonDown( {
	$WPFDevicesTAB_textBox_SearchGrid.Text = ''
})

# Reset Devices search filters
$WPFDevicesTAB_image_ResetFilters_X.Add_MouseLeftButtonDown( {
    $WPFDevicesTAB_comboBox_DeviceFilterSearchText.Text = ''
    $WPFDevicesTAB_checkBox_Windows10.isChecked = $True
    $WPFDevicesTAB_checkBox_Android.isChecked = $True
    $WPFDevicesTAB_checkBox_iOS.isChecked = $True
    $WPFDevicesTAB_checkBox_macOS.isChecked = $True
    $WPFDevicesTAB_comboBox_DeviceFilterAttribute.SelectedIndex = 0   

    $foo = Create_Devices_Search_Filter

})


$WPFDevicesTAB_button_RunDeviceAction.Add_Click( {

        $SelectedDeviceAction = $WPFDevicesTAB_comboBox_DeviceActions.SelectedValue.ToString()

        RunDeviceActionOnSelectedDevices $SelectedDeviceAction

    } )

# Grid right click menu actions: Copy To Clip Board JSON
$WPFDevicesTAB_ListView_CopyToClipBoardJSON_Menu.Add_Click( {

        # Copy values from Grid. This does not have all values existing in Intune
        #$WPFDevicesTAB_listView_ManagedDevices.SelectedItems | ConvertTo-JSON | clip
        #$Success = $?

        # Cast as array so we can add multiple objects. Otherwise += will not work
        # This works too
        #$devicesCopyInformation = @()
        [array]$devicesCopyInformation = $null

        foreach ($deviceInGrid in $WPFDevicesTAB_listView_ManagedDevices.SelectedItems) {
            Write-Verbose "Copy menu JSON clicked: In loop deviceName: $($deviceInGrid.deviceName) (id: $($deviceInGrid.id)"

            #Copy device information
            $devicesCopyInformation += $script:SearchedDeviceObjects | Where-Object {$_.id -eq $deviceInGrid.id}
        }

        $devicesCopyInformation | ConvertTo-Json | Set-Clipboard
        $Success = $?
        if ($Success) {
            Write-InfoScreen -InfoText "Copied selected Devices JSON information to clipboard" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    } )

<#
# Grid right click menu actions: Copy To Clip Board CSV
$WPFDevicesTAB_ListView_CopyToClipBoardCSV_Menu.Add_Click( {

        # Copy values from Grid. This does not have all values existing in Intune
        #$WPFDevicesTAB_listView_ManagedDevices.SelectedItems | ConvertTo-CSV | clip
        #$Success = $?

        # Cast as array so we can add multiple objects. Otherwise += will not work
        [array]$devicesCopyInformation = $null

        foreach ($deviceInGrid in $WPFDevicesTAB_listView_ManagedDevices.SelectedItems) {
            Write-Verbose "Copy menu CSV clicked: In loop deviceName: $($deviceInGrid.deviceName) (id: $($deviceInGrid.id)"

            #Copy device information
            $devicesCopyInformation += $script:SearchedDeviceObjects | Where-Object {$_.id -eq $deviceInGrid.id}
        }

        $devicesCopyInformation | ConvertTo-Csv -NoTypeInformation| Set-Clipboard
        $Success = $?
        if ($Success) {
            Write-InfoScreen -InfoText "Copied selected Devices CSV information to clipboard" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    } )
#>

# Grid right click menu actions: Sync
$WPFDevicesTAB_ListView_RunActionSync_Menu.Add_Click( {

        # Debug
        #Write-InfoScreen -InfoText "Selected Right click context menu action: Sync" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        # Run Action Sync
        RunDeviceActionOnSelectedDevices 'Sync'

    } )

# Grid right click menu actions: RebootNow
$WPFDevicesTAB_ListView_RunActionRebootNow_Menu.Add_Click( {

        # Debug
        Write-InfoScreen -InfoText "Selected Right click context menu action: RebootNow" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        # Run Action Sync
        RunDeviceActionOnSelectedDevices 'RebootNow'

    } )


$WPFDevicesTAB_button_SetDeviceCategory.Add_Click( {

        # Set DeviceCategory to selected devices

        $SelectedDeviceCategoryName = $WPFDevicesTAB_comboBox_DeviceCategories.SelectedValue.ToString()
        #$SelectedDeviceCategoryObject = $DeviceCategories | Where { $_.displayName -eq "$SelectedDeviceCategoryName" }

        if($SelectedDeviceCategoryName -ne 'Unassigned') {
            # DeviceCategor is NOT Unassigned

            # Get DeviceCategory information
            $SelectedDeviceCategoryObject = Get-IntuneDeviceCategory -Filter "DisplayName eq `'$SelectedDeviceCategoryName`'"

            $SelectedDeviceCategoryId = $SelectedDeviceCategoryObject.id
        } else {
            # DeviceCategory is Unassigned which is zero-GUID

            $SelectedDeviceCategoryId = '00000000-0000-0000-0000-000000000000'
        }
        Write-InfoScreen -InfoText "Settings DeviceCategory ($SelectedDeviceCategoryName=$SelectedDeviceCategoryId) to selected devices." -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        $DeviceCategoryJSON = "{`"@odata.id`":`"https://graph.microsoft.com/beta/deviceManagement/deviceCategories/$SelectedDeviceCategoryId`"}"


        # Settings DeviceCategory to each ManagedDevice
        foreach ($SelectedDevice in $WPFDevicesTAB_listView_ManagedDevices.SelectedItems) {

            $url = "https://graph.microsoft.com/beta/deviceManagement/managedDevices(`'$($SelectedDevice.id)`')/deviceCategory/`$ref"

            # Change Devices's DeviceCategory
            # Using Invoke-MSGraphRequest as a workaround until figure out how to use Update-IntuneManagedDevice -command
            Invoke-MSGraphRequest -Url $url -Content $DeviceCategoryJSON -HttpMethod 'PUT'
            $Success = $?

            # Hopefully we use this Cmdlet in the future
            # Update-IntuneManagedDevice -managedDeviceId $SelectedDevice.id [-deviceCategory <object>] [-deviceCategoryDisplayName <string>]

            if ($Success) {
                Write-InfoScreen -InfoText "Success: Set $($SelectedDevice.deviceName) DeviceCategory to $SelectedDeviceCategoryName" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            }
            else {
                Write-InfoScreen -InfoText "Failed to set $SelectedDeviceCategoryName DeviceCategory on device $($SelectedDevice.deviceName)" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"		
            }
        }

        Write-InfoScreen -InfoText "DeviceCategory change takes a while to process." -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

    })

$WPFDevicesTAB_button_SetDeviceOwnerType.Add_Click( {

        # Set Device OwnerType to selected devices

        $SelectedDeviceOwnerType = $WPFDevicesTAB_comboBox_DeviceOwnerTypes.SelectedValue.ToString()

        Write-InfoScreen -InfoText "Settings Device OwnerType to $SelectedDeviceOwnerType to selected devices." -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"


        # Settings DeviceOwnerType to each ManagedDevice
        foreach ($SelectedDevice in $WPFDevicesTAB_listView_ManagedDevices.SelectedItems) {

            Update-IntuneManagedDevice -managedDeviceId $SelectedDevice.id -managedDeviceOwnerType $SelectedDeviceOwnerType
            $Success = $?

            if ($Success) {
                Write-InfoScreen -InfoText "Success: Set $($SelectedDevice.deviceName) DeviceOwnerType to $SelectedDeviceOwnerType" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            }
            else {
                Write-InfoScreen -InfoText "Failed to set $SelectedDeviceOwnerType DeviceOwnerType on device $($SelectedDevice.deviceName)" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"		
            }
        }

        Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

    })


$WPFDevicesTAB_textBox_SearchGrid.Add_TextChanged( {


        $DeviceSearchString = $WPFDevicesTAB_textBox_SearchGrid.Text
        $script:DevicesSearchedObservableCollection = @()
	
        if ($DeviceSearchString -ne '') {

			# Check if "Search all attributes (slower)" is checked so whether we do search from all attributes (slower) or just basic attributes
			if($WPFDevicesTAB_checkBox_SearchEveryAttribute.IsChecked) {

                # We will start search after 2 characters (because Manufacturer HP can be common search)
                if($DeviceSearchString.Length -lt 2) { return }

				# Search computers using all fetched attributes in variable $script:SearchedDeviceObjects
				# Then find same device from $script:DevicesObservableCollection

				$AllDeviceProperties = $script:SearchedDeviceObjects | Get-Member -MemberType Properties | Select-Object -ExpandProperty Name

				# Go through all devices
				Foreach ($device in $script:SearchedDeviceObjects) {

					# Go through all Properties on each device and try to find our string from property value
					Foreach ($Property in $AllDeviceProperties) {
						#Write-Verbose "$($device.deviceName) - $Property = $($device.$Property)"

						# Check if string is found from property value
						if ( $($device.$Property) -like "*$DeviceSearchString*") {
							# Found. We will add this device to found list
							$script:DevicesSearchedObservableCollection += $script:DevicesObservableCollection | Where-Object { ($_.id -eq $device.id) }
						
							#Write-Verbose "Device $($device.deviceName) - Property $Property=$($device.$Property) found"
							Break
						}
					}
				}

				$WPFDevicesTAB_listView_ManagedDevices.ItemsSource = $script:DevicesSearchedObservableCollection
			} else {
				# Quick search information from ListView (Grid) data. We do not see every attribute

				# Really quick dirty workaround for finding/filtering Devices from Devices Grid.
				# We use pipeline filtering to original DevicesArray and copy filtered objects to another array which we assing to Grid ItemsSource
				# We propably should use WPF XAML Grid Listview filtering?

                # TODO - Get ListView Grid Columen Header names dynamically and test all columns

                #$script:DevicesSearchedObservableCollection = $script:DevicesObservableCollection | Where { ($_.deviceName -like "*$DeviceSearchString*") -or ($_.id -like "*$DeviceSearchString*") -or ($_.userDisplayName -like "*$DeviceSearchString*") -or ($_.userPrincipalName -like "*$DeviceSearchString*") -or ($_.emailAddress -like "*$DeviceSearchString*") -or ($_.operatingSystem -like "*$DeviceSearchString*") -or ($_.osVersion -like "*$DeviceSearchString*") -or ($_.model -like "*$DeviceSearchString*") -or ($_.manufacturer -like "*$DeviceSearchString*") -or ($_.serialNumber -like "*$DeviceSearchString*") -or ($_.wiFiMacAddress -like "*$DeviceSearchString*") -or ($_.deviceCategoryDisplayName -like "*$DeviceSearchString*") }

                $script:DevicesSearchedObservableCollection = $script:DevicesObservableCollection | Where `
                { ($_.ComplianceState -like "*$DeviceSearchString*") -or `
                ($_.deviceName -like "*$DeviceSearchString*") -or `
                ($_.id -like "*$DeviceSearchString*") -or `
                ($_.userDisplayName -like "*$DeviceSearchString*") -or `
                ($_.userPrincipalName -like "*$DeviceSearchString*") -or `
                ($_.emailAddress -like "*$DeviceSearchString*") -or `
                ($_.operatingSystem -like "*$DeviceSearchString*") -or `
                ($_.osVersion -like "*$DeviceSearchString*") -or `
                ($_.model -like "*$DeviceSearchString*") -or `
                ($_.manufacturer -like "*$DeviceSearchString*") -or `
                ($_.serialNumber -like "*$DeviceSearchString*") -or `
                ($_.wiFiMacAddress -like "*$DeviceSearchString*") -or `
                ($_.managedDeviceName -like "*$DeviceSearchString*") -or `
                ($_.managementAgent -like "*$DeviceSearchString*") -or `
                ($_.deviceEnrollmentType -like "*$DeviceSearchString*") -or `
                ($_.deviceCategoryDisplayName -like "*$DeviceSearchString*") }

				$WPFDevicesTAB_listView_ManagedDevices.ItemsSource = $script:DevicesSearchedObservableCollection
			}	
        }
        else {
            # We have no search string so we show all Devices
            $WPFDevicesTAB_listView_ManagedDevices.ItemsSource = $script:DevicesObservableCollection
		}
		
		# Update devices number textbox in Grid
		$WPFDevicesTAB_textBox_NumberOfDevicesShown.Text = $WPFDevicesTAB_listView_ManagedDevices.Items.Count
    } )

#endregion Devices TAB GUI events

##################################################################################################

#region ConfigurationsTAB - PowershellTAB - Generic functions

# https://developer.microsoft.com/en-us/graph/docs/api-reference/beta/resources/intune_devices_devicemanagementscript


Function Get_PowershellScripts {
    Param(
	
    )


}

#endregion ConfigurationsTAB - PowershellTAB - Generic functions

#region ConfigurationsTAB - PowershellTAB - GUI event functions
$WPFConfigurationsTAB_PowershellTAB_button_GetPowershellScripts.Add_Click( {

        Clear-InfoScreen

        Write-InfoScreen -InfoText "Searching Powershell scripts" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        # Get Powershell scripts names and info
        $script:IntunePowershellScriptsInfo = (Invoke-MSGraphRequest -Url https://graph.microsoft.com/beta/deviceManagement/deviceManagementScripts).Value | Sort displayName
	
        Write-InfoScreen -InfoText "Found $($IntunePowershellScriptsInfo.Length) scripts" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        # Clear compobox values so we won't have duplicates if we fetch script multiple times
        $WPFConfigurationsTAB_PowershellTAB_comboBox_PowershellScriptsList.Items.Clear()

        # Add scripts to dropdown menu ComboBox
        Foreach ($IntunePowershellScriptInfo in $script:IntunePowershellScriptsInfo) {

            $PowershellScriptdisplayName = $IntunePowershellScriptInfo.displayName
	
            $WPFConfigurationsTAB_PowershellTAB_comboBox_PowershellScriptsList.items.Add($PowershellScriptdisplayName) | Out-Null	
        }

        # Set DropDown selected index to first so user will see change in DropDown box
        $WPFConfigurationsTAB_PowershellTAB_comboBox_PowershellScriptsList.SelectedIndex = 0

        # Open combobox dropdown list
        $WPFConfigurationsTAB_PowershellTAB_comboBox_PowershellScriptsList.IsDropDownOpen = $true
	
    })


$WPFConfigurationsTAB_PowershellTAB_button_ShowSelectedPowershellScript.Add_Click( {

        # Show selected Powershell script content in textBox and details

        # Selected Powershell script name
        $SelectedPowershellScriptName = $WPFConfigurationsTAB_PowershellTAB_comboBox_PowershellScriptsList.SelectedValue.ToString()

        Write-InfoScreen -InfoText "Getting script info for $SelectedPowershellScriptName" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
	
        # Find selected script Id which we need when we get more detailed Powershell script info
	
        # Trim() is added because in some cases there was empty line before Id so script wouldn't work because we got empty value for Id
        $PowershellScriptId = ($script:IntunePowershellScriptsInfo | Where { $_.displayName -eq "$SelectedPowershellScriptName" } | Select -expandProperty Id).Trim()
		
        Write-InfoScreen -InfoText "PowershellScriptId: $PowershellScriptId" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        if (($PowershellScriptId -ne $null) -or ($PowershellScriptId -ne '')) {
            # Get Powershell script details
            $script:IntunePowershellScriptDetails = Invoke-MSGraphRequest -Url "https://graph.microsoft.com/beta/deviceManagement/deviceManagementScripts/$PowershellScriptId"
		
            # Debug
            #$Powershell_json_original = $script:IntunePowershellScriptDetails | ConvertTo-json
            #$Powershell_json_original | Out-File "$PSScriptRoot\DEBUG_Powershell_original.json"
        }
        else {
            Write-InfoScreen -InfoText "PowershellScriptId is empty, Could not continue!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -	TextFontWeight "Normal"
        }

        # Copy values to textboxes
        $WPFConfigurationsTAB_PowershellTAB_textBox_PowershellScriptName.Text = $script:IntunePowershellScriptDetails.fileName
        $WPFConfigurationsTAB_PowershellTAB_textBox_ScriptName.Text = $script:IntunePowershellScriptDetails.fileName
        $WPFConfigurationsTAB_PowershellTAB_textBox_DisplayName.Text = $script:IntunePowershellScriptDetails.displayName
        $WPFConfigurationsTAB_PowershellTAB_textBox_Description.Text = $script:IntunePowershellScriptDetails.description
        $WPFConfigurationsTAB_PowershellTAB_textBox_RunAs.Text = $script:IntunePowershellScriptDetails.runAsAccount
        $WPFConfigurationsTAB_PowershellTAB_textBox_CreatedTime.Text = $script:IntunePowershellScriptDetails.createdDateTime
        $WPFConfigurationsTAB_PowershellTAB_textBox_ModifiedTime.Text = $script:IntunePowershellScriptDetails.lastModifiedDateTime

        # YES TYPO, FIXME :)
        $WPFConfigurationsTAB_PowershellTAB_textBox_EnforceSigtanure.Text = $script:IntunePowershellScriptDetails.enforceSignatureCheck

	
        # Get Base64 encrypted Powershell script content
        $EncodedScript = $script:IntunePowershellScriptDetails.scriptContent	
	
        # Decode Base64 content
        $b = [System.Convert]::FromBase64String("$EncodedScript")
        $DecodedScript = [System.Text.Encoding]::UTF8.GetString($b)

        # Show decoded script content in big textbox
        $WPFConfigurationsTAB_PowershellTAB_textBox_PowershellScript.Text = $DecodedScript

        # Activate ConfigurationsTAB_PowershellTAB_button_UpdateSelectedPowershellScript -button
        $WPFConfigurationsTAB_PowershellTAB_button_UpdateSelectedPowershellScript.isEnabled = $true
	
    } )


$WPFConfigurationsTAB_PowershellTAB_button_UpdateSelectedPowershellScript.Add_Click( {

        Write-InfoScreen -InfoText "Uploading/updating Powershell script is not working at this time!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        return
    } )

#endregion ConfigurationsTAB - PowershellTAB - GUI event functions

##################################################################################################

#region Apps TAB Generic functions


Function Create_Apps_Search_Filter {

    [string]$Attribute = $WPFAppsTAB_comboBox_AppFilterAttribute.Text
    [string]$Operator = $WPFAppsTAB_comboBox_AppFilterOperator.Text
    [string]$SearchText = $WPFAppsTAB_comboBox_AppFilterSearchText.Text

    $filter = $null

    if (($operator -eq 'startswith') -and ($SearchText -ne '')) {
        $filter = "startswith($Attribute,`'$SearchText`')"
        $filter += ' and '
    }
    elseif (($operator -ne 'startswith') -and ($SearchText -ne '')) {
        $filter = "($Attribute $Operator `'$SearchText`')"
        $filter += ' and '
    }

    $filter += '('

    $Add_or_BeforeFilter = $false
    if ($WPFAppsTAB_checkBox_Win32.IsChecked) {
        
        $filter += "isof('microsoft.graph.win32LobApp')"
        $Add_or_BeforeFilter = $true
    }

    if ($WPFAppsTAB_checkBox_MSStore.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.microsoftStoreForBusinessApp')"
    }
	
    if ($WPFAppsTAB_checkBox_MSIMobile.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.windowsMobileMSI')"
    }

    if ($WPFAppsTAB_checkBox_AppXMSIX.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.windowsUniversalAppX')"
    }

    if ($WPFAppsTAB_checkBox_Android.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.androidStoreApp')"
    }

    if ($WPFAppsTAB_checkBox_AndroidManagedStore.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.managedAndroidStoreApp')"
    }

    if ($WPFAppsTAB_checkBox_iOSStore.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.iosStoreApp')"
    }

    if ($WPFAppsTAB_checkBox_iOSManagedStore.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.managedIOSStoreApp')"
    }

    if ($WPFAppsTAB_checkBox_WebApp.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.webApp')"
    }

    if ($WPFAppsTAB_checkBox_OfficeSuiteApp.IsChecked) {
        if ($Add_or_BeforeFilter) {
            $filter += " or "
        }
        else {
            $Add_or_BeforeFilter = $true
        }

        $filter += "isof('microsoft.graph.officeSuiteApp')"
    }


    $filter += ')'

    # If no OS checkbox is selected then remove and() -string or () -string from filtertext
    $filter = $filter.Replace(' and ()', '')
    $filter = $filter.Replace('()', '')

    if ($filter -eq "startswith(displayName,'')") { $filter = ''}

    # Set filter to Filter textbox
    $WPFAppsTAB_comboBox_AppSearchFilter.Text = $filter
    return $filter
}





function AddManagedAppsToAppsGrid {
    Param (
        $AllManagedApps,
        [boolean]$clearAppsList = $true
    )

    # Clear existing collection if we got all results = non-paged result.
    # If we got paged result then we do NOT clear existing devices so we will see existing devices and new added devices
    if ($clearAppsList) {
        $script:AppsObservableCollection = @()
    }
	
    # Works here but is not seen in the rest of the script
    #$observableCollection = New-Object System.Collections.ObjectModel.ObservableCollection[Object]


    if($WPFAppsTAB_checkBox_DownloadIcons.IsChecked -eq $true) {
        # Get icon files from cache folder to object
        # This more efficient way than checking every icon individually
        $CacheFiles = Get-ChildItem -File -Path "$PSScriptRoot\cache" | Select Name, FullName, BaseName, Extension, Length
    }

    foreach ($ManagedApp in $AllManagedApps) {

        # Initialize variable so it is seen in all necessary steps
        $LargeIconFullPathAndFileName = $null

        if($WPFAppsTAB_checkBox_DownloadIcons.IsChecked -eq $true) {
            # Check if we have application icon already in cache folder
            # Use that if found
            #if(Test-Path "$PSScriptRoot\cache\$($ManagedApp.id).*") {
            $IconFileObject = $null
            $IconFileObject = $CacheFiles | Where-Object {$_.BaseName -eq $ManagedApp.id}
            if($IconFileObject) {
                #$LargeIconFullPathAndFileName = Get-ChildItem -File -Path "$PSScriptRoot\cache" -Filter "$($ManagedApp.id).*" | Select -ExpandProperty FullName
                $LargeIconFullPathAndFileName = $IconFileObject.FullName
                #Write-Verbose "Found icon file ($LargeIconFullPathAndFileName) for Application id $($ManagedApp.id)"
            } else {
                # Try to download largeIcon-attribute from application and save file to cache folder

                #Write-Verbose "Trying to find largeIcon to Application $($ManagedApp.displayName) (id:$($ManagedApp.id)"

                # Get application largeIcon attribute
                $AppId = $ManagedApp.id
                $url = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps/$($AppId)?`$select=largeIcon"

                $appLargeIcon = Invoke-MSGraphRequest -Url $url -HttpMethod GET

                #largeIcon      : @{type=image/png; value=iVBORw0KGg
                #$appLargeIcon.largeIcon.type

                if(($appLargeIcon.largeIcon.type -ne $null) -and ($appLargeIcon.largeIcon.value -ne $null)) {
                    $filetype = ($appLargeIcon.largeIcon.type).Split('/')[1]
                    $largeIconBase64 = $appLargeIcon.largeIcon.value
                } else {
                    # There is no largeIcon attribute so we create empty file
                    $filetype = "png"
                    $largeIconBase64 = ''
                }

                $LargeIconFilename = "$($AppId).$($filetype)"
                $LargeIconFullPathAndFileName = "$PSScriptRoot\cache\$LargeIconFilename"
                

                try {
                    $return = Convert-Base64ToFile $largeIconBase64 $LargeIconFullPathAndFileName
                    Write-Verbose "Convert-Base64ToFile ApplicationId:$AppId $LargeIconFullPathAndFileName success: $return"
                } catch {}

                if(Test-Path "$LargeIconFullPathAndFileName") {
                    # Everything is ok

                } else {
                    # Set null to largeIcon path
                    $LargeIconFullPathAndFileName = $null
                }
            }
        }

        #Write-Verbose "LargeIconFullPathAndFileName = $LargeIconFullPathAndFileName"

        # Create custom object
        $param = [PSCustomObject]@{
            appOSCustomVariable         =  ($($ManagedApp.'@odata.type')).Replace('#microsoft.graph.','')
            #AppLargeIcon               =  $ManagedApp.largeIcon
            AppLargeIconPath            =  "$LargeIconFullPathAndFileName"
            #AppLargeIconPath            =  "$PSScriptRoot\cache\c1b73dc9-3bc3-4ffe-90a7-736c5c2f60d5.png"
            displayName                 =  $ManagedApp.displayName
            fileName                    =  $ManagedApp.fileName
            productVersion              =  $ManagedApp.productVersion
            version                     =  $ManagedApp.version
            publishingState             =  $ManagedApp.publishingState
            description                 =  $ManagedApp.description
            isFeatured                  =  $ManagedApp.isFeatured
            size                        =  $ManagedApp.size
            notes                       =  $ManagedApp.notes
            publisher                   =  $ManagedApp.publisher
            developer                   =  $ManagedApp.developer
        owner                           =  $ManagedApp.owner
        informationUrl                  =  $ManagedApp.informationUrl
            privacyInformationUrl       =  $ManagedApp.privacyInformationUrl
            createdDateTime             =  $ManagedApp.createdDateTime
        lastModifiedDateTime            =  $ManagedApp.lastModifiedDateTime
            licenseType                 =  $ManagedApp.licenseType
            id                          =  $ManagedApp.id
            Apps_odatatype               =  $($ManagedApp.'@odata.type')
            mobileAppODataType          =  $ManagedApp.mobileAppODataType
            productCode                  =  $ManagedApp.productCode
            packageIdentityName         =  $ManagedApp.packageIdentityName
            packageId                   =  $ManagedApp.packageId
            bundleId                    =  $ManagedApp.bundleId
            identityName                =  $ManagedApp.identityName
            commandLine                 =  $ManagedApp.commandLine
            installCommandLine          = $ManagedApp.installCommandLine
            uninstallCommandLine        = $ManagedApp.uninstallCommandLine
        committedContentVersion         =  $ManagedApp.committedContentVersion
            ignoreVersionDetection      =  $ManagedApp.ignoreVersionDetection
    	}

        $script:AppsObservableCollection += $param
		
        # Add Grid Items with customObject data
        #$WPFAppsTAB_listView_ManagedApps.Items.Add($param)
    }

    # Works but there was problem with select
    # Toimii, mutta selected:n kanssa oli ongelmia
    # What this comment means ?-)
	$WPFAppsTAB_listView_ManagedApps.ItemsSource = $script:AppsObservableCollection

	# Update devices number textbox in Grid
	$WPFAppsTAB_textBox_NumberOfAppsShown.Text = $WPFAppsTAB_listView_ManagedApps.Items.Count
}

function Create-IntuneApplicationAssignment {
	Param(
		$AzureADGroupId,
		$mobileAppId,
		$AssignmentIntent
	)

	# Choices are: 'available', 'required', 'uninstall', 'availableWithoutEnrollment'

	$TargetObject = $null
	$TargetObject = New-Object PSObject
	$TargetObject | Add-Member NoteProperty '@odata.type' '#microsoft.graph.groupAssignmentTarget'
	$TargetObject | Add-Member NoteProperty 'groupId' $AzureADGroupId

	# Fix json - custom-object problem
	# This should not be needed anymore. However this is nice trick to make sure json syntax is valid
	$TargetObject = $TargetObject |ConvertTo-json |ConvertFrom-json

	# Create Intune Application assignment
	New-IntuneMobileAppAssignment -mobileAppId $mobileAppId -intent $AssignmentIntent -target $TargetObject
    $Success = $?
    
	return $Success
}

#endregion Apps TAB Generic functions

#region Apps TAB GUI events

$WPFAppsTAB_button_GetAllApps.Add_Click( {
        Write-Verbose "Get Apps -button pressed"
        #Clear-InfoScreen

        # Gets all apps
        #$FilterText = "displayName eq ''"

        $FilterText = Create_Apps_Search_Filter
        #$WPFAppsTAB_comboBox_AppsSearchFilter.Text = $FilterText

        Write-InfoScreen -InfoText "Using Filter: $FilterText" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
	
        # Cast as array because otherwise search returning only 1 device will not make array by default. It will show object itself
        # If we don't have array then our .Count will not work later on this function.

        # Use this with Get-IntuneManagedApps
        #[array]$AllManagedApps = $null

        # Use this with Invoke-MSGraphRequest
        $AllManagedApps = $null

        # Get all Managed Devices using Intune Powershell Cmdlet
        #$AllManagedApps = Get-IntuneManagedDevice -Filter $FilterText

        # Emulate paging while testing
        #$AllManagedApps = Get-IntuneManagedApps -Filter $FilterText -Top 20

        # Hard coded for testing
        #$AppsPagingCount = '20'

        # Get paging number from dropdown compobox
        $AppsPagingCount = $WPFAppsTAB_comboBox_PagingNumber.Text
        Write-Verbose "AppsPagingCount: $AppsPagingCount"

        # Invoke-MSGraphRequest allows us to use more options in search
		# Also filters seems to work better than with Get-IntuneManagedApps
		# At this time (20190224) this is only way to get Win32 Apps also
        
        # Works but did not get Assignments
        #$url = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps?`$top=$($AppsPagingCount)&`$filter=$($FilterText)"

        # Includes Assignments
        $url = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps?`$expand=assignments&`$top=$($AppsPagingCount)&`$filter=$($FilterText)"

        # Url used in Intune Web GUI
        #$url = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps?`$top=$($AppsPagingCount)&`$filter=(microsoft.graph.managedApp/appAvailability%20eq%20null%20or%20microsoft.graph.managedApp/appAvailability%20eq%20'lineOfBusiness'%20or%20isAssigned%20eq%20true)"

        # Fix url special characters
        $url = $url.Replace(' ', '%20')
        $url = $url.Replace('ä', '%C3%A4')
        $url = $url.Replace('Ä', '%C3%84')
        $url = $url.Replace('ö', '%C3%B6')
        $url = $url.Replace('Ö', '%C3%96')
        $url = $url.Replace('å', '%C3%A5')
        $url = $url.Replace('Å', '%C3%85')

        # Does too much replacing ALL special characters and end result is not working with Graph API
        #$url = [System.Web.HttpUtility]::UrlEncode($url)

        $AllManagedApps = Invoke-MSGraphRequest -Url $url -HttpMethod 'GET'
        Write-Verbose "Success: $?"
        Write-Verbose "Get Intune-Apps url: $url"

        # If search returned results
        if ($AllManagedApps) {
 
            # Check if we got all results or did we get paged result. In paged result we have @odata.nextLink -property
            if (Get-Member -InputObject $AllManagedApps -Name '@odata.nextLink' -MemberType Properties) {
                Write-Verbose "Get App. Nextlink found"

                # nextlink exists so we got paged results
                # Computer objects are on Value-property ($AllManagedApps.Value)
                # We need to activate Load more -button

                # Nextlink may have v1.0 API used so change that to beta API
                #$script:Apps_odatanextLink = $AllManagedApps.'@odata.nextLink'
                $script:Apps_odatanextLink = ($AllManagedApps.'@odata.nextLink').Replace('v1.0', 'beta')

                # Enable Load-more button
                $WPFAppsTAB_button_LoadMore.isEnabled = $true

            }
            else {
                Write-Verbose "Get App. Nextlink NOT found"

                # nextlink does not exits so we got all results
                # we can use $AllManagedDevices variable as is
                # We dont have @odata.context or @odata.count -attributes either

                # Disable Load-more button
                $WPFAppsTAB_button_LoadMore.isEnabled = $false
            }

            # Use this with Get-IntuneManagedApps...
            #$SearchedAppsCount = $AllManagedDevices.Count

            # Use this with Invoke-MSGraphRequest
            # Does not work with Apps but it works with devices
            #$SearchedAppsCount = $AllManagedApps.'@odata.count'

            # Workaround for Apps count
            $SearchedAppsCount = $AllManagedApps.value.count
            
            # Add Apps to Grid. Clear existing Apps list = $true
            # Use this with Invoke-MSGraphRequest
            AddManagedAppsToAppsGrid $AllManagedApps.Value $true

            # Add apps to script wide variable. For example Copy JSON/CSV export information from this variable
            $script:SearchedAppsObjects = $AllManagedApps.Value

			$WPFAppsTAB_textBox_AppsTotalCountSearched.Text = $script:SearchedAppsObjects.Count
            Write-InfoScreen -InfoText "Found $SearchedAppsCount apps." -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
        else {
            Write-InfoScreen -InfoText "Search did NOT find any apps." -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    })


$WPFAppsTAB_button_LoadMore.Add_Click( {
        Write-Verbose "Apps Load more -button pressed"

        # Cast as array because otherwise search returning only 1 device will not make array by default. It will show object itself
        # If we don't have array then our .Count will not work later on this function.

        # This will not work. Our nextlink if clause will not work with this one
        #[array]$AllManagedApps = $null

        $AllManagedApps = $null

        # Get next Apps set
        $AllManagedApps = Get-MSGraphNextPage -NextLink $script:Apps_odatanextLink

        Write-Verbose "AllManagedApps: $($AllManagedApps)"

        if ($AllManagedApps) {
            # Check if we got all results or did we get paged result
            # Notice! Last search result does not contain nextLink property but returned result is same kind of object than previous paged results
            if ((Get-Member -InputObject $AllManagedApps -Name '@odata.nextLink' -MemberType Properties) -and (Get-Member -InputObject $AllManagedApps -Name 'value' -MemberType Properties)) {

                Write-Verbose "App Load More returned next link so there is more Apps to load ($($AllManagedApps.'@odata.nextLink')"

                # nextlink exists so we got paged results
                # Computer objects are on Value-property ($AllManagedDevices.Value)
                # We need to activate or keep activated Load more -button

                # Activate Load-more button
                $WPFAppsTAB_button_LoadMore.isEnabled = $true

                # Nextlink may have v1.0 API used so change that to beta API
                #$script:Apps_odatanextLink = $AllManagedApps.'@odata.nextLink'
                $script:Apps_odatanextLink = ($AllManagedApps.'@odata.nextLink').Replace('v1.0', 'beta')

            }
            else {
                # nextlink does not exists so we got all results
                Write-Verbose "App Load More did not return next link"

                # If this is last set of search we got no nextlink so we clear variable and disable Load more -button
                if ($script:Apps_odatanextLink) {
                    $script:Apps_odatanextLink = $null

                    # Disable Load-more button
                    $WPFAppsTAB_button_LoadMore.isEnabled = $false
                }

            }

            # Use this with Invoke-MSGraphRequest
            # Does not work with Apps but it works with devices
            #$SearchedAppsCount = $AllManagedApps.'@odata.count'

            # Workaround for Apps count
            $SearchedAppsCount = $AllManagedApps.value.count

            # Add Apps to Grid
            AddManagedAppsToAppsGrid $AllManagedApps.Value $false

            # Add apps to script wide variable. For example Copy JSON/CSV export information from this variable
            $script:SearchedAppsObjects += $AllManagedApps.Value

            $WPFAppsTAB_textBox_AppsTotalCountSearched.Text = $script:SearchedAppsObjects.Count
            Write-InfoScreen -InfoText "Found $SearchedAppsCount more Apps." -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
        else {
            Write-InfoScreen -InfoText "Search did NOT find any apps." -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    })


$WPFAppsTAB_button_SearchAADGroupForAppAssignment.Add_Click({
    Write-Verbose "AppsTAB_button_SearchAADGroupForAppAssignment pressed"

    $appAssignmentAzureADGroupDisplayName = $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text

    # Check AzureADGroupName is not empty
    if(-not ($appAssignmentAzureADGroupDisplayName)) {
        # AzureADGroupName is empty
        Write-InfoScreen -InfoText "AzureAD Group name is empty! Type AzureAD GroupName for search." -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text = 'Type AzureAD Groupname for search'

        return
    }

    # Check we have valid AzureADGroup, find by displayName

    #Get-AADGroup -filter "displayname eq `'Intune for Education DEMO`'"
    #$appAssignmentAzureADGroupDisplayName = "Intune for Education DEMO"

    $AzureADGroupForAssignment = $null
    $AzureADGroupForAssignment = Get-AADGroup -filter "startswith(displayname,`'$appAssignmentAzureADGroupDisplayName`')"

    if(-not ($AzureADGroupForAssignment)) {
        # Did not find AzureAD Group
        Write-InfoScreen -InfoText "Did NOT find AzureAD Group with name $appAssignmentAzureADGroupDisplayName!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        return
    }

    if($AzureADGroupForAssignment -is [array]) {
        # We found more than 1 group. There are several AzureAD Group with same displayName
        # Show returned group in combobox

        # TODO what do we do if we got huge number of results? Now we show all

        Write-InfoScreen -InfoText "Found more than 1 AzureAD Group with name $appAssignmentAzureADGroupDisplayName. Select right group!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        # Clear possible existing items
        $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Items.Clear()

        # Add groups to combobox dropdown list
        foreach ($Group in $AzureADGroupForAssignment) { $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.items.Add($Group.displayName) | Out-Null }
        $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.SelectedIndex = 0

        # Open combobox dropdown list
        $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.IsDropDownOpen = $true
    } else {
        # Only 1 group found, set that to combobox
        Write-InfoScreen -InfoText "Found 1 AzureAD Group with name $appAssignmentAzureADGroupDisplayName." -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

        # Clear possible existing items
        $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Items.Clear()

        $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text = $AzureADGroupForAssignment.DisplayName
    }
})

# Change Apps filtering so it shows Assignments for AzureAD Group id
$WPFAppsTAB_button_ShowAppAssignmentToAADGroup.Add_Click({
    Write-Verbose "Apps - filter App Assignments to selected AAD Group"

    $appAssignmentAzureADGroupDisplayName = $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text

    # Clear possible existing items in dropdownbox
    $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Items.Clear()

    # Set back AzureAD Group name
    $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text = $appAssignmentAzureADGroupDisplayName


    # Check AzureADGroupName is not empty
    if(-not ($appAssignmentAzureADGroupDisplayName)) {
        # AzureADGroupName is empty
        Write-InfoScreen -InfoText "AzureAD Group name is empty!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        return
    }

    # Check we have valid AzureADGroup, find by displayName

    #Get-AADGroup -filter "displayname eq `'Intune for Education DEMO`'"
    #$appAssignmentAzureADGroupDisplayName = "Intune for Education DEMO"

    $AzureADGroupForAssignment = $null
    $AzureADGroupForAssignment = Get-AADGroup -filter "displayname eq `'$appAssignmentAzureADGroupDisplayName`'"

    if(-not ($AzureADGroupForAssignment)) {
        # Did not find AzureAD Group
        Write-InfoScreen -InfoText "Did NOT find AzureAD Group with name $appAssignmentAzureADGroupDisplayName!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        return
    }

    if($AzureADGroupForAssignment -is [array]) {
        # We found more than 1 group. There are several AzureAD Group with same displayName
        # Can NOT continue with Application Assignment!!!
        Write-InfoScreen -InfoText "Found more than 1 AzureAD Group with name $appAssignmentAzureADGroupDisplayName. Can NOT continue with Application assignment!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        return
    }

    $AzureADGroupForAssignmentId = $AzureADGroupForAssignment.id
    Write-Verbose "AzureAD Group id for filtering is: $AzureADGroupForAssignmentId with displayName: $appAssignmentAzureADGroupDisplayName"

    # Enable AppsTAB_checkBox_SearchEveryAttribute
    $WPFAppsTAB_checkBox_SearchEveryAttribute.IsChecked = $true

    # Change Search from Grid text so it will trigger Grid search event
    $WPFAppsTAB_textBox_SearchGrid.Text = "$($WPFAppsTAB_textBox_SearchGrid.Text)FOO"
    $WPFAppsTAB_textBox_SearchGrid.Text = $AzureADGroupForAssignmentId
})

$WPFAppsTAB_button_CreateAppAssignmentToSelectedApps.Add_Click( {
    Write-Verbose "Apps Create Application Assignment pressed"

    $SelectedIntent = $WPFAppsTAB_comboBox_AppAssignment_Intent.Text

    #$appAssignmentAzureADGroupDisplayName = $WPFAppsTAB_textBox_AzureADGroupNameForApplicationAssignment.Text
    $appAssignmentAzureADGroupDisplayName = $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text

    # Clear possible existing items in dropdownbox
    $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Items.Clear()

    # Set back AzureAD Group name
    $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text = $appAssignmentAzureADGroupDisplayName


    # Check AzureADGroupName is not empty
    if(-not ($appAssignmentAzureADGroupDisplayName)) {
        # AzureADGroupName is empty
        Write-InfoScreen -InfoText "AzureAD Group name is empty!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        return
    }

    # Check we have valid AzureADGroup, find by displayName

    #Get-AADGroup -filter "displayname eq `'Intune for Education DEMO`'"
    #$appAssignmentAzureADGroupDisplayName = "Intune for Education DEMO"

    $AzureADGroupForAssignment = $null
    $AzureADGroupForAssignment = Get-AADGroup -filter "displayname eq `'$appAssignmentAzureADGroupDisplayName`'"

    if(-not ($AzureADGroupForAssignment)) {
        # Did not find AzureAD Group
        Write-InfoScreen -InfoText "Did NOT find AzureAD Group with name $appAssignmentAzureADGroupDisplayName!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        return
    }

    if($AzureADGroupForAssignment -is [array]) {
        # We found more than 1 group. There are several AzureAD Group with same displayName
        # Can NOT continue with Application Assignment!!!
        Write-InfoScreen -InfoText "Found more than 1 AzureAD Group with name $appAssignmentAzureADGroupDisplayName. Can NOT continue with Application assignment!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        return
    }

    $AzureADGroupForAssignmentId = $AzureADGroupForAssignment.id
    Write-Verbose "AzureAD Group id for assignment is: $AzureADGroupForAssignmentId with displayName: $appAssignmentAzureADGroupDisplayName"

    foreach ($appInGrid in $WPFAppsTAB_listView_ManagedApps.SelectedItems) {
        Write-Verbose "Doing App Assignment for Application: $($appInGrid.displayName) (id: $($appInGrid.id)"

        # Check Assignment does not already exist

        # Get assignment
        $mobileAppId = $appInGrid.id
        $assignments = $null
        $assignments = Get-IntuneMobileAppAssignment -mobileAppId $mobileAppId

        if($assignments) {
            # We need to go through all assignments before we continue
            # First thought was to use Foreach-Object but Where-Object basically does same thing more easily

            <#
            $assignments = Get-IntuneMobileAppAssignment -mobileAppId a3128344-81e8-4635-a4b3-841d6dbfb392
            $assignments

            id                                       intent   target
            --                                       ------   ------
            34447ca3-03f0-4c03-8166-3aa1f5b51926_1_0 required @{@odata.type=#microsoft.graph.groupAssignmentTarget; groupId=3444...


            $assignments.target

            @odata.type                            groupId
            -----------                            -------
            #microsoft.graph.groupAssignmentTarget 34447ca3-03f0-4c03-8166-3aa1f5b51926
            #>

            $appAssignmentExist = $null
            # This returns assignment if it exists -> true
            $appAssignmentExist = $assignments | Where-Object {($_.intent -eq $SelectedIntent) -and ($_.target.groupId -eq $AzureADGroupForAssignmentId)}

            if($appAssignmentExist) {
                # Assignment already exists. We will not make any changes
                Write-InfoScreen -InfoText "Already exists $SelectedIntent Application assignment to Application $($appInGrid.displayName) for AzureAD Group $appAssignmentAzureADGroupDisplayName!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

                # Continue on next item in foreach loop
                Continue
            } else {
                # There is not existing assignment so we can continue

                $Success = Create-IntuneApplicationAssignment $AzureADGroupForAssignmentId $mobileAppId $SelectedIntent
                if($Success) {
                    Write-InfoScreen -InfoText "OK: $SelectedIntent Application assignment to Application $($appInGrid.displayName) for AzureAD Group $appAssignmentAzureADGroupDisplayName succeeded" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
                } else {
                    Write-InfoScreen -InfoText "There was error creating $SelectedIntent Application assignment to Application $($appInGrid.displayName) for AzureAD Group $appAssignmentAzureADGroupDisplayName!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
                }

            }

        } else {
            # No assignment for this App so we can continue with assignment
            Write-Verbose "There was not assignments for this application so we can continue with application assignment"

            $Success = Create-IntuneApplicationAssignment $AzureADGroupForAssignmentId $mobileAppId $SelectedIntent
            if($Success) {
                Write-InfoScreen -InfoText "OK: $SelectedIntent Application assignment to Application $($appInGrid.displayName) for AzureAD Group $appAssignmentAzureADGroupDisplayName succeeded" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            } else {
                Write-InfoScreen -InfoText "There was error creating $SelectedIntent Application assignment to Application $($appInGrid.displayName) for AzureAD Group $appAssignmentAzureADGroupDisplayName!" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            }
        }

    }

})


# Reset Apps search filters
$WPFAppsTAB_image_ResetFilters_X.Add_MouseLeftButtonDown( {
    $WPFAppsTAB_comboBox_AppFilterSearchText.Text = ''
    $WPFAppsTAB_checkBox_Win32.isChecked = $True
    $WPFAppsTAB_checkBox_MSStore.isChecked = $True
    $WPFAppsTAB_checkBox_MSIMobile.isChecked = $True
    $WPFAppsTAB_checkBox_AppXMSIX.isChecked = $True
    $WPFAppsTAB_checkBox_Android.isChecked = $True
    $WPFAppsTAB_checkBox_AndroidManagedStore.isChecked = $True
    $WPFAppsTAB_checkBox_iOSStore.isChecked = $True
    $WPFAppsTAB_checkBox_iOSManagedStore.isChecked = $True
    $WPFAppsTAB_checkBox_WebApp.isChecked = $True
    $WPFAppsTAB_checkBox_OfficeSuiteApp.isChecked = $True

    $WPFAppsTAB_comboBox_AppFilterAttribute.SelectedIndex = 0   

    $foo = Create_Apps_Search_Filter

})

$WPFAppsTAB_checkBox_Win32.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_MSStore.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_MSIMobile.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_AppXMSIX.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_Android.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_AndroidManagedStore.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_iOSStore.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_iOSManagedStore.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_WebApp.Add_Checked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_OfficeSuiteApp.Add_Checked({ $foo = Create_Apps_Search_Filter })

$WPFAppsTAB_checkBox_Win32.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_MSStore.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_MSIMobile.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_AppXMSIX.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_Android.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_AndroidManagedStore.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_iOSStore.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_iOSManagedStore.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_WebApp.Add_Unchecked({ $foo = Create_Apps_Search_Filter })
$WPFAppsTAB_checkBox_OfficeSuiteApp.Add_Unchecked({ $foo = Create_Apps_Search_Filter })

$WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Add_PreviewMouseLeftButtonDown( {
	# This does not trigger if selection is changed without mouse

    $CurrentValue = $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text
    if($CurrentValue -eq 'Type AzureAD GroupName for search') {
        $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text = ''

        # Does not work here
        #$WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Items.Clear()
    }

})


$WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Add_LostFocus( {
	# This does not trigger if selection is changed without mouse

    # If value is empty then change back our informational message

    $CurrentValue = $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text
    if($CurrentValue -eq '') {
        $WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text = 'Type AzureAD GroupName for search'
    }

})


$WPFAppsTAB_listView_ManagedApps.Add_PreviewMouseLeftButtonUp( {
	# This does not trigger if selection is changed without mouse
	$WPFAppsTAB_textBox_NumberOfAppsSelected.Text = $WPFAppsTAB_listView_ManagedApps.SelectedItems.Count
})


$WPFAppsTAB_listView_ManagedApps.Add_SelectionChanged( {
	$WPFAppsTAB_textBox_NumberOfAppsSelected.Text = $WPFAppsTAB_listView_ManagedApps.SelectedItems.Count
})


# Grid right click menu actions: Copy To Clip Board JSON
$WPFAppsTAB_ListView_CopyToClipBoardJSON_Menu.Add_Click( {

        # Copy values from Grid. This does not have all values existing in Intune
        #$WPFAppsTAB_listView_ManagedApps.SelectedItems | ConvertTo-JSON | clip
        #$Success = $?

        # Cast as array so we can add multiple objects. Otherwise += will not work
        # This works too
        #$appsCopyInformation = @()
        [array]$appsCopyInformation = $null

        foreach ($appInGrid in $WPFAppsTAB_listView_ManagedApps.SelectedItems) {
            Write-Verbose "Copy menu JSON clicked: In loop appName: $($appInGrid.displayName) (id: $($appInGrid.id)"

            #Copy app information
            $appsCopyInformation += $script:SearchedAppsObjects | Where-Object {$_.id -eq $appInGrid.id}
        }

        $appsCopyInformation | ConvertTo-Json | Set-Clipboard
        $Success = $?
        if ($Success) {
            Write-InfoScreen -InfoText "Copied selected Apps JSON information to clipboard" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    } )

# Grid right click menu actions: Copy To Clip Board CSV
$WPFAppsTAB_ListView_CopyToClipBoardCSV_Menu.Add_Click( {

        # Copy values from Grid. This does not have all values existing in Intune
        #$WPFAppsTAB_listView_ManagedApps.SelectedItems | ConvertTo-CSV | clip
        #$Success = $?

        # Cast as array so we can add multiple objects. Otherwise += will not work
        [array]$appsCopyInformation = $null

        foreach ($appInGrid in $WPFAppsTAB_listView_ManagedApps.SelectedItems) {
            Write-Verbose "Copy menu CSV clicked: In loop appName: $($appInGrid.displayName) (id: $($appInGrid.id)"

            #Copy app information
            $appsCopyInformation += $script:SearchedAppsObjects | Where-Object {$_.id -eq $appInGrid.id}
        }

        $appsCopyInformation | ConvertTo-Csv -NoTypeInformation| Set-Clipboard
        $Success = $?
        if ($Success) {
            Write-InfoScreen -InfoText "Copied selected Apps CSV information to clipboard" -TextColor Green -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
            Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
        }
    } )


$WPFAppsTAB_textBox_SearchGrid.Add_TextChanged( {

    $AppsSearchString = $WPFAppsTAB_textBox_SearchGrid.Text
    $script:AppsSearchedObservableCollection = @()

    if ($AppsSearchString -ne '') {

        # Check if "Search all attributes (slower)" is checked so whether we do search from all attributes (slower) or just basic attributes
        if($WPFAppsTAB_checkBox_SearchEveryAttribute.IsChecked) {

            # We will start search after 3 characters
            if($AppsSearchString.Length -le 2) { return }

            # Search Apps using all fetched attributes in variable $script:SearchedAppsObjects
            # Then find same device from $script:AppsObservableCollection

            $AllAppsProperties = $script:SearchedAppsObjects | Get-Member -MemberType Properties | Select-Object -ExpandProperty Name

            # Go through all apps
            Foreach ($app in $script:SearchedAppsObjects) {

                # Go through all Properties on each device and try to find our string from property value
                Foreach ($Property in $AllAppsProperties) {
                    #Write-Verbose "$($app.displayName) - $Property = $($device.$Property)"

                    # Check if string is found from property value
                    if ( $($app.$Property) -like "*$AppsSearchString*") {
                        # Found. We will add this device to found list
                        $script:AppsSearchedObservableCollection += $script:AppsObservableCollection | Where-Object { ($_.id -eq $app.id) }
                    
                        Write-Verbose "App $($app.displayName) - Property $Property=$($app.$Property) found"
                        Break
                    }

                }
            }

            $WPFAppsTAB_listView_ManagedApps.ItemsSource = $script:AppsSearchedObservableCollection
        } else {
            # Quick search information from ListView (Grid) data. We do not see every attribute

            # Really quick dirty workaround for finding/filtering Devices from Devices Grid.
            # We use pipeline filtering to original DevicesArray and copy filtered objects to another array which we assing to Grid ItemsSource
            # We propably should use WPF XAML Grid Listview filtering?
    
            # TODO: Make foreach-loop and go through all columns in ListView (Grid)
            $script:AppsSearchedObservableCollection = $script:AppsObservableCollection | `
            Where { ($_.displayName -like "*$AppsSearchString*") -or `
            ($_.id -like "*$AppsSearchString*") -or `
            ($_.appOSCustomVariable -like "*$AppsSearchString*") -or `
            ($_.filename -like "*$AppsSearchString*") -or `
            ($_.productversion -like "*$AppsSearchString*") -or `
            ($_.version -like "*$AppsSearchString*") -or `
            ($_.publishingState -like "*$AppsSearchString*") -or `
            ($_.isFeatured -like "*$AppsSearchString*") -or `
            ($_.size -like "*$AppsSearchString*") -or `
            ($_.notes -like "*$AppsSearchString*") -or `
            ($_.developer -like "*$AppsSearchString*") -or `
            ($_.publisher -like "*$AppsSearchString*") -or `
            ($_.informationUrl -like "*$AppsSearchString*") -or `
            ($_.privacyInformationUrl -like "*$AppsSearchString*") -or `
            ($_.createdDateTime -like "*$AppsSearchString*") -or `
            ($_.lastModifiedDateTime -like "*$AppsSearchString*") -or `
            ($_.licenseType -like "*$AppsSearchString*") -or `
            ($_.'@odata.type' -like "*$AppsSearchString*") -or `
            ($_.mobileAppODataType -like "*$AppsSearchString*") -or `
            ($_.productCode -like "*$AppsSearchString*") -or `
            ($_.packageIdentityName -like "*$AppsSearchString*") -or `
            ($_.packageId -like "*$AppsSearchString*") -or `
            ($_.bundleId -like "*$AppsSearchString*") -or `
            ($_.identityName -like "*$AppsSearchString*") -or `
            ($_.commandLine -like "*$AppsSearchString*") -or `
            ($_.installCommandLine -like "*$AppsSearchString*") -or `
            ($_.uninstallCommandLine -like "*$AppsSearchString*") -or `
            ($_.committedContentVersion -like "*$AppsSearchString*") -or `
            ($_.ignoreVersionDetection -like "*$AppsSearchString*") }

            $WPFAppsTAB_listView_ManagedApps.ItemsSource = $script:AppsSearchedObservableCollection
        }	
    }
    else {
        # We have no search string so we show all Apps
        $WPFAppsTAB_listView_ManagedApps.ItemsSource = $script:AppsObservableCollection
    }
    
    # Update apps number textbox in Grid
    $WPFAppsTAB_textBox_NumberOfAppsShown.Text = $WPFAppsTAB_listView_ManagedApps.Items.Count
} )


# Clear Apps Search from Grid -textbox when clicking X picture
$WPFAppsTAB_image_SearchFromGrid_X.Add_MouseLeftButtonDown( {
	$WPFAppsTAB_textBox_SearchGrid.Text = ''
})


#endregion Apps TAB GUI events

##################################################################################################


##################################################################################################

#region About

$WPFAboutTAB_button_Goto_github_website.Add_Click({
    Start 'https://github.com/petripaavola/Yodamiitti_IntuneManagementGUI_CommunityEdition'
})


#endregion About

##################################################################################################

#region Form specific functions closing etc...

#Closing the application
# Does not work
<#
$Form.Add_Closed({
	$null = $asyncwindow::ShowWindowAsync(($process).MainWindowHandle, 3)
	[System.Windows.Forms.Application]::Exit();
})
#>


# Add Exit

$Form.Add_Closing{

    if ($ProductionMode) {

        #ONLY USE THIS IN PRODUCTION.
        # This works, Powershell process is (forcefully) killed when WPF ends
        [System.Windows.Forms.Application]::Exit()
        Stop-Process $pid

	<#
		# Does NOT work, Powershell process is not closed

		$PowerShellConsoleWindow = Get-Process -Id $pid
		# Have to show the console window to call CloseMainWindow() method. Below method will "show" the window so it can receive the close message but it will not show anything to the user.
		[PowerShellConsole.Window]::ShowConsoleWindowMinNoActivate()
		$PowerShellConsoleWindow.CloseMainWindow()
	#>
		
        # Does not work here
        #$null = $asyncwindow::ShowWindowAsync(($process).MainWindowHandle, 3)
		
        # Does NOT work, Powershell process not killed and Powershell Window is NOT shown
        #USE THIS IN DEVELOPMENT
        #$Script:appContext.ExitThread()
    }
}

#endregion Form specific functions closing etc...

##################################################################################################

#region Main

#===========================================================================
# Shows the form
#===========================================================================

# Initiate variables

# Cast as arrays because single object or removing all other objects but one will otherwise make this normal custom object and not array
# Listview (Grid) uses this as source for displayed items
[array]$script:DevicesObservableCollection = New-Object System.Collections.ObjectModel.ObservableCollection[Object]
[array]$script:DevicesSearchedObservableCollection = New-Object System.Collections.ObjectModel.ObservableCollection[Object]

$DeviceCategories = $null
[string] $script:Devices_odatanextLink = $null
[array]$script:SearchedDeviceObjects = $null



[array]$script:AppsObservableCollection = New-Object System.Collections.ObjectModel.ObservableCollection[Object]
[array]$script:AppsSearchedObservableCollection = New-Object System.Collections.ObjectModel.ObservableCollection[Object]

[string] $script:Apps_odatanextLink = $null
[array]$script:SearchedAppsObjects = $null



# Longer list
#$DeviceFilterAttributes = @("deviceName","deviceCategoryDisplayName","managedDeviceOwnerType","complianceState","userDisplayName","userPrincipalName","emailAddress","lastSyncDateTime","enrolledDateTime","operatingSystem","osVersion","model","manufacturer","serialNumber","wiFiMacAddress","isEncrypted","totalStorageSpaceInBytes","freeStorageSpaceInBytes","managedDeviceName","managedDeviceId","jailBroken","managementAgent","azureADRegistered","deviceEnrollmentType","deviceRegistrationState","id","azureADDeviceId")

# Shorter list for initial release
$DeviceFilterAttributes = @("deviceName", "deviceCategoryDisplayName", "managedDeviceOwnerType", "complianceState", "userDisplayName", "userPrincipalName", "emailAddress", "lastSyncDateTime", "enrolledDateTime", "operatingSystem", "osVersion", "model", "manufacturer", "serialNumber", "wiFiMacAddress", "isEncrypted", "managedDeviceName", "managedDeviceId", "jailBroken", "managementAgent", "azureADRegistered", "deviceEnrollmentType", "deviceRegistrationState", "id", "azureADDeviceId")

foreach ($DeviceFilterAttribute in $DeviceFilterAttributes) { $WPFDevicesTAB_comboBox_DeviceFilterAttribute.items.Add($DeviceFilterAttribute) | Out-Null }
$WPFDevicesTAB_comboBox_DeviceFilterAttribute.SelectedIndex = 0

#$DeviceFilterOperators = "startswith","eq","ne","gt","ge","lt","le","and","or","not"
$DeviceFilterOperators = "startswith", "eq"

foreach ($DeviceFilterOperator in $DeviceFilterOperators) { $WPFDevicesTAB_comboBox_DeviceFilterOperator.items.Add($DeviceFilterOperator) | Out-Null }
$WPFDevicesTAB_comboBox_DeviceFilterOperator.SelectedIndex = 0

##### Devices Grid sorting

$script:DevicesGridLastColumnClicked = $null

# Add Device ListView Grid sorting code when column is pressed
[Windows.RoutedEventHandler]$deviceGridColumnClickEventCode = 	{
    
    $view = [System.Windows.Data.CollectionViewSource]::GetDefaultView($WPFDevicesTAB_listView_ManagedDevices.ItemsSource)
    
    # Not used because we will be confused if some column was sorted earlier
    # because this remembers that column last sort ordering
    #$sort = $view.SortDescriptions[0].Direction

    $columnHeader = $_.OriginalSource.Column.Header

    if($columnHeader -eq $null) { return }

    if($columnHeader -eq $script:DevicesGridLastColumnClicked) {
        # Same column clicked so reversing sorting order

        $sort = $view.SortDescriptions[0].Direction
        $direction = if($sort -and 'Descending' -eq $sort){'Ascending'}else{'Descending'}

    } else {
        # New column clicked so we always sort Ascending first time column is clicked

        # Always do Ascending sort unless we have pressed same column twice or more times
        $direction = 'Ascending'
    }

    Write-Verbose "$($_.OriginalSource.Column.Header) header clicked, doing $direction sorting to column/table."

    $view.SortDescriptions.Clear()
    $sortDescription = New-Object System.ComponentModel.SortDescription($columnHeader, $direction)
    $view.SortDescriptions.Add($sortDescription)

    # Save info we clicked this column.
    # If we click next time same column then we just reverse sort order
    $script:DevicesGridLastColumnClicked = $columnHeader

}

# Add Device ListView Grid column select event handler for sorting when grid column is clicked
$WPFDevicesTAB_listView_ManagedDevices.AddHandler([System.Windows.Controls.GridViewColumnHeader]::ClickEvent, $deviceGridColumnClickEventCode)

#####

# Initiate Paging values combobox (dropdownbox)
$PagingValues = "20", "50", "100", "250", "500", "1000"

# Devices
foreach ($PagingValue in $PagingValues) { $WPFDevicesTAB_comboBox_PagingNumber.items.Add($PagingValue) | Out-Null }
$WPFDevicesTAB_comboBox_PagingNumber.SelectedIndex = 5

# Apps
foreach ($PagingValue in $PagingValues) { $WPFAppsTAB_comboBox_PagingNumber.items.Add($PagingValue) | Out-Null }
$WPFAppsTAB_comboBox_PagingNumber.SelectedIndex = 5



#$DeviceFilterSearchTexts = "",""
#foreach ($DeviceFilterSearchText in $DeviceFilterSearchTexts) { $WPFDevicesTAB_comboBox_DeviceFilterSearchText.items.Add($DeviceFilterSearchText) | Out-Null }
#$WPFDevicesTAB_comboBox_DeviceFilterSearchText


$DeviceActions = @{
    'Sync'      = 'Invoke-IntuneManagedDeviceSyncDevice'
    'RebootNow' = 'Invoke-IntuneManagedDeviceRebootNow'
}

# Add device actions to Drobdown menu
foreach ($DeviceAction in $DeviceActions.Keys) { $WPFDevicesTAB_comboBox_DeviceActions.items.Add($DeviceAction) | Out-Null }


$DeviceOwnerTypes = @("company", "personal")
# Add device OwnerTypes to Drobdown menu
foreach ($DeviceOwnerType in $DeviceOwnerTypes) { $WPFDevicesTAB_comboBox_DeviceOwnerTypes.items.Add($DeviceOwnerType) | Out-Null }


# Add App assignment intents to Drobdown menu
$AppAssignmentIntents = @('required', 'available', 'uninstall', 'availableWithoutEnrollment')
foreach ($AppAssignmentIntent in $AppAssignmentIntents) { $WPFAppsTAB_comboBox_AppAssignment_Intent.items.Add($AppAssignmentIntent) | Out-Null }
$WPFAppsTAB_comboBox_AppAssignment_Intent.SelectedIndex = 0

# Add App AzureAD GroupName search default value

#$WPFAppsTAB_comboBox_AppAssignment_Intent.items.Add('Type AzureAD GroupName for search') | Out-Null
$WPFAppsTAB_comboBox_AzureADGroupNameForApplicationAssignment.Text = 'Type AzureAD GroupName for search'

##### Apps Grid sorting

$script:AppsGridLastColumnClicked = $null

# Add Device ListView Grid sorting code when column is pressed
[Windows.RoutedEventHandler]$appsGridColumnClickEventCode = 	{
    
    $view = [System.Windows.Data.CollectionViewSource]::GetDefaultView($WPFAppsTAB_listView_ManagedApps.ItemsSource)
    
    # Not used because we will be confused if some column was sorted earlier
    # because this remembers that column last sort ordering
    #$sort = $view.SortDescriptions[0].Direction

    $columnHeader = $_.OriginalSource.Column.Header

    if($columnHeader -eq $null) { return }

    if($columnHeader -eq $script:AppsGridLastColumnClicked) {
        # Same column clicked so reversing sorting order

        $sort = $view.SortDescriptions[0].Direction
        $direction = if($sort -and 'Descending' -eq $sort){'Ascending'}else{'Descending'}

    } else {
        # New column clicked so we always sort Ascending first time column is clicked

        # Always do Ascending sort unless we have pressed same column twice or more times
        $direction = 'Ascending'
    }

    Write-Verbose "$($_.OriginalSource.Column.Header) header clicked, doing $direction sorting to column/table."

    $view.SortDescriptions.Clear()
    $sortDescription = New-Object System.ComponentModel.SortDescription($columnHeader, $direction)
    $view.SortDescriptions.Add($sortDescription)

    # Save info we clicked this column.
    # If we click next time same column then we just reverse sort order
    $script:AppsGridLastColumnClicked = $columnHeader

}

# Add Apps ListView Grid column select event handler for sorting when grid column is clicked
$WPFAppsTAB_listView_ManagedApps.AddHandler([System.Windows.Controls.GridViewColumnHeader]::ClickEvent, $appsGridColumnClickEventCode)


# Shorter list for initial release
$AppsFilterAttributes = @("displayName", "fileName", "productVersion", "publishingState", "isFeatured", "publisher", "developer", "owner", "licenseType", "productCode", "packageIdentityName", "packageId", "bundleId", "installCommandLine", "ignoreVersionDetection")

foreach ($AppsFilterAttribute in $AppsFilterAttributes) { $WPFAppsTAB_comboBox_AppFilterAttribute.items.Add($AppsFilterAttribute) | Out-Null }
$WPFAppsTAB_comboBox_AppFilterAttribute.SelectedIndex = 0

$AppFilterOperators = "startswith", "eq"
foreach ($AppFilterOperator in $AppFilterOperators) { $WPFAppsTAB_comboBox_AppFilterOperator.items.Add($AppFilterOperator) | Out-Null }
$WPFAppsTAB_comboBox_AppFilterOperator.SelectedIndex = 0


#####



### Powershell scripts variables ###

$script:IntunePowershellScriptsInfo = $null

### Powershell scripts end ###




# Howto convert images to base64 and back in XAML
# http://vcloud-lab.com/entries/powershell/powershell-gui-encode-decode-images

$logo = @'
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EE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAABBNAEAAAAIogkAAABAEE0AAAAAgmgCAAAAEEQTAAAAgCCaAAAAAATRBAAAACCIJgAAAADhDwEGADG6OdrIk7dVAAAAAElFTkSuQmCC
'@
$WPFMainWindow_image_Logo.source = DecodeBase64Image -ImageBase64 $Logo

$picture_X = @'
iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAIAAAC0D9CtAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAE0SURBVDhPpZGxioNQEEX3B59aCBFFkNRpBcEihRb2qf0FK5FASAqLgNhaJYUIigi2FkHFnbyZVZM0u+ypfHPngNz5mv7OP5zH4+G6bpqm+FzTtq1pmlVV0Rudrussy2KMSZJ0vV4xQJqm2W63EKmqmuc5Dp9OkiSCIEAAiKIYxzFmdV0bhoFz4HA44Jz+7Xg8UsIY+OfzuSxLXddpxJjjOOM44vLSQRiGlHNNURR6MLbf74dhoL21AwRBQFsrbNvu+542OC8O4Ps+7XJ2ux1UStkPL87c0sxnk8DivLU0s24SIeetJc/zLpfLfABsEjeBp1MUhaZpGANzrafTiUZcg3twhTtw4M1mg9lbrVEU4RyAY+CQ/u1+v8uy/FkrgBqcgd7rDm6322etSJZl9MVZnN8yTd/Bx5q1HVOWAAAAAABJRU5ErkJggg==
'@
$WPFDevicesTAB_image_SearchFromGrid_X.source = DecodeBase64Image -ImageBase64 $picture_X
$WPFDevicesTAB_image_ResetFilters_X.source = DecodeBase64Image -ImageBase64 $picture_X

$WPFAppsTAB_image_SearchFromGrid_X.source = DecodeBase64Image -ImageBase64 $picture_X
$WPFAppsTAB_image_ResetFilters_X.source = DecodeBase64Image -ImageBase64 $picture_X

# Compliant.png
$DeviceCompliantPictureBase64 = @'
iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAIAAAC0tAIdAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAGMSURBVChTlZDPSwJBHMXn1iW6dojoVhbUKbJTf1DZJVIz06AoCpWirSil6FgdUsjfkmju6prkxS4ZmdFKUh0kWGp1xd66g+kpegxfdr7v8515s6TxH3XQtbqUKGw4eS3DalzpSfbJJtdr1Gvql84KJ+Yg0XvJYoCYA0qd95KlILkrn1OiRWdLRzo3sYSINUSWw3Rhi7EZN8mVz1RMoSVZNAUUr8WpKKot1qtcFSRyvUrp6IMVAaxNQj0bddZDhMrN53fJ6FciJQqblN5LjeIAoCuRLnwAhR3OG2CtXXUjOppOfoLSW9cDyIcwovSWez2dviD7yTH0jzNTRp9yFZLssIOU3uVGMI3FsEPYckU7arLomLukwWAd8uOUjuQNep9iIKI93oeOUOFbKCpeFXtcpbRY/cCN6k/AgCutXY/2IC62WOgjZFUWKQ2lnrfxE9QBvMHShuo85FZwqRilIQzgYINPofEsVMRb8JPMywEl2mlIlN5D93qG0zji/Qw3HMmbvmoV6jXVQf+hRuMHSI7TQY1Q5WEAAAAASUVORK5CYII=
'@
$CompliantPictureObject = DecodeBase64Image -ImageBase64 $DeviceCompliantPictureBase64

# NotCompliant.png
$DeviceNotCompliantPictureBase64 = @'
iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAIAAAC0tAIdAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAFiSURBVChTY/hPCsCi+uepsz927f/z6AmUjwRQVL9Pzn/KwAtEzxgEnjJwvBDX+L5pB1QODBCqX6qZP2MQes6v+JxD+hmT6HM+hefcck8ZOD/3z4CqgKt+4x7yjFHkhaAyUOm7mIwvk2e/VDAEaeBXfMrA9fPYKYgykOo/L14+ZWB/LqAEVP2MWexzWz9Q8IWYxnNeBYj+19aeYMVg1V8mzX7GIAyUAKlmEf+YVwUUfMYhDTQYpFpACegesGKw6k+VzUAjIaqfs0m+T8gBCj5l4IfYBkRA1X9//YKqRjb7OZfsa2OnH1t3PWXgg4qgmY3iblaJj0W1f99/fCGhCfQlSDXQ3VZI7gaCN27QMHnGKv6ppg0o8lJWD+hLaJgcRQoTCHipagoNbzZJUHjzykPDu286VAWyaiB4n5T7lIEHHJ38oLgUU/++cTtUDgxQVEPAz5PgdPLwMZSPBLCoxgn+/wcA/sTjRbfvP80AAAAASUVORK5CYII=
'@
$NotCompliantPictureObject = DecodeBase64Image -ImageBase64 $DeviceNotCompliantPictureBase64


#Write-Verbose $CompliancePicture
#VERBOSE: System.Windows.Media.Imaging.BitmapImage


$Icon = @'
iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4gsYFyALbhoWlwAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAACCklEQVRYw+1XQY7aMBR9tgMJ6mjaEaNEgnYUFVQOwCGQKqaaG3AfJPZcgAWrLGCLOAArtsABYAkSILCdPwuaEBRIS7NAo/JWcfL9/fz9//MPIyLCDcFxY9wJGAAwn88xmUwgxJGP7xMqlQps2061wGKxwGw2A3BMNcYYCoUiXNcFtNbU6XSoWCxQuVyicrlEpdJ3enn5Rp7nUVp0u93Qb+C7UvlBzWaTiIgMAFBKYb1eIygIIoKUElqr1CFWSmGz2YRjIoJhGJBSHo+AMQYhBDjnodHhmaUmEPiObo5zDsbYB6gC08ymXiCbzf65Ci6FzfM8TKdTKPVvuSCEwHg8RpLYGkmTB4MBhsNhqgj4vn99BAJoraG1/g+UMAnnzi8ooTS2f0XANE1kMpnY+6hoRXPGNM1QSwJIKbHb7a4noJTG29tPVKtVKCVPdtRqtbBarcLdaa3hui5eX3/h+TkfJp4QAqPRCL1e7zoCRATf16jVaqjX67Hv7XYby+XyhECx+BWNRgOO45zYPj5+Rr/fv1iKiUl4KXREFDtb39fYbrcx2/1+f29I7gTuBD4IgWt/kKL2RISk6Yn9AGMMuVwOjuPAsqwTDY+Oo8jn89Bah2IkpcTT0xcIIWK2lmXBtu0TEkIIPDx8Okj77+451jgQAULws7fZ+R6BgXMWsz/nO7hTOOcHAvckvCXeAQGrOg1kdasJAAAAAElFTkSuQmCC
'@
# Set Windows icon (upper left)
$Form.Icon = DecodeBase64Image -ImageBase64 $Icon

# Set taskbar icon
$Form.TaskbarItemInfo.Overlay = DecodeBase64Image -ImageBase64 $Icon
$Form.TaskbarItemInfo.Description = $Form.Title

#####
$AuthorSilhuetto = @'
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
'@
$WPFAboutTAB_image_Author.source = DecodeBase64Image -ImageBase64 $AuthorSilhuetto


$AuthorBW = @'
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Ong9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MCA3OS4xNjA0NTEsIDIwMTcvMDUvMDYtMDE6MDg6MjEgICAgICAgICI+DQoJPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4NCgkJPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjlBMDNGMTAxNUU5RUUzMTE4NjQxODgyNzhDMTkwNzJDIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjdjNDk5MTZhLTg2MDEtYjE0Yy1hODNkLTk5ZDFjNDRhN2YxNSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3YzQ5OTE2YS04NjAxLWIxNGMtYTgzZC05OWQxYzQ0YTdmMTUiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIEV4cHJlc3MgV2luZG93cyAxMCAoV2luZG93cykiIHhtcDpNZXRhZGF0YURhdGU9IjIwMTktMDMtMTJUMDE6MjM6MDkrMDI6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE5LTAzLTEyVDAxOjIzOjA5KzAyOjAwIiBkYzpmb3JtYXQ9ImltYWdlL2pwZWciPg0KCQkJPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QkU4RTU3QTBBM0RGMTFFM0E2OEJCMzc2M0M3MTAwQUMiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QkU4RTU3QTFBM0RGMTFFM0E2OEJCMzc2M0M3MTAwQUMiIHN0UmVmOm9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo5QTAzRjEwMTVFOUVFMzExODY0MTg4Mjc4QzE5MDcyQyIvPg0KCQkJPHhtcE1NOkhpc3Rvcnk+DQoJCQkJPHJkZjpTZXE+DQoJCQkJCTxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJkZXJpdmVkIiBzdEV2dDpwYXJhbWV0ZXJzPSJzYXZlZCB0byBuZXcgbG9jYXRpb24iLz4NCgkJCQkJPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjdjNDk5MTZhLTg2MDEtYjE0Yy1hODNkLTk5ZDFjNDRhN2YxNSIgc3RFdnQ6d2hlbj0iMjAxOS0wMy0xMlQwMToyMzowOSswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIEV4cHJlc3MgV2luZG93cyAxMCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4NCgkJCQk8L3JkZjpTZXE+DQoJCQk8L3htcE1NOkhpc3Rvcnk+DQoJCTwvcmRmOkRlc2NyaXB0aW9uPg0KCTwvcmRmOlJERj4NCjwveDp4bXBtZXRhPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw/eHBhY2tldCBlbmQ9J3cnPz7/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAgMDAwYDAwYMCAcIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCABkAGQDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD418H+DmvHX5OteyeAvhp5uz93n8KPhp4C83y/3fp2r6B+HXw6ysf7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
'@


#####
# Create cache folder if not exist
# This is used for image caching used in GUI and Apps logos
if(-not (Test-Path "$PSScriptRoot\cache")) {
    New-Item "$PSScriptRoot\cache" -Itemtype Directory
}

# Export images to cache folder
# This is workaround until I figure out how to use image objects in Devices ListView GridView cell

# Try-catch because files are usually locked when using script again in same session
try {
    $return = Convert-Base64ToFile $DeviceCompliantPictureBase64 "$PSScriptRoot\cache\Compliant.png"
    Write-Verbose "Convert-Base64ToFile $PSScriptRoot\cache\Compliant.png $return"

    $return = Convert-Base64ToFile $DeviceNotCompliantPictureBase64 "$PSScriptRoot\cache\NotCompliant.png"
    Write-Verbose "Convert-Base64ToFile $PSScriptRoot\cache\NotCompliant.png $return"
} catch {}


#####

# Disable all tabs until we login to MSGraph
$WPFTABDevices.IsEnabled = $false
$WPFTABApps.IsEnabled = $false
$WPFTABConfiguration.IsEnabled = $false

#Write-InfoScreen -InfoText "Normal black text" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
#Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
#Write-InfoScreen -InfoText "Bold italic black text." -TextColor Black -TextFontSize "16" -TextFontStyle "Italic" -TextFontWeight "Bold"
#Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
#Write-InfoScreen -InfoText "Normal red text" -TextColor Red -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

Write-InfoScreen -InfoText "Press Connect-MSGraph to get started" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"
Write-InfoScreen -InfoText "" -TextColor Black -TextFontSize "12" -TextFontStyle "Normal" -TextFontWeight "Normal"

# In ProductionMode Powershell console Window is hidden and Powershell process is killed on exit
#$ProductionMode = $true

# First version of script will leave Powershell console open so we will see possible error messages
$ProductionMode = $false

if ($ProductionMode) {
    # Make PowerShell Disappear 
    $windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);' 
    $asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru 
    $null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0) 
}

# This should be more responsive approach. We have not configured to run GUI in its own thread
# https://blog.netnerds.net/2016/01/showdialog-sucks-use-applicationcontexts-instead/
#$app = [Windows.Application]::new()
#$app.Run($Form)



# Show Form
$Form.ShowDialog() | out-null


# SIG # Begin signature block
# MIIh1wYJKoZIhvcNAQcCoIIhyDCCIcQCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUWQhu7hjXS33rBlSIJiTL+BaT
# Zzaggh1EMIIDxTCCAq2gAwIBAgIQAqxcJmoLQJuPC3nyrkYldzANBgkqhkiG9w0B
# AQUFADBsMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMSswKQYDVQQDEyJEaWdpQ2VydCBIaWdoIEFz
# c3VyYW5jZSBFViBSb290IENBMB4XDTA2MTExMDAwMDAwMFoXDTMxMTExMDAwMDAw
# MFowbDELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UE
# CxMQd3d3LmRpZ2ljZXJ0LmNvbTErMCkGA1UEAxMiRGlnaUNlcnQgSGlnaCBBc3N1
# cmFuY2UgRVYgUm9vdCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
# AMbM5XPm+9S75S0tMqbf5YE/yc0lSbZxKsPVlDRnogocsF9ppkCxxLeyj9CYpKlB
# WTrT3JTWPNt0OKRKzE0lgvdKpVMSOO7zSW1xkX5jtqumX8OkhPhPYlG++MXs2ziS
# 4wblCJEMxChBVfvLWokVfnHoNb9Ncgk9vjo4UFt3MRuNs8ckRZqnrG0AFFoEt7oT
# 61EKmEFBIk5lYYeBQVCmeVyJ3hlKV9Uu5l0cUyx+mM0aBhakaHPQNAQTXKFx01p8
# VdteZOE3hzBWBOURtCmAEvF5OYiiAhF8J2a3iLd48soKqDirCmTCv2ZdlYTBoSUe
# h10aUAsgEsxBu24LUTi4S8sCAwEAAaNjMGEwDgYDVR0PAQH/BAQDAgGGMA8GA1Ud
# EwEB/wQFMAMBAf8wHQYDVR0OBBYEFLE+w2kD+L9HAdSYJhoIAu9jZCvDMB8GA1Ud
# IwQYMBaAFLE+w2kD+L9HAdSYJhoIAu9jZCvDMA0GCSqGSIb3DQEBBQUAA4IBAQAc
# GgaX3NecnzyIZgYIVyHbIUf4KmeqvxgydkAQV8GK83rZEWWONfqe/EW1ntlMMUu4
# kehDLI6zeM7b41N5cdblIZQB2lWHmiRk9opmzN6cN82oNLFpmyPInngiK3BD41VH
# MWEZ71jFhS9OMPagMRYjyOfiZRYzy78aG6A9+MpeizGLYAiJLQwGXFK3xPkKmNEV
# X58Svnw2Yzi9RKR/5CYrCsSXaQ3pjOLAEFe4yHYSkVXySGnYvCoCWw9E1CAx2/S6
# cCZdkGCevEsXCS+0yx5DaMkHJ8HSXPfqIbloEpw8nL+e/IBcm2PN7EeqJSdnoDfz
# AIJ9VNep+OkuE6N36B9KMIIFeDCCBGCgAwIBAgIQBQbkfYp2NP3HW6pLDphGODAN
# BgkqhkiG9w0BAQsFADBsMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQg
# SW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSswKQYDVQQDEyJEaWdpQ2Vy
# dCBFViBDb2RlIFNpZ25pbmcgQ0EgKFNIQTIpMB4XDTE3MTAxMTAwMDAwMFoXDTIw
# MTAxNDEyMDAwMFowgZUxEzARBgsrBgEEAYI3PAIBAxMCRkkxHTAbBgNVBA8MFFBy
# aXZhdGUgT3JnYW5pemF0aW9uMRIwEAYDVQQFEwkyNTQzMTQ0LTgxCzAJBgNVBAYT
# AkZJMQ4wDAYDVQQHEwVFc3BvbzEWMBQGA1UEChMNWW9kYW1paXR0aSBPeTEWMBQG
# A1UEAxMNWW9kYW1paXR0aSBPeTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
# ggEBAKT23in8UmTBz9Gz0DqujCVYyRZlJLH+hid+XUtouAFQ6KegkazzQgMcKi05
# 5pGZ1PFG0cURqNYjDpxaG5fmsWFWFGj63NRtXkDCNN12lJJA96sLxfcX9AsjSxaj
# LkZ8Cje+TAbV3j1Jf4+mnMeh/y3NnNsGkP7Ii9ZsNFBZvo+ipv/OGUryfcDi5sZt
# WXb7w/x/4i5LVyC607ThQF3BOYxo2FWSVWrT3qvN4jntpkU3pHLvl0ktvCigXPKs
# vn1DKG5A2UlsKj3HWRGImAI/wbyP0/LQPLgqdxTtt8anHI3NrEI2+WQhrxLED+FZ
# xKNmaLgxI8giI5GqKWtJlGviXAkCAwEAAaOCAeowggHmMB8GA1UdIwQYMBaAFI/o
# fvBtMmoABSPHcJdqOpD/a+rUMB0GA1UdDgQWBBSx3zynPP0jv/yzR+jzY2PIsHEY
# +TAnBgNVHREEIDAeoBwGCCsGAQUFBwgDoBAwDgwMRkktMjU0MzE0NC04MA4GA1Ud
# DwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzB7BgNVHR8EdDByMDegNaAz
# hjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRVZDb2RlU2lnbmluZ1NIQTItZzEu
# Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRVZDb2RlU2lnbmlu
# Z1NIQTItZzEuY3JsMEsGA1UdIAREMEIwNwYJYIZIAYb9bAMCMCowKAYIKwYBBQUH
# AgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwBwYFZ4EMAQMwfgYIKwYB
# BQUHAQEEcjBwMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20w
# SAYIKwYBBQUHMAKGPGh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2Vy
# dEVWQ29kZVNpZ25pbmdDQS1TSEEyLmNydDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3
# DQEBCwUAA4IBAQAiZKBW4WeI27Dua1pfjCH0FhuUrEv/jDR5uBOyGt6DEslF/O2K
# 91RsKUU4Z6HEOsIGC+mNmrlg0PPQquU7mvudexoo1QXVZW4NQrQc9dJuuwqgyk56
# PA8l0S6JDUwNX2UgIjfz3oSeDQqxcR1V7UvyAzuxOg/zCUqv8FL4iuIvlCBNxJ8o
# f02/vzsRwI8YPRvT6Xh2zVIygpPip/r4MTuPOfvSEK3Id2WmLNT8YLH7Er1Laum9
# p22FM7wpml43qRkbMjnOst949kUZ/DGUwcMDQSLKp5z4suz4578is3L1VMmnsIHc
# g0Li8TtAypPpcA4RBnP7u6+GuIldKeAPqs5SMIIGajCCBVKgAwIBAgIQAwGaAjr/
# WLFr1tXq5hfwZjANBgkqhkiG9w0BAQUFADBiMQswCQYDVQQGEwJVUzEVMBMGA1UE
# ChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYD
# VQQDExhEaWdpQ2VydCBBc3N1cmVkIElEIENBLTEwHhcNMTQxMDIyMDAwMDAwWhcN
# MjQxMDIyMDAwMDAwWjBHMQswCQYDVQQGEwJVUzERMA8GA1UEChMIRGlnaUNlcnQx
# JTAjBgNVBAMTHERpZ2lDZXJ0IFRpbWVzdGFtcCBSZXNwb25kZXIwggEiMA0GCSqG
# SIb3DQEBAQUAA4IBDwAwggEKAoIBAQCjZF38fLPggjXg4PbGKuZJdTvMbuBTqZ8f
# ZFnmfGt/a4ydVfiS457VWmNbAklQ2YPOb2bu3cuF6V+l+dSHdIhEOxnJ5fWRn8YU
# Oawk6qhLLJGJzF4o9GS2ULf1ErNzlgpno75hn67z/RJ4dQ6mWxT9RSOOhkRVfRiG
# BYxVh3lIRvfKDo2n3k5f4qi2LVkCYYhhchhoubh87ubnNC8xd4EwH7s2AY3vJ+P3
# mvBMMWSN4+v6GYeofs/sjAw2W3rBerh4x8kGLkYQyI3oBGDbvHN0+k7Y/qpA8bLO
# cEaD6dpAoVk62RUJV5lWMJPzyWHM0AjMa+xiQpGsAsDvpPCJEY93AgMBAAGjggM1
# MIIDMTAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADAWBgNVHSUBAf8EDDAK
# BggrBgEFBQcDCDCCAb8GA1UdIASCAbYwggGyMIIBoQYJYIZIAYb9bAcBMIIBkjAo
# BggrBgEFBQcCARYcaHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCCAWQGCCsG
# AQUFBwICMIIBVh6CAVIAQQBuAHkAIAB1AHMAZQAgAG8AZgAgAHQAaABpAHMAIABD
# AGUAcgB0AGkAZgBpAGMAYQB0AGUAIABjAG8AbgBzAHQAaQB0AHUAdABlAHMAIABh
# AGMAYwBlAHAAdABhAG4AYwBlACAAbwBmACAAdABoAGUAIABEAGkAZwBpAEMAZQBy
# AHQAIABDAFAALwBDAFAAUwAgAGEAbgBkACAAdABoAGUAIABSAGUAbAB5AGkAbgBn
# ACAAUABhAHIAdAB5ACAAQQBnAHIAZQBlAG0AZQBuAHQAIAB3AGgAaQBjAGgAIABs
# AGkAbQBpAHQAIABsAGkAYQBiAGkAbABpAHQAeQAgAGEAbgBkACAAYQByAGUAIABp
# AG4AYwBvAHIAcABvAHIAYQB0AGUAZAAgAGgAZQByAGUAaQBuACAAYgB5ACAAcgBl
# AGYAZQByAGUAbgBjAGUALjALBglghkgBhv1sAxUwHwYDVR0jBBgwFoAUFQASKxOY
# spkH7R7for5XDStnAs0wHQYDVR0OBBYEFGFaTSS2STKdSip5GoNL9B6Jwcp9MH0G
# A1UdHwR2MHQwOKA2oDSGMmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2Vy
# dEFzc3VyZWRJRENBLTEuY3JsMDigNqA0hjJodHRwOi8vY3JsNC5kaWdpY2VydC5j
# b20vRGlnaUNlcnRBc3N1cmVkSURDQS0xLmNybDB3BggrBgEFBQcBAQRrMGkwJAYI
# KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBBBggrBgEFBQcwAoY1
# aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEQ0Et
# MS5jcnQwDQYJKoZIhvcNAQEFBQADggEBAJ0lfhszTbImgVybhs4jIA+Ah+WI//+x
# 1GosMe06FxlxF82pG7xaFjkAneNshORaQPveBgGMN/qbsZ0kfv4gpFetW7easGAm
# 6mlXIV00Lx9xsIOUGQVrNZAQoHuXx/Y/5+IRQaa9YtnwJz04HShvOlIJ8OxwYtNi
# S7Dgc6aSwNOOMdgv420XEwbu5AO2FKvzj0OncZ0h3RTKFV2SQdr5D4HRmXQNJsQO
# fxu19aDxxncGKBXp2JPlVRbwuwqrHNtcSCdmyKOLChzlldquxC5ZoGHd2vNtomHp
# igtt7BIYvfdVVEADkitrwlHCCkivsNRu4PQUCjob4489yq9qjXvc2EQwgga8MIIF
# pKADAgECAhAD8bThXzqC8RSWeLPX2EdcMA0GCSqGSIb3DQEBCwUAMGwxCzAJBgNV
# BAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdp
# Y2VydC5jb20xKzApBgNVBAMTIkRpZ2lDZXJ0IEhpZ2ggQXNzdXJhbmNlIEVWIFJv
# b3QgQ0EwHhcNMTIwNDE4MTIwMDAwWhcNMjcwNDE4MTIwMDAwWjBsMQswCQYDVQQG
# EwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNl
# cnQuY29tMSswKQYDVQQDEyJEaWdpQ2VydCBFViBDb2RlIFNpZ25pbmcgQ0EgKFNI
# QTIpMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp1P6D7K1E/Fkz4SA
# /K6ANdG218ejLKwaLKzxhKw6NRI6kpG6V+TEyfMvqEg8t9Zu3JciulF5Ya9DLw23
# m7RJMa5EWD6koZanh08jfsNsZSSQVT6hyiN8xULpxHpiRZt93mN0y55jJfiEmpqt
# RU+ufR/IE8t1m8nh4Yr4CwyY9Mo+0EWqeh6lWJM2NL4rLisxWGa0MhCfnfBSoe/o
# PtN28kBa3PpqPRtLrXawjFzuNrqD6jCoTN7xCypYQYiuAImrA9EWgiAiduteVDgS
# YuHScCTb7R9w0mQJgC3itp3OH/K7IfNs29izGXuKUJ/v7DYKXJq3StMIoDl5/d2/
# PToJJQIDAQABo4IDWDCCA1QwEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8E
# BAMCAYYwEwYDVR0lBAwwCgYIKwYBBQUHAwMwfwYIKwYBBQUHAQEEczBxMCQGCCsG
# AQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wSQYIKwYBBQUHMAKGPWh0
# dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEhpZ2hBc3N1cmFuY2VF
# VlJvb3RDQS5jcnQwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NybDMuZGln
# aWNlcnQuY29tL0RpZ2lDZXJ0SGlnaEFzc3VyYW5jZUVWUm9vdENBLmNybDBAoD6g
# PIY6aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0SGlnaEFzc3VyYW5j
# ZUVWUm9vdENBLmNybDCCAcQGA1UdIASCAbswggG3MIIBswYJYIZIAYb9bAMCMIIB
# pDA6BggrBgEFBQcCARYuaHR0cDovL3d3dy5kaWdpY2VydC5jb20vc3NsLWNwcy1y
# ZXBvc2l0b3J5Lmh0bTCCAWQGCCsGAQUFBwICMIIBVh6CAVIAQQBuAHkAIAB1AHMA
# ZQAgAG8AZgAgAHQAaABpAHMAIABDAGUAcgB0AGkAZgBpAGMAYQB0AGUAIABjAG8A
# bgBzAHQAaQB0AHUAdABlAHMAIABhAGMAYwBlAHAAdABhAG4AYwBlACAAbwBmACAA
# dABoAGUAIABEAGkAZwBpAEMAZQByAHQAIABDAFAALwBDAFAAUwAgAGEAbgBkACAA
# dABoAGUAIABSAGUAbAB5AGkAbgBnACAAUABhAHIAdAB5ACAAQQBnAHIAZQBlAG0A
# ZQBuAHQAIAB3AGgAaQBjAGgAIABsAGkAbQBpAHQAIABsAGkAYQBiAGkAbABpAHQA
# eQAgAGEAbgBkACAAYQByAGUAIABpAG4AYwBvAHIAcABvAHIAYQB0AGUAZAAgAGgA
# ZQByAGUAaQBuACAAYgB5ACAAcgBlAGYAZQByAGUAbgBjAGUALjAdBgNVHQ4EFgQU
# j+h+8G0yagAFI8dwl2o6kP9r6tQwHwYDVR0jBBgwFoAUsT7DaQP4v0cB1JgmGggC
# 72NkK8MwDQYJKoZIhvcNAQELBQADggEBABkzSgyBMzfbrTbJ5Mk6u7UbLnqi4vRD
# Qheev06hTeGx2+mB3Z8B8uSI1en+Cf0hwexdgNLw1sFDwv53K9v515EzzmzVshk7
# 5i7WyZNPiECOzeH1fvEPxllWcujrakG9HNVG1XxJymY4FcG/4JFwd4fcyY0xyQwp
# ojPtjeKHzYmNPxv/1eAal4t82m37qMayOmZrewGzzdimNOwSAauVWKXEU1eoYObn
# AhKguSNkok27fIElZCG+z+5CGEOXu6U3Bq9N/yalTWFL7EZBuGXOuHmeCJYLgYyK
# O4/HmYyjKm6YbV5hxpa3irlhLZO46w4EQ9f1/qbwYtSZaqXBwfBklIAwggbNMIIF
# taADAgECAhAG/fkDlgOt6gAK6z8nu7obMA0GCSqGSIb3DQEBBQUAMGUxCzAJBgNV
# BAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdp
# Y2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAe
# Fw0wNjExMTAwMDAwMDBaFw0yMTExMTAwMDAwMDBaMGIxCzAJBgNVBAYTAlVTMRUw
# EwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20x
# ITAfBgNVBAMTGERpZ2lDZXJ0IEFzc3VyZWQgSUQgQ0EtMTCCASIwDQYJKoZIhvcN
# AQEBBQADggEPADCCAQoCggEBAOiCLZn5ysJClaWAc0Bw0p5WVFypxNJBBo/JM/xN
# RZFcgZ/tLJz4FlnfnrUkFcKYubR3SdyJxArar8tea+2tsHEx6886QAxGTZPsi3o2
# CAOrDDT+GEmC/sfHMUiAfB6iD5IOUMnGh+s2P9gww/+m9/uizW9zI/6sVgWQ8DIh
# FonGcIj5BZd9o8dD3QLoOz3tsUGj7T++25VIxO4es/K8DCuZ0MZdEkKB4YNugnM/
# JksUkK5ZZgrEjb7SzgaurYRvSISbT0C58Uzyr5j79s5AXVz2qPEvr+yJIvJrGGWx
# wXOt1/HYzx4KdFxCuGh+t9V3CidWfA9ipD8yFGCV/QcEogkCAwEAAaOCA3owggN2
# MA4GA1UdDwEB/wQEAwIBhjA7BgNVHSUENDAyBggrBgEFBQcDAQYIKwYBBQUHAwIG
# CCsGAQUFBwMDBggrBgEFBQcDBAYIKwYBBQUHAwgwggHSBgNVHSAEggHJMIIBxTCC
# AbQGCmCGSAGG/WwAAQQwggGkMDoGCCsGAQUFBwIBFi5odHRwOi8vd3d3LmRpZ2lj
# ZXJ0LmNvbS9zc2wtY3BzLXJlcG9zaXRvcnkuaHRtMIIBZAYIKwYBBQUHAgIwggFW
# HoIBUgBBAG4AeQAgAHUAcwBlACAAbwBmACAAdABoAGkAcwAgAEMAZQByAHQAaQBm
# AGkAYwBhAHQAZQAgAGMAbwBuAHMAdABpAHQAdQB0AGUAcwAgAGEAYwBjAGUAcAB0
# AGEAbgBjAGUAIABvAGYAIAB0AGgAZQAgAEQAaQBnAGkAQwBlAHIAdAAgAEMAUAAv
# AEMAUABTACAAYQBuAGQAIAB0AGgAZQAgAFIAZQBsAHkAaQBuAGcAIABQAGEAcgB0
# AHkAIABBAGcAcgBlAGUAbQBlAG4AdAAgAHcAaABpAGMAaAAgAGwAaQBtAGkAdAAg
# AGwAaQBhAGIAaQBsAGkAdAB5ACAAYQBuAGQAIABhAHIAZQAgAGkAbgBjAG8AcgBw
# AG8AcgBhAHQAZQBkACAAaABlAHIAZQBpAG4AIABiAHkAIAByAGUAZgBlAHIAZQBu
# AGMAZQAuMAsGCWCGSAGG/WwDFTASBgNVHRMBAf8ECDAGAQH/AgEAMHkGCCsGAQUF
# BwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
# CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRB
# c3N1cmVkSURSb290Q0EuY3J0MIGBBgNVHR8EejB4MDqgOKA2hjRodHRwOi8vY3Js
# My5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290Q0EuY3JsMDqgOKA2
# hjRodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290
# Q0EuY3JsMB0GA1UdDgQWBBQVABIrE5iymQftHt+ivlcNK2cCzTAfBgNVHSMEGDAW
# gBRF66Kv9JLLgjEtUYunpyGd823IDzANBgkqhkiG9w0BAQUFAAOCAQEARlA+ybco
# JKc4HbZbKa9Sz1LpMUerVlx71Q0LQbPv7HUfdDjyslxhopyVw1Dkgrkj0bo6hnKt
# OHisdV0XFzRyR4WUVtHruzaEd8wkpfMEGVWp5+Pnq2LN+4stkMLA0rWUvV5PsQXS
# Dj0aqRRbpoYxYqioM+SbOafE9c4deHaUJXPkKqvPnHZL7V/CSxbkS3BMAIke/MV5
# vEwSV/5f4R68Al2o/vsHOE8Nxl2RuQ9nRc3Wg+3nkg2NsWmMT/tZ4CMP0qquAHzu
# nEIOz5HXJ7cW7g/DvXwKoO4sCFWFIrjrGBpN/CohrUkxg0eVd3HcsRtLSxwQnHcU
# wZ1PL1qVCCkQJjGCA/0wggP5AgEBMIGAMGwxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKzApBgNV
# BAMTIkRpZ2lDZXJ0IEVWIENvZGUgU2lnbmluZyBDQSAoU0hBMikCEAUG5H2KdjT9
# x1uqSw6YRjgwCQYFKw4DAhoFAKBAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEE
# MCMGCSqGSIb3DQEJBDEWBBSa2k1StpXDzURj/7bQQJjRB4vXNDANBgkqhkiG9w0B
# AQEFAASCAQCCkoa9mL5jayblS3+VcS9F4DNkrmOBlFIKQqz8Pxvu4YHRtmnOwtZb
# aNNfoN/EIh5jHa21DfeuKBrnkcKs4PfF83eF/Zb4t1EsZYN4cJgH54BAMAhqlrRR
# r0ZT7AfhULgsQ2aVUAFW6GSh+HlJvLUX3+5L+2vksc34K3YTFyAyU/qnFuAjcBE0
# VKlSUS6q3VJ7ZApto69OrT0u/rFlarUsFk4Y/NAXlkRtYEX0mK+vfA7Sur08OQcm
# V91R8KN9w0ewQ1yMxNE1iAT7mxwpI+BOEI2Q351h0kkpiTx3TMbk1DlhlBfF+U4J
# 46Twd9jJSOvNaO0aNdWv5lj1xKu3j/C/oYICDzCCAgsGCSqGSIb3DQEJBjGCAfww
# ggH4AgEBMHYwYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZ
# MBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgQXNz
# dXJlZCBJRCBDQS0xAhADAZoCOv9YsWvW1ermF/BmMAkGBSsOAwIaBQCgXTAYBgkq
# hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTAzMTMxOTQ5
# MzJaMCMGCSqGSIb3DQEJBDEWBBQl1MnLDSrKquXHQmIC7SZuukQ+QTANBgkqhkiG
# 9w0BAQEFAASCAQCdwXHJjFPWBzYohMlDBVc6q31u48Mrnr//oYLGwzY42yyD+pn3
# sCxj6VOCqXCypltlLMFy06JWcZ4UWNMtRUR4FYD/QPCXHbmHBMWa0KC6DBhmm0fd
# 9sZceddu0zNT15UIrAyJlXf9WggRikcBQEWpTseFGgfvFNuJFSw/ks22zR86xfuG
# QqWpUu4oYJJMMCMnrgNtk/kmfMPfEiW2HjqWAWzj9cAkRIcmuPifXxRists2cLi9
# TqFFxpND6bhrYD6cCdxhSJpYRIF1AKg9zscB3JlI9p+WRBhNw3x0y5RLSXppzlVv
# T/Vat75AJ9ysB6oanMfDILI+MAVfBvgjkZOx
# SIG # End signature block
