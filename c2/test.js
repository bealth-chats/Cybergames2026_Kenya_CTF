const tok = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsInJvbGUiOiJhZG1pbiJ9.LX-atl-MwNSvuTpqYnhDiNe3UBX1BwDBH-iQ_r_0258";
console.log(tok);

// The vulnerable part:
// let sb64 = s.replace(/-/g, '+').replace(/_/g, '/');
// if(sb64 == "LX+atl+MwNSvuTpqYnhDiNe3UBX1BwDBH+iQ/r/0258") return false;

// If we pass in a valid signature but format the base64url differently,
// can we bypass the string check? No, the signature is exact.

// What if the server allows token without signature?
