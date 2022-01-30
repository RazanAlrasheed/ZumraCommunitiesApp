import SwiftUI

struct ChatView: View {
    
    @StateObject var viewModel = ChatsViewModel()
    let chats = Chat.sampleChat
    
    @State private var query = "" //00
    
    
    var body: some View {
        
        
            List {
                ForEach(viewModel.getSortedFilteredChats(query: query)) { chat in
                    
                    
                    ZStack{
                        
                        
                        ChatRow(chat: chat)
                        
                        
                        NavigationLink(destination: {
                            
                            insideChatView(chat: chat)
                                .environmentObject(viewModel)
                            
                            
                        } ) {
                   
                            EmptyView()
                        }
                  
                        .buttonStyle(PlainButtonStyle())
                        .frame(width:0)
                        .opacity(0)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            viewModel.marksAsUnread(!chat.hasUnreadMessage, chat: chat)
                        } label: {
                            if chat.hasUnreadMessage {
                                Label("Read" , systemImage: "text.bubble")
                        }
                            else{
                                Label("Unread" , systemImage: "circle.fill")
                            }

                        }
                        .tint(Color("AccentColor"))
                    }
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query) //00
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "square.and.pencik")
            }
                                
                                
                                
            )
            
        }

}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


struct Chat: Identifiable {
    var id: UUID {  person.id  }
    let person: Person
    var massages: [Massage]
    var hasUnreadMessage = false
}



struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}


struct Massage: Identifiable {
    enum MessageType {
        case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String , type: MessageType , date: Date){
        self.date = date
        self.text = text
        self.type = type
    }
    
    init(_ text: String , type: MessageType ){
        self.init(text,type: type , date: Date())
    }

}

extension Chat {
    static let sampleChat = [
    
    
        Chat(person: Person(name: "Hakim" , imgString: "img1"), massages: [
        
            Massage("Hey Hakim" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 3)) ,
            Massage("I am just developing an WhatsApp Clone app and it is so hard to create a fake chat conversation. Can you help me out with it?" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 3)) ,
            Massage("Please I need your help😔" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 3)) ,
            Massage("Sure how can i help you flo?" , type: .Received , date: Date(timeIntervalSinceNow: -86400 * 2)) ,
            Massage("Maybe you send me some \"good\" jokes😅" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 2)) ,
            Massage("Sure I can do that. no problem😂" , type: .Received , date: Date(timeIntervalSinceNow: -86400 * 2)) ,
            Massage("What do you call a fish with no eyes?" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 1)) ,
            Massage("Hmm, idk" , type: .Received , date: Date(timeIntervalSinceNow: -86400 * 1)) ,
            Massage("A fsh" , type: .Received , date: Date(timeIntervalSinceNow: -86400 * 1)) ,
            Massage("OMG so bad 😂😂" , type: .Received , date: Date(timeIntervalSinceNow: -86400 * 1)) ,
            Massage("Let me try one" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 1)) ,
            Massage("There are 10 types of people in this world, those who understand binary and those who don't" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 1)) ,
            Massage("This joke is sooo old hahaha" , type: .Received , date: Date())
        
        
        ] , hasUnreadMessage: true),
        
            Chat(person: Person(name: "Vladimir W." , imgString: "img6"), massages: [
            
                Massage("Hey Vlad, how is your bootcamp going?" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 5)) ,
                Massage("It's going great flo. I have just finished my first app, but I still have a lot to learn, but coding is so much fun. I love it :)" , type: .Received , date: Date(timeIntervalSinceNow: -86400 * 3)) ,
                Massage("Hey that sounds great, Congratualtions Vlad🥳" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 2)) ,
                Massage("What type of app is it?" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 2)) ,
                Massage("It's a Community groups app" , type: .Sent , date: Date()) ,
                Massage("The big question now is if I should start a junior dev job or if i should do app development just for fun" , type: .Sent , date: Date()) ,
            
            ] ) ,
        
        Chat(person: Person(name: "Anrej" , imgString: "img7"), massages: [
        
            Massage("Hey Sensei 👋 " , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 3)) ,
            Massage("Can you show me a new Meditation exercise? The last one was so helpfull!" , type: .Received , date: Date(timeIntervalSinceNow: -86400 * 3)) ,
            Massage("Yeag syre flo. Have you tested the mindful breating techniques yet?" , type: .Received , date: Date(timeIntervalSinceNow: -86400 * 2)) ,
            Massage("What type of app is it?" , type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 2)) ,
            Massage("No. What is it?" , type: .Sent , date: Date()) ,
            Massage("This teqnique can increase your energy and help you to feel most alert" , type: .Received , date: Date()) ,
        
        ] , hasUnreadMessage: true) ]
}


extension Date {
    
    func descriptiveString(dataStyle: DateFormatter.Style = .short) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = dataStyle
        
        let daysBetween = self.daysBetween(date: Date())
        
        if daysBetween == 0 {
            return "Today"
        }
        else if daysBetween == 1 {
            return "Yesterday"
        }
        else if daysBetween < 5 {
            let weekdayIndex = Calendar.current.component(.weekday , from: self) - 1
            return formatter.weekdaySymbols[weekdayIndex]
        }
        return formatter.string(from: self)
    }
    
    func daysBetween(date:Date) -> Int {
        let calander = Calendar.current
        let date1 = calander.startOfDay(for: self)
        let date2 = calander.startOfDay(for: date)
        if let daysBetween = calander.dateComponents([.day], from: date1 , to: date2).day
        {
            return daysBetween }

    
    return 0
    }
}

class ChatsViewModel: ObservableObject {
    
    @Published var chats = Chat.sampleChat
    
    func getSortedFilteredChats(query: String) -> [Chat] {
        let sortedChats = chats.sorted {
            guard let date1 = $0.massages.last?.date else { return false }
            guard let date2 = $1.massages.last?.date else { return false }
            return date1 > date2
        }
        
        if query == "" {
            return sortedChats
        }
        return sortedChats.filter { $0.person.name.lowercased().contains(query.lowercased())}
    }
    
    
    func marksAsUnread(_ newValue: Bool , chat:Chat) {
        
        if let index = chats.firstIndex(where: { $0.id == chat.id }){
            chats[index].hasUnreadMessage = newValue
        }
    }

    
    func sendMessage(_ text:String , in chat: Chat) -> Massage? {
        
        if let index = chats.firstIndex(where: {$0.id == chat.id}){
            let message = Massage(text,type: .Sent)
            chats[index].massages.append(message)
            return message
        }
        return nil
    }
    
}


struct insideChatView: View {
    
    @EnvironmentObject var viewModel : ChatsViewModel
    let chat: Chat
    
    @State private var text = ""
    @FocusState private var isFoucsed
    @State private var messageIDToScroll: UUID?
    
    var body: some View {
        VStack(spacing:0){
            GeometryReader { reader in
                ScrollView {
                    
                    ScrollViewReader { scrollReader in
                        getMessageView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDToScroll) { _ in
                                if let messageID = messageIDToScroll {
                                    scrollTo(messageID: messageID,  shouldAnimate: true, scrollReader: scrollReader)
                                }
                            }
                            .onAppear{
                                if let messageID = chat.massages.last?.id {
                                    scrollTo(messageID: messageID, anchor: .bottom, shouldAnimate: false, scrollReader: scrollReader)
                                }
                            }
                    }
                 
                }
            }
            .padding(.bottom, 5)
            
            
            toolbarview()
        }
        .padding(.top , 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navBarLeadingBtn , trailing: navBarTrailingBtn)
            .onAppear{
                viewModel.marksAsUnread(false, chat: chat)
            }
    }
    
    
    var navBarLeadingBtn: some View{
        Button(action: {} ){
            HStack{
                Image(chat.person.imgString)
                    .resizable()
                    .frame(width:40 , height:40)
                    .clipShape(Circle())
                
                Text(chat.person.name).bold()
            }
            .foregroundColor(.black)
        }
    }
    
    var navBarTrailingBtn: some View{
        HStack {
        Button(action: {} ){
           Image(systemName: "video")
        }
            
            Button(action: {} ){
                Image(systemName: "phone")
            }
    }
}
    
    func scrollTo(messageID : UUID , anchor: UnitPoint? = nil , shouldAnimate: Bool , scrollReader: ScrollViewProxy) {
        
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil){
                scrollReader.scrollTo(messageID, anchor: anchor )
            }
        }
    }
    
    func toolbarview() -> some View {
        
        VStack{
            
            let height: CGFloat = 37
            
            HStack {
                TextField("Message ...", text: $text)
                    .padding(.horizontal)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFoucsed)
                
                Button(action: { sendMessage() } ) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width:height , height: height)
                        .background(
                        
                       Circle()
                        .foregroundColor(text.isEmpty ? .gray : .blue)
                        
                        )
                }
                
                .disabled(text.isEmpty)

            }
            .frame(height: height)
            
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
        
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func sendMessage(){
        if let message = viewModel.sendMessage(text, in: chat) {
            text = ""
            messageIDToScroll = message.id
        }
    }
    
    func getMessageView(viewWidth : CGFloat) -> some View {
        LazyVGrid(columns:columns , spacing: 0) {
            ForEach(chat.massages) { message in
                let isRecived = message.type  == .Received
                HStack {
                    ZStack {
                    Text(message.text)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(isRecived ? Color.black.opacity(0.2) : .green.opacity(0.9))
                            .cornerRadius(13)
                    }
                    .frame(width: viewWidth * 0.7 , alignment : isRecived ? .leading : .trailing )
                    .padding(.vertical)
                 //   .background(Color.blue)
                }
                .frame(maxWidth: . infinity , alignment: isRecived ? .leading : .trailing)
                .id(message.id)
                
            }
        }
    }
}

struct insideChatView_Previews: PreviewProvider {
    static var previews: some View {
        insideChatView(chat: Chat.sampleChat[0])
            .environmentObject(ChatsViewModel())
    }
}
