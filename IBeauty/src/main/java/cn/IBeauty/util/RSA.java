package cn.IBeauty.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

public class RSA {
	static PublicKey pubkey;
	static PrivateKey prikey;
	String mingwen;
	String miwen;
	static String cs;
	static byte[] mt;
	String signature;
	static String ori;

	public static void getkey() {
		KeyPairGenerator k;
		try {
			k = KeyPairGenerator.getInstance("RSA");
			k.initialize(1024);
			KeyPair key = k.genKeyPair();
			pubkey = key.getPublic();
			prikey = key.getPrivate();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static PublicKey getPubkey() {
		return pubkey;
	}

	public static PrivateKey getPrikey() {
		return prikey;
	}

	public static String Encryp(String message,RSAPublicKey pubkey){
		BigInteger e=pubkey.getPublicExponent();
		BigInteger n=pubkey.getModulus();
		byte ptext[];
		try {
			ptext = URLEncoder.encode(message,"UTF8").getBytes("UTF8");
			BigInteger m=new BigInteger(ptext); 
			BigInteger c=m.modPow(e,n);
			cs=c.toString( );
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}		
		return cs;
	}
	
	public static String Decryp(String cipher,RSAPrivateKey prikey){
		BigInteger d=prikey.getPrivateExponent();
		BigInteger n=prikey.getModulus();
		BigInteger c=new BigInteger(cipher);
		BigInteger m=c.modPow(d,n);
		mt=m.toByteArray();
		try {
			ori=URLDecoder.decode(new String(mt), "UTF8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ori;
	}

	public String jiami(String ciphadd,String pubkeyadd,String mingwen1) {
		FileInputStream f;
		try {
			f = new FileInputStream(pubkeyadd+"\\publickey.txt");
			ObjectInputStream b=new ObjectInputStream(f); 
			RSAPublicKey key=(RSAPublicKey)b.readObject(); 
			BigInteger e=key.getPublicExponent();
			BigInteger n=key.getModulus(); 
			byte ptext[]=URLEncoder.encode(mingwen1,"UTF8").getBytes("UTF8");
			BigInteger m=new BigInteger(ptext); 
			BigInteger c=m.modPow(e,n);
			cs=c.toString( );
			BufferedWriter out=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(ciphadd+"\\ciphertext.txt")));  
			out.write(cs,0,cs.length( )); 
			out.close( ); 
			b.close();		
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return cs;
	}

	public byte[] jiemi(String originadd,String prikeyadd, String miwen) {
		BigInteger c;
		FileInputStream f;
		try {
			c=new BigInteger(miwen);
			f = new FileInputStream(prikeyadd);
			ObjectInputStream b=new ObjectInputStream(f); 
			RSAPrivateKey prk=(RSAPrivateKey)b.readObject(); 
			BigInteger d=prk.getPrivateExponent();
			BigInteger n=prk.getModulus(); 
			BigInteger m=c.modPow(d,n);  
			mt=m.toByteArray();
			String ori=URLDecoder.decode(new String(mt), "UTF8");
			File fo = new File(originadd+"\\origin.txt");
			FileOutputStream fos = new FileOutputStream(fo,false);
			OutputStreamWriter fosf =new OutputStreamWriter(fos);
			fosf.write(ori);
			fosf.flush();
			fosf.close();
		    fos.close();
		    b.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return mt;
	}

	public String createsign(String prikeyadd,String message) {
		try {
			FileInputStream f;
			f = new FileInputStream(prikeyadd);
			ObjectInputStream b = new ObjectInputStream(f);
			RSAPrivateKey prk = (RSAPrivateKey) b.readObject();
			Signature sig = Signature.getInstance("SHA1WithRSA");
			sig.initSign(prk);
			byte[] msgBytes = message.getBytes();
			sig.update(msgBytes);
			byte[] signatureBytes;
			signatureBytes = sig.sign();
			signature = new String(signatureBytes);	
		} catch (SignatureException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return signature;
	}
	
	public void verifysign(String pubkeyadd,String signadd,String message){
		FileInputStream f;
		FileInputStream s;
		try {
			f = new FileInputStream(pubkeyadd);
			ObjectInputStream b = new ObjectInputStream(f);
			RSAPublicKey puk = (RSAPublicKey) b.readObject();
			s=new FileInputStream(signadd);
			ObjectInputStream c=new ObjectInputStream(s);
			Signature sig=(Signature) c.readObject();
			BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(
					signadd)));
			String sign =in.readLine();
			sig.initVerify(puk);
			byte[] msgBytes=message.getBytes();
			sig.update(msgBytes);
			byte[] signature=sign.getBytes();
			if(sig.verify(signature)){
				System.out.println("�ɹ�");
			}else{
				System.out.println("ʧ��");
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SignatureException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
