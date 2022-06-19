const String getWiki =
    '''resource/Wiki?fields=["name","title","content","published","available_to_members","wiki_type"]''';
const String loginRoute = '''method/login''';
const String baseUrl = '''https://beta.afms.com.ph/api''';
const String getMemberProfile =
    '''resource/Member?fields=["name","date_joined","first_name","last_name","frappe_user","phone","full_address"]''';
const String GET_meetings =
    '''resource/Meeting?fields=["name","title","agenda","meeting_date","notify_all_employees","creation"]''';
const String GET_filtered_meeting_minutes =
    '''resource/Meeting Log?fields=["name","meeting","log_entry","creation"]&filters=[["meeting","=",""]]''';
const String getOfferedServicesurl =
    '''resource/Service?fields=["name","title","published","description","author","creation","terms_and_conditions","type","roi_percentage_on_capital_investment","fixed_return_amount","has_fixed_return","tenure_length_months"]''';
const String GET_Alltasks =
    '''resource/Task?fields=["name","status","date","priority","owner","description","reference_type","reference_name","role","assigned_by","assigned_by_full_name"]''';
const String GET_Todotasks =
    '''resource/Task?fields=["name","status","date","priority","owner","description","reference_type","reference_name","role","assigned_by","assigned_by_full_name"]&filters=[["status","=","Open"]]''';
const String GET_Donetasks =
    '''resource/Task?fields=["name","status","date","priority","owner","description","reference_type","reference_name","role","assigned_by","assigned_by_full_name"]&filters=[["status","=","Closed"]]''';
const String GET_Bymetasks =
    '''resource/Task?fields=["name","status","date","priority","owner","description","reference_type","reference_name","role","assigned_by","assigned_by_full_name"]''';
const String PUT_Taskstatus = '''resourse/Task/TASK0001''';
const String GET_notifications =
    '''resource/Notification Log?fields=["name","subject","email_content","for_user","type","read","from_user","creation"]''';

const String serviceWiki =
    '''resource/Wiki/?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]&filters=[["wiki_type","=","Services"]]''';
const String membershipWiki =
    '''resource/Wiki/?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]&filters=[["wiki_type","=","Memberships"]]''';
const String discountWiki =
    '''resource/Wiki/?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]&filters=[["wiki_type","=","Discounts"]]''';

const String insuranceWiki =
    '''resource/Wiki/?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]&filters=[["wiki_type","=","Insurance"]]''';
const String getMemProfileInfo =
    '''resource/Member?fields=["name","date_joined","first_name","last_name","frappe_user","phone","full_address"]&filters=[["name","=","MEMBER0001"]]''';
const String contactInfoFetchedMember =
    '''resource/Member?fields=["first_name","last_name","frappe_user","phone"]&filters=[["first_name","=","Adam"]]''';
const String Get_MemberInfo =
    '''resource/Employee?fields=["name","first_name","last_name","frappe_user","designation","profile_picture","full_name"]''';
