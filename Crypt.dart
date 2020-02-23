import 'dart:convert';
import 'dart:math';

class Crypt {
  static String key=
      "Your-key-here";
  static String rev(String s) {
    return s
        .split('')
        .reversed
        .join();
  }
  static String sh(String s, int d) {
    int g = 1;
    var ns = new List(1000000);
    for (int i = 0; i < s.length; i++) {
      if (g > d) {
        g = 1;
      }
      if (ns[g] == null) {
        ns[g] = '';
      }
      if (s[i] != '') {
        ns[g] += s[i];
      }
      g++;
    }
    String r = '';
    for (int a = 1; a <= d; a++) {
      r += ns[a] + '';
    }
    return r;
  }
  static String unsh(String s,int l) {
    int c = 0;
    int a = 0;
    var arr = new List(1000000);
    for (int i = 0; i < s.length; i++) {
      arr[c] = s[i];
      if (c < (s.length - l)) {
        c += l;
      } else {
        a++;
        c = a;
      }
    }
    String r = '';
    for (int i = 0; i < s.length; i++) {
      r = r + '' + arr[i] + '';
    }
    return r;
  }
  static String cesar(String s, int n, bool rv) {
    var matrix = new List(2);
    matrix[0] = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
    matrix[1] = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String r = "";
    for (int a = 0; a <= 1; a++) {
      String m = matrix[a];
      r = "";
      for (int i = 0; i < s.length; i++) {
        int p = m.indexOf(s[i]);
        int sm;
        if (p >= 0) {
          if (rv) {
            sm = (p) - n;
          } else {
            sm = (p) + n;
          }
          while (sm >= 52) {
            sm -= 26;
          }
          while (sm < 0) {
            sm += 26;
          }
          r += m[sm];
        } else {
          r += s[i];
        }
      }
      s = r;
    }
    return r;
  }
  static int sumString(String s) {
    int sum = 0;
    for (int i = 1; i < s.length; i++) {
      sum += 1;
    }
    return sum + s.length;
  }
  static int charVal(String c) {
    String m = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int p = m.indexOf(c);
    if (p > 0) {
      return p;
    }
    return 0;
  }
  static String viginere(String s, String k, bool rv) {
    int kl = k.length;
    int cn = 0;
    String r = "";
    for (int i = 0; i < s.length; i++) {
      if (cn == kl) {
        cn = 0;
      }
      r += cesar(s[i], charVal(k[cn]), rv);
      cn++;
    }
    return r;
  }
  static String randString(int n) {
    String m='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    int l = m.length;
    var rng = new Random();
    String r='';
    for (var i = 0; i < n; i++) {
      r+=m[rng.nextInt(l)];
    }
    return r;
  }
  static String b64encode(String str) {
    return base64.encode(utf8.encode(str));
  }
  static String b64decode(String str) {
    return utf8.decode(base64.decode(str));
  }
}
