using Plugin.Fingerprint;
using Plugin.Fingerprint.Abstractions;

namespace Bank.MobileUI.Services;

public static class SecurityService
{
    public static async Task<bool> AuthenticateUserAsync(string reason)
    {
        var request = new AuthenticationRequestConfiguration("Segurança", reason)
        {
            AllowAlternativeAuthentication = true // Permite PIN se a biometria falhar
        };

        var result = await CrossFingerprint.Current.AuthenticateAsync(request);
        return result.Authenticated;
    }
}