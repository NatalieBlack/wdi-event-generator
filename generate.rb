require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require_relative 'cohort'


OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'WDI Event Generator'
CLIENT_SECRETS_PATH = 'client_id.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "calendar-ruby-quickstart.yaml")
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR

LECTURE_START_TIME = 10
LECTURE_END_TIME = 12
COFFEE_CODE_START_TIME = 9 
COFFEE_CODE_END_TIME = 10
##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(
      base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
  end
  credentials
end

# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

calendar_id = 'bitmakerlabs.com_i2oth2018vdn6rlu96215j76ms@group.calendar.google.com'
cohort = Cohort.new(Date.new(2016,10,17))

cohort.lectures.each do |lecture|
  d = lecture.date
  tzoffset = (d.to_time.utc_offset/60/60).to_s
  st_dt = DateTime.new(d.year, d.month, d.day,LECTURE_START_TIME,0,0,tzoffset)
  ft_dt = DateTime.new(d.year, d.month, d.day,LECTURE_END_TIME,0,0,tzoffset)
  st = Google::Apis::CalendarV3::EventDateTime.new(date_time: st_dt.rfc3339)
  fn = Google::Apis::CalendarV3::EventDateTime.new(date_time: ft_dt.rfc3339)
  event = Google::Apis::CalendarV3::Event.new(start: st, end: fn, summary: "Lesson #{lecture.number + 1}: #{lecture.title}")
  service.insert_event(calendar_id, event)
end

cohort.coffee_code_days.each do |d|
  tzoffset = (d.to_time.utc_offset/60/60).to_s
  st_dt = DateTime.new(d.year, d.month, d.day,COFFEE_CODE_START_TIME,0,0,tzoffset)
  ft_dt = DateTime.new(d.year, d.month, d.day,COFFEE_CODE_END_TIME,0,0,tzoffset)
  st = Google::Apis::CalendarV3::EventDateTime.new(date_time: st_dt.rfc3339)
  fn = Google::Apis::CalendarV3::EventDateTime.new(date_time: ft_dt.rfc3339)
  event = Google::Apis::CalendarV3::Event.new(start: st, end: fn, summary: "Coffee and Code")
  service.insert_event(calendar_id, event)
end
