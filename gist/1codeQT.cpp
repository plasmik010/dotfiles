
QObject::connect(timer, SIGNAL(timeout()), this, SLOT(upd_lcd_self()));
QObject::connect(ui->pb_work, &QPushButton::pressed, std::bind(&QTimer::stop, timer));
QObject::connect(pw, &SoWorker::ulov, [&](bool ulov) {
        printf(ulov) });

QTimer::singleShot(50, this, [&]() {
    //do stuff
    });

QTimer::singleShot(50, this, [&]() { fun(); });

QString qq = QString::fromUtf8(u8"фыва");


uint64_t thid = (uint64_t)QThread::currentThreadId();
QString thstr(" @ th_" + QString::number(thid));

log_msg =  QString("MyClass Ctor  @ th_id ") + QString("0x%1").arg((long int)QThread::currentThreadId(), 20, 16, QChar('0'));

m_ipEdit = new QLineEdit(this);
QString IpRange = "(?:[0-1]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])";
QRegularExpression IpRegex("^" + IpRange
    + "(\\." + IpRange + ")"
    + "(\\." + IpRange + ")"
    + "(\\." + IpRange + ")$");
QRegularExpressionValidator* ipValidator = new QRegularExpressionValidator(IpRegex, this);
m_ipEdit->setValidator(ipValidator);
//
auto portValidator = new QIntValidator(1, 65535, this);
m_portEdit->setValidator(portValidator);

QFrame* CommandExecuterGui::composeHorizLine(int h = 2) {
    auto result = new QFrame();
    result->setFrameShape(QFrame::HLine);
    result->setFrameShadow(QFrame::Sunken);
    result->setFixedHeight(h);
    result->setStyleSheet(QString("background-color: #666;"));
    return result;
}

bool test = true;
QString s = QVariant(test).toString(); // "true"

QSettings settings("setting_commandExecuter.ini", QSettings::IniFormat);
QStringList keys = settings.allKeys();
for (int i = 0; i < keys.size(); i++) {
    auto k = keys.at(i).toUtf8();
    QString ks(k);
    std::cout << i << " " << k.toStdString() << " " << settings.value(k).toString().toStdString() << std::endl;
    //if (ks == "devId") { m_devId = settings.value(k).toString().toInt(); }
}
//if (settings.contains("devId")) { m_devId = settings.value("devId").toString().toInt(); }
m_LuaExec = settings.value("Exec/Lua").toString();
m_devId = settings.value("devId").toString().toInt();

   
if (!QFileInfo::exists(scce->m_pythScriptDef))
{
    scce->m_fileSet = false;
    QString userInputString;
    if (!scce->m_fileSet) {
        userInputString = QFileDialog::getOpenFileName(nullptr,
            tr("Open script to execute"), ".", tr("*.py"));
    }
    if (!userInputString.isEmpty()) {
        scce->m_pythScriptDef = userInputString;
        scce->m_fileSet = true;
    }
}


ByteArray ba1 {"\x38\x39\x42\x01\xA8"};
QByteArray ba2 = QByteArrayLiteral("\x38\x39\x42\x01\xA8");
Stuff::ByteArray ba3{0x38,0x39,0x42,0x01,0xA8};
const QByteArray requestData0 = QByteArray::fromHex("EE6FBB581BB000000000000000000000000000000000000000000000000005D7171B");
std::cout << koef_hex.toHex().toStdString();


void reverseBytearray(QByteArray& ba, int dist) {
    if (ba.size() == 0 || dist<2 )
        return;
    // Добить нулями до размера 'dist'
    int tail = ba.size() % dist;
    if (tail > 0) {
        //QByteArray addendum = QByteArray(dist - tail, 0x00);
        ba.append(dist-tail,0x00);
    }
    // Развернуть каждый кусок размером в 'dist' байтов
    int parts = ba.size() / dist;
    for (int i = 0; i < parts; i++) {
        std::reverse(ba.begin() + dist * i, ba.begin() + dist * (i + 1));
    }
}

void reverse8bits(unsigned char& b) {
    b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
    b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
    b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
}
void reverse8bits(QByteArray& ba) {
    // reverse bits inside every byte
    int size = ba.size();
    for (int i = 0; i < size; i++) {
        char& element = ba[i];
        unsigned char& element_uc = reinterpret_cast<unsigned char&>(element);
        reverse8bits(element_uc);
    }
}

quint32 byteArrayToUint32(const QByteArray& ba)
{
    auto count = ba.size();
    if (count == 0 || count > 4) {
        return 0; // BAD!
    }
    quint32 number = 0U;
    for (int i = 0; i < count; ++i) {
        auto b = static_cast<quint8>(ba[count - 1 - i]);
        number += static_cast<quint32>(b << (8 * i));
    }
    return number;
}

ba1 is constructed from a C-style string literal using QByteArray::QByteArray(const char *data, int size = -1). ba2 is probably the most efficient, see QStringLiteral explained and Qt Weekly #13: QStringLiteral. For ba3 we use a small helper class that extends QByteArray:

QString::number(myNumber,16).rightJustified(5, '0');

namespace Stuff
{
    struct ByteArray: public QByteArray
    {
        ByteArray(std::initializer_list<unsigned char> lst)
            : QByteArray(reinterpret_cast<char const *>(lst.begin()), lst.size())
        {}
    };
}


std::tuple<QString, QString> TNDiag::LuaCall(QString scriptfilename, QString args) {
    const QString LuaExecPath("../third_part/Lua/lua54.exe");

    QProcess cmd;
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    QProcessEnvironment envUpdate;
    envUpdate.insert("PATH", env.value("PATH"));
    cmd.setProcessEnvironment(envUpdate);

    args = args.simplified(); //remove excessive whitespaces
    QStringList arglist = args.split(' ');
    arglist = QStringList(scriptfilename) + arglist;
    //QString diag_cwd = QDir::currentPath();

    cmd.start(LuaExecPath, arglist);
    cmd.waitForFinished();
    QString stdout_ = cmd.readAll();
    QString stderr_ = cmd.readAllStandardError();

    return std::make_tuple(stdout_, stderr_);
}

QTextStream data(&m_File);
data << text + '\n';

void TNDiag::slot_sayFail() {
    // Сообщать о фэйле не чаще раз в 3 сек
    static auto tpPrev = std::chrono::steady_clock::time_point(std::chrono::milliseconds(0));
    auto tpNow = std::chrono::steady_clock::now();
    long int dur_ms = std::chrono::duration_cast<std::chrono::milliseconds>(tpNow - tpPrev).count();
    tpPrev = tpNow;
    if (dur_ms > 3000) {
        QMessageBox::information(NULL, QString("Ошибка"), QString("Нет ответа от прибора"));
    }
}


int result;
QEventLoop waitLoop;
const auto signalReceived = [&result, &waitLoop](bool b)->void {
    result = b;
    if (waitLoop.isRunning()) {
        waitLoop.quit();
    }
    };
const auto ethFailed = [&result, &waitLoop]()->void {
    result = 10;
    if (waitLoop.isRunning()) {
        waitLoop.quit();
    }
    };
const auto lambda1 = [&result, &waitLoop]() {
    result = 20;
    //emit m_parent->signal_fizRTsw(false);
    if (waitLoop.isRunning()) {
        waitLoop.quit();
    }
};
QTimer* sstimer;
sstimer = new QTimer();
sstimer->setSingleShot(true);
auto con1 = connect(m_parent, &TNDiag::signal_fizRTsw, signalReceived);
auto con2 = connect(m_parent, &TNDiag::signal_inits_Failed, initsFailed);
auto con3 = connect(sstimer, &QTimer::timeout, lambda1);
sstimer->start(timeout);
emit m_parent->signal_readSwitches();
waitLoop.exec();  // Blocking wait in new event loop..
QObject::disconnect(con1);
QObject::disconnect(con2);
QObject::disconnect(con3);
delete sstimer;


