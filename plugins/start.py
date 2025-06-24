from pyrogram import Client, filters

   @Client.on_message(filters.command("start") & filters.private)
   async def start_handler(client, message):
       if len(message.command) > 1:
           arg = message.command[1]
           if arg.startswith("search_"):
               query = arg.replace("search_", "")
               await message.reply_text(f"🔎 നിങ്ങൾ തിരഞ്ഞത്: *{query}*")
           else:
               await message.reply_text("✨ Welcome to the bot!")
       else:
           await message.reply_text("🌟 Use /start search_MovieName")