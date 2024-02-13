package security;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordHash {
    public String createHashedPassword(String password) throws NoSuchAlgorithmException {
        byte[] bytes = new byte[16];
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
        messageDigest.update(bytes);
        byte[] digest = messageDigest.digest(password.getBytes(StandardCharsets.UTF_8));
        StringBuilder stringBuilder = new StringBuilder();
        for (byte input : digest) {
            stringBuilder.append(String.format("%02x", input));
        }
        return stringBuilder.toString();
    }

    public boolean checkEqualityOfHashedPassword(String enteredPassword, String dataBasePassword) throws NoSuchAlgorithmException {
        return dataBasePassword.equals(createHashedPassword(enteredPassword));
    }
}
