const phoneNumberRgx = r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';

validatePhoneNumber(String phone) => !RegExp(phoneNumberRgx).hasMatch(phone);
