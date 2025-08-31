{ ... }:
{
    home-manager.users."snbohman" = {
        imports = [
            ../hm
        ];
    };
}
